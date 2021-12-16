package com.hk.tm.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.service.ReviewService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	String REPO = "C:\\files";
	
	@RequestMapping(value = "/board/review", method= {RequestMethod.GET,RequestMethod.POST})
	public String home(Model model) {
		
		List<ReviewVO> list = reviewService.boardAllList();
		
		model.addAttribute("review",list);
		
		return "reviewList";
		
	}
	
	@RequestMapping(value="/board/review/view", method=RequestMethod.GET)
	public String noticeView(Model model,@RequestParam("reviewNO") int reviewNO) {
		Map<String,Object> map = reviewService.selectOne(reviewNO);
		model.addAttribute("review",map.get("review"));
		model.addAttribute("image",map.get("image"));
		
		return "reviewView";
	}
	
	@RequestMapping(value="/board/review/update", method=RequestMethod.POST)
	public <reviewVO> String reviewUpdate(@RequestParam("reviewNO") int reviewNO,Model model,MultipartHttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		
		ReviewVO reviewVO = new ReviewVO();
		ImageVO imageVO = new ImageVO();
		
		reviewVO.setReviewNO(reviewNO);
		reviewVO.setTitle((String) map.get("title"));
		reviewVO.setContent((String) map.get("content"));
		reviewVO.setId((String) map.get("id"));
		reviewVO.setName((String) map.get("name"));
		
		if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			
		} if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			
		}
//		if(fileList.size()>3) {
//			imageVO.setImage4((String) fileList.get(3));
//			
//		} if(fileList.size()>4) {
//			imageVO.setImage5((String) fileList.get(4));
//			
//		} if(fileList.size()>5) {
//			imageVO.setImage6((String) fileList.get(5));
//			
//		} if(fileList.size()>6) {
//			imageVO.setImage7((String) fileList.get(6));
//			
//		} if(fileList.size()>7) {
//			imageVO.setImage8((String) fileList.get(7));
//			
//		} if(fileList.size()>8) {
//			imageVO.setImage9((String) fileList.get(8));
//			
//		} if(fileList.size()>9) {
//			imageVO.setImage10((String) fileList.get(9));
//		}
		
		if(reviewNO!=0) {
			File imgDir = new File(REPO+"\\"+reviewVO.getName()+"\\"+reviewVO.getReviewNO());
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
			}
		}

		if(imageVO.getImage1()!=null ) {
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					File destDir = new File(REPO+"\\"+reviewVO.getName()+"\\"+reviewVO.getReviewNO());
					destDir.mkdir();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		}
		
		reviewService.reviewUpdate(reviewVO,imageVO);
		
		model.addAttribute("review", reviewVO);
		model.addAttribute("image", imageVO);
		
		return "reviewView";
		
	}

	private List upload(MultipartHttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
}
