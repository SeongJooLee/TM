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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.service.TravelService;
import com.hk.tm.board.vo.CategoryVO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.TravelImageVO;
import com.hk.tm.board.vo.TravelVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value="/board/")
public class TravelController {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);


	@Autowired
	TravelService travelService;	
	
	String REPO = "C:\\files";
	
	@RequestMapping(value="travel" , method = {RequestMethod.GET, RequestMethod.POST}) 
		public String travelList(Model model) {
		
		List<TravelImageVO> list = travelService.selectAllTravelImage();
		
		model.addAttribute("travel", list);
		//logger.debug("---------/list called");
		return "travelList"; //travelList.jsp 호출
	}
	
	@RequestMapping(value="travel/view" , method=RequestMethod.GET)
	public String travelView(Model model , @RequestParam("travelNO") int travelNO) {
		
		Map<String,Object> map = travelService.selectOneTravel(travelNO); // 여기 문제
		
		model.addAttribute("travel", map.get("travel"));		
		model.addAttribute("image",map.get("image"));
		
		System.out.println("여기는 view +"+ map.get("travel").toString());
		return "travelView"; // travelView.jsp 호출
		
	}
	
	@RequestMapping(value="travel/add" ,  method=RequestMethod.GET)
	public String travelAdd(Model model) {			
		return "travelAdd"; // travelAdd.jsp 호출
		
	}
	
	@RequestMapping(value="travel/addDone" ,  method=RequestMethod.POST)
	public void travelAddDone(@ModelAttribute TravelVO travelVO, @ModelAttribute CategoryVO categoryVO, MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws Exception, ServletException {
		
		//logger.debug("title", travelVO.getTitle());
		//logger.debug("content", travelVO.getContent());
		
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			//System.out.println(name+", "+value);
			map.put(name,value);
		}
		//upload 빨간줄 처리
		List fileList= upload(request);
		map.put("fileList", fileList);
				
		ImageVO imageVO = new ImageVO();
		
		int travelNO = travelService.selectMaxTravel();
		travelNO++;
		
		travelVO.setTravelNO(travelNO);

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
		
		travelService.addTravel(travelVO, imageVO,categoryVO);
		
		for(int i=0;i < fileList.size(); i++) {
			if(fileList.get(i)!=null) {
				File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
				File destDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
				destDir.mkdir();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
	}
		
		response.sendRedirect("/board/travel");
	}

	
	@RequestMapping(value="travel/update" ,  method=RequestMethod.POST)
	public String travelUpdate(@ModelAttribute TravelVO travelVO, @ModelAttribute CategoryVO categoryVO, Model model, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception, ServletException {		
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
		imageVO.setNoticeNO(travelVO.getTravelNO());
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

		if(travelVO.getTravelNO()!=0) {
			File imgDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
			}
		}

		travelService.updateTravel(travelVO,imageVO,categoryVO);
		
		for(int i=0;i < fileList.size(); i++) {
			if(fileList.get(i)!=null) {
				File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
				File destDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
				destDir.mkdir();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
	}
		map = travelService.selectOneTravel(travelVO.getTravelNO());
		model.addAttribute("notice",map.get("notice"));
		model.addAttribute("image",map.get("image"));
		

		return "noticeView";
		
	}
	
	@RequestMapping(value="travel/delete" ,  method=RequestMethod.GET)
	public void addTravel(@RequestParam("travelNO") int travelNO, HttpServletResponse response) throws Exception {

		TravelVO travelVO = travelService.deleteTravel(travelNO);		
		File imgDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
		}
		response.sendRedirect("/board/travel"); 
	}
	
	@RequestMapping(value="/board/notice/imgDelete", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> imgDelete(@RequestParam("travelNO") int travelNO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		int ret = travelService.travelImgDelete(travelNO);
		if(ret==0) {
			map.put("result", "false");
		} else {
			map.put("result", "true");
			File imgDir = new File(REPO+"\\travel\\"+travelNO);
			File thumbnail = new File(REPO+"\\thumbnail\\travel");
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
				FileUtils.deleteDirectory(thumbnail);
			}
		}
		return map;			
}
	
	@RequestMapping(value="/travel/download", method=RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getParameter("image") != null) {
			
		request.setCharacterEncoding("utf-8");
		String image = request.getParameter("image");
		String travelNO = request.getParameter("travelNO");
		String name = request.getParameter("name");

		OutputStream out = response.getOutputStream();
		String path = "C:\\files\\"+name+"\\"+travelNO+"\\"+image;
		File imageFile = new File(path);

		int lastIndex = image.lastIndexOf(".");
		String fileName = image.substring(0,lastIndex);
		File destDir = new File(REPO+"\\thumbnail");
		File thumbnail = new File(REPO+"\\thumbnail\\"+name+"\\"+travelNO+"\\"+fileName+".png");
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
	private List<String> upload(MultipartHttpServletRequest request) throws ServletException, Exception{
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
