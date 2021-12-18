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
import javax.servlet.http.HttpSession;

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

import com.hk.tm.board.service.ReviewService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.SelectPageVO;
import com.hk.tm.member.vo.UserVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	String REPO = "C:\\files";
	
	@RequestMapping(value = "/board/review", method= {RequestMethod.GET,RequestMethod.POST})
	public String reviewList(Model model) {
		List<ReviewVO> list = reviewService.boardAllList();
		
		int listCount = list.size(); //전체 게시물의 개수
		int listSize = 10; //한 페이지에 보일 갯수
		int page = (listCount+10)/listSize; //현재 목록의 페이지 번호
		
		int endList = 1*listSize;
		int startList = endList-9;
		
		SelectPageVO selectPageVO = new SelectPageVO();
		
		selectPageVO.setStartPage(startList);
		selectPageVO.setEndPage(endList);
		
		List<ReviewVO> selectList = reviewService.selectPageReview(selectPageVO);
		
		model.addAttribute("review",selectList);
		model.addAttribute("page",page);
		
		return "reviewList";
		
	}
	
	@RequestMapping(value = "/board/review/select", method= RequestMethod.GET)
	public String reviewSelectList(Model model,@RequestParam(value="selectPage",required=false) int selectPage) {
		List<ReviewVO> list = reviewService.boardAllList();
		
		int listCount = list.size(); //전체 게시물의 개수
		int listSize = 10; //한 페이지에 보일 갯수
		int page = (listCount+10)/listSize; //현재 목록의 페이지 번호

		int endList = 0;
		int startList = 0;

		endList = selectPage*listSize;
		startList = endList-9;
		
		SelectPageVO selectPageVO = new SelectPageVO();
		
		selectPageVO.setStartPage(startList);
		selectPageVO.setEndPage(endList);
		
		List<ReviewVO> selectList = reviewService.selectPageReview(selectPageVO);
		
		model.addAttribute("review",selectList);
		model.addAttribute("page",page);
		model.addAttribute("selectPage",selectPage);
		
		return "reviewList";
		
	}
	
	@RequestMapping(value="/board/review/add", method=RequestMethod.GET)
	public String reviewAdd(Model model,@RequestParam("promotionNO") int promotionNO) {
		System.out.println("해치웟나?"+promotionNO);
		
		model.addAttribute("promotionNO",promotionNO);
		
		return "userReviewAdd";
	}
	
	@RequestMapping(value="/board/review/view", method=RequestMethod.GET)
	public String reviewView(Model model,@RequestParam("reviewNO") int reviewNO,HttpSession session) {
		Map<String,Object> map = reviewService.selectOne(reviewNO);
		model.addAttribute("review",map.get("review"));
		model.addAttribute("image",map.get("image"));
		try {
			UserVO userVO = (UserVO)session.getAttribute("userSession");
			List<ReviewVO> list = reviewService.userReviewList(userVO);
			System.out.println("저장된 리스트 ="+list);
			model.addAttribute("list",list);
			
		} catch (Exception e) {
			System.out.println("오류발생");
		}
		return "reviewView";
	}
	
	@RequestMapping(value="/board/review/update", method=RequestMethod.POST)
	public String reviewUpdate(@ModelAttribute ReviewVO reviewVO,Model model,MultipartHttpServletRequest multi,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration enu=multi.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multi.getParameter(name);
			map.put(name,value);
		}
		
		List fileList= upload(multi);
		map.put("fileList", fileList);
		ImageVO imageVO = new ImageVO();
		imageVO.setReviewNO(reviewVO.getReviewNO());
		imageVO.setImage1(request.getParameter("image1"));
		imageVO.setImage2(request.getParameter("image2"));
		imageVO.setImage3(request.getParameter("image3"));

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

		/*
		 * if(reviewNO!=0) { File imgDir = new
		 * File(REPO+"\\"+reviewVO.getName()+"\\"+reviewVO.getReviewNO());
		 * if(imgDir.exists()) { FileUtils.deleteDirectory(imgDir); } }
		 */

		reviewService.reviewUpdate(reviewVO,imageVO);
		
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					File destDir = new File(REPO+"\\"+reviewVO.getName()+"\\"+reviewVO.getReviewNO());
					destDir.mkdir();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		
		
		map = reviewService.selectOne(reviewVO.getReviewNO());
		
		model.addAttribute("review",map.get("review"));
		model.addAttribute("image",map.get("image"));
		
		return "reviewView";
		
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
	@RequestMapping(value="/board/review/delete", method=RequestMethod.GET)
	public void reviewDelete(@RequestParam("reviewNO") int reviewNO, HttpServletResponse response) throws IOException {

		ReviewVO reviewVO = reviewService.reviewDelete(reviewNO);
		File imgDir = new File(REPO+"\\"+reviewVO.getName()+"\\"+reviewVO.getReviewNO());
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
		}
		response.sendRedirect("/tm/board/review");
	}
	
	@RequestMapping(value="/board/review/reviewImgDelete", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> imgDelete(@RequestParam("reviewNO") int reviewNO) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		int ret = reviewService.reviewImgDelete(reviewNO);
		if(ret==0) {
			map.put("result", "false");
		} else {
			map.put("result", "true");
			File imgDir = new File(REPO+"\\review\\"+reviewNO);
			File thumbnail = new File(REPO+"\\thumbnail\\review\\"+reviewNO);
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
				FileUtils.deleteDirectory(thumbnail);
			}
		}
		return map;
	}
	
	@RequestMapping(value="/board/review/download", method=RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("image") != null) {

			request.setCharacterEncoding("utf-8");
			String image = request.getParameter("image");
			String reviewNO = request.getParameter("reviewNO");
			String name = request.getParameter("name");

			OutputStream out = response.getOutputStream();
			String path = "C:\\files\\"+name+"\\"+reviewNO+"\\"+image;
			File imageFile = new File(path);

			int lastIndex = image.lastIndexOf(".");
			String fileName = image.substring(0,lastIndex);
			File destDir = new File(REPO+"\\thumbnail");
			File thumbnail = new File(REPO+"\\thumbnail\\"+name+"\\"+reviewNO+"\\"+fileName+".png");
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
	
}
