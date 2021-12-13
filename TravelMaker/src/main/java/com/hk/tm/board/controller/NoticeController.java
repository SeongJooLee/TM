package com.hk.tm.board.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.service.NoticeService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;

@Controller
public class NoticeController {

	 @Autowired NoticeService noticeService;
	 
	 @RequestMapping(value="/board/notice", method=RequestMethod.GET)
	 public String noticeList(Model model) {
	
		 List<NoticeVO> list = noticeService.allList();
		 
		 model.addAttribute("notice",list);
		 
		 return "noticeList";
	 }
	 
	 @RequestMapping(value="/board/notice/view", method=RequestMethod.GET)
	 public String noticeView(Model model,@RequestParam("noticeNO") int noticeNO) {
		 Map<String,Object> map = noticeService.oneList(noticeNO);
		 System.out.println(map.get("image").toString());
		 model.addAttribute("notice",map.get("notice"));
		 model.addAttribute("image",map.get("image"));
		 return "noticeView";
	 }
	 
	 @RequestMapping(value="/board/notice/add", method=RequestMethod.GET)
	 public String noticeAdd(Model model) {
		 return "noticeAdd";
	 }
	 
	 @RequestMapping(value="/board/notice/addDone", method=RequestMethod.POST)
	 public String noticeAddDone(Model model,@ModelAttribute NoticeVO noticeVO,@ModelAttribute ImageVO imageVO) {
		 noticeService.boardAdd(noticeVO,imageVO);

		 return "noticeAddDone";
	 }
	 
//	private Map<String,String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//			Map<String,String>articleMap = new HashMap<String,String>();
//			String encoding="utf-8";
//			File currentDirPath = new File(REPO);
//			DiskFileItemFactory factory = new DiskFileItemFactory();
//			factory.setRepository(currentDirPath);
//			factory.setSizeThreshold(1024*1024);
//			ServletFileUpload upload = new ServletFileUpload(factory);
//			
//			try {
//				List items = upload.parseRequest(request); //주의
//				System.out.println("items의 길이"+items.size());
//				for (int i = 0; i < items.size(); i++) {
//					FileItem fileItem = (FileItem)items.get(i);
//					if(fileItem.isFormField()) {
//						System.out.println("내가 원하는 부분!!"+fileItem.getFieldName()+"="+fileItem.getString(encoding));
//						
//						articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
//					}else {
//						System.out.println("파라미터 이름 :"+fileItem.getFieldName());
//						System.out.println("파일 이름 :"+fileItem.getName());
//						System.out.println("파일 크기 :"+fileItem.getSize()+"bytes");
//						
//						if(fileItem.getSize()>0) {
//							int idx = fileItem.getName().lastIndexOf("\\");
//							if(idx==-1) {
//								idx = fileItem.getName().lastIndexOf("/");
//							}
//							String fileName = fileItem.getName().substring(idx+1);
//							articleMap.put(fileItem.getFieldName(),fileName);
//							File uploadFile = new File(currentDirPath+"\\temp\\"+fileName);
//							fileItem.write(uploadFile);
//						}
//					}
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return articleMap;
//		}
//	 음 커밋안되는데
	 
	
}
