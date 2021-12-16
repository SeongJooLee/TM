package com.hk.tm.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.service.PromotionService;
import com.hk.tm.board.vo.CategoryVO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.PromotionVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class PromotionController {

	@Autowired
	PromotionService promotionService;

	String REPO = "C:\\files";

	@RequestMapping(value="/board/promotion", method= {RequestMethod.GET,RequestMethod.POST})
	public String promotionList(Model model) {
//		List<PromotionVO> list = promotionService.selectAllPromotion();
		List<PromotionImageVO> list = promotionService.selectAllPromotionImage();

		System.out.println("list 값들?"+list.toString());
		model.addAttribute("promotion",list);

		return "promotionList";
	}
	@RequestMapping(value="/board/promotion/view", method= RequestMethod.GET)
	public String promotionView(Model model,@RequestParam("promotionNO") int promotionNO) {
		Map<String,Object> map = promotionService.selectOneNotice(promotionNO);
		model.addAttribute("promotion",map.get("promotion"));
		model.addAttribute("image",map.get("image"));
		model.addAttribute("category",map.get("category"));
		
		return "promotionView";
	}
	
	@RequestMapping(value="/board/promotion/add", method=RequestMethod.GET)
	public String promotionAdd(Model model) {
		return "promotionAdd";
	}
	@RequestMapping(value="/board/promotion/addDone", method=RequestMethod.POST)
	public void promotionAddDone(@ModelAttribute PromotionVO promotionVO,@ModelAttribute CategoryVO categoryVO,MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws IOException, ServletException {
//		@RequestParam("categoryName") String categoryName
		request.setCharacterEncoding("utf-8");
		System.out.println("글쓰기 카테고리확인"+categoryVO.toString());
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			map.put(name,value);
		}
		List fileList= upload(request);
		map.put("fileList", fileList);

		ImageVO imageVO = new ImageVO();
		
		int promotionNO = promotionService.selectMaxPromotion();
		promotionNO++;
		promotionVO.setPromotionNO(promotionNO);
		 if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			if(fileList.get(2) == "") {
				imageVO.setImage3(null);
				fileList.remove(2);
			}
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			if(fileList.get(1) == "") {
				imageVO.setImage2(null);
				fileList.remove(1);
			}
		} if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
			if(fileList.get(0) == "") {
				imageVO.setImage1(null);
				fileList.remove(0);
			}
		}
		promotionService.promotionAdd(promotionVO,imageVO,categoryVO);
		
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					File destDir = new File(REPO+"\\"+promotionVO.getName()+"\\"+promotionVO.getPromotionNO());
					destDir.mkdir();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
		}
		response.sendRedirect("/tm/board/promotion");
	}
	
	@RequestMapping(value="/board/promotion/update", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute PromotionVO promotionVO,@ModelAttribute CategoryVO categoryVO,Model model,MultipartHttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration enu=request.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			map.put(name,value);
		}
		
		List fileList= upload(request);
		map.put("fileList", fileList);
		ImageVO imageVO = new ImageVO();
		imageVO.setPromotionNO(promotionVO.getPromotionNO());
		categoryVO.setPromotionNO(promotionVO.getPromotionNO());
		 if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			if(fileList.get(2) == "") {
				imageVO.setImage3(null);
				fileList.remove(2);
			}
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			if(fileList.get(1) == "") {
				imageVO.setImage2(null);
				fileList.remove(1);
			}
		} if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
			if(fileList.get(0) == "") {
				imageVO.setImage1(null);
				fileList.remove(0);
			}
		}

		if(promotionVO.getPromotionNO()!=0) {
			File imgDir = new File(REPO+"\\"+promotionVO.getName()+"\\"+promotionVO.getPromotionNO());
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
			}
		}

		promotionService.promotionUpdate(promotionVO,imageVO,categoryVO);
		
		for(int i=0;i < fileList.size(); i++) {
			if(fileList.get(i)!=null) {
				File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
				File destDir = new File(REPO+"\\"+promotionVO.getName()+"\\"+promotionVO.getPromotionNO());
				destDir.mkdir();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
	}
		
		map = promotionService.selectOneNotice(promotionVO.getPromotionNO());
		model.addAttribute("promotion",map.get("promotion"));
		model.addAttribute("image",map.get("image"));
		model.addAttribute("category",map.get("category"));
		
		return "promotionView";
		
	}
	@RequestMapping(value="/board/promotion/delete", method=RequestMethod.GET)
	public void promotionDelete(@RequestParam("promotionNO") int promotionNO, HttpServletResponse response) throws IOException {
		
		PromotionVO promotionVO = promotionService.promotionDelete(promotionNO);
		File imgDir = new File(REPO+"\\"+promotionVO.getName()+"\\"+promotionVO.getPromotionNO());
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
		}
		response.sendRedirect("/tm/board/promotion");
	}
	
	@RequestMapping(value="/board/promotion/imgDelete", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> imgDelete(@RequestParam("promotionNO") int promotionNO) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		int ret = promotionService.promotionImgDelete(promotionNO);
		if(ret==0) {
			map.put("result", "false");
		} else {
			map.put("result", "true");
			File imgDir = new File(REPO+"\\promotion\\"+promotionNO);
			File thumbnail = new File(REPO+"\\thumbnail\\promotion");
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
				FileUtils.deleteDirectory(thumbnail);
			}
		}
		return map;
	}	
	@RequestMapping(value="/board/promotion/download", method=RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("image") != null) {
			
		request.setCharacterEncoding("utf-8");
		String image = request.getParameter("image");
		String promotionNO = request.getParameter("promotionNO");
		String name = request.getParameter("name");

		OutputStream out = response.getOutputStream();
		String path = "C:\\files\\"+name+"\\"+promotionNO+"\\"+image;
		File imageFile = new File(path);

		int lastIndex = image.lastIndexOf(".");
		String fileName = image.substring(0,lastIndex);
		File destDir = new File(REPO+"\\thumbnail");
		File thumbnail = new File(REPO+"\\thumbnail\\"+name+"\\"+promotionNO+"\\"+fileName+".png");
		destDir.mkdir();
		
		if(imageFile.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(imageFile).size(500, 500).outputFormat("png").toFile(thumbnail);
		}
		
		FileInputStream in = new FileInputStream(thumbnail);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	}
	private List<String> upload(MultipartHttpServletRequest request) throws ServletException, IOException{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = request.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = request.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
					if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); //이후 파일 생성
					}
				}
				File destDir = new File(REPO +"\\temp\\");
				destDir.mkdir();
				mFile.transferTo(new File(REPO +"\\temp\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
			}
		}
		return fileList;
	}	
}

