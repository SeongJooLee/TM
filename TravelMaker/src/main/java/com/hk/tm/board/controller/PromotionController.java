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

import com.hk.tm.board.service.PromotionService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionVO;

@Controller
public class PromotionController {

	@Autowired
	PromotionService promotionService;

	String REPO = "C:\\files";

	@RequestMapping(value="/board/promotion", method= {RequestMethod.GET,RequestMethod.POST})
	public String promotionList(Model model) {
		List<PromotionVO> list = promotionService.selectAllPromotion();

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

//	@RequestMapping(value="/board/promotion/addDone", method=RequestMethod.POST)
//	public void promotionAddDone(MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws IOException, ServletException {
//		request.setCharacterEncoding("utf-8");
//		Map<String,Object> map = new HashMap<String,Object>();
//		Enumeration enu=request.getParameterNames();
//		
//		while(enu.hasMoreElements()){
//			String name=(String)enu.nextElement();
//			String value=request.getParameter(name);
//			map.put(name,value);
//		}
//		List fileList= upload(request);
//		map.put("fileList", fileList);
//
//		NoticeVO noticeVO = new NoticeVO();
//		ImageVO imageVO = new ImageVO();
//		
//		int noticeNO = noticeService.selectMaxNotice();
//		noticeNO++;
//		
//		noticeVO.setNoticeNO(noticeNO);
//		noticeVO.setTitle((String) map.get("title"));
//		noticeVO.setContent((String) map.get("content"));
//		noticeVO.setAdminID((String) map.get("adminID"));
//		noticeVO.setName((String) map.get("name"));
//		
//		if(fileList.size()>0) {
//			imageVO.setImage1((String) fileList.get(0));
//			if(fileList.get(0) == "") {
//				imageVO.setImage1(null);
//			}
//		} if(fileList.size()>1) {
//			imageVO.setImage2((String) fileList.get(1));
//			
//		} if(fileList.size()>2) {
//			imageVO.setImage3((String) fileList.get(2));
//			
//		} if(fileList.size()>3) {
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
//		System.out.println("이미지 브이오 어케 댐 "+imageVO.toString());
//		noticeService.boardAdd(noticeVO,imageVO);
//		if(imageVO.getImage1()!=null ) {
//			
//			for(int i=0;i < fileList.size(); i++) {
//				if(fileList.get(i)!=null) {
//					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
//					File destDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
//					destDir.mkdir();
//					FileUtils.moveFileToDirectory(srcFile, destDir, true);
//				}
//			}
//		}
//		
//		response.sendRedirect("/tm/board/notice");
//	}
	
	
}
