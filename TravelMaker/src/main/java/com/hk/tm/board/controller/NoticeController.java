package com.hk.tm.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.board.service.NoticeService;

@Controller
public class NoticeController {

	 @Autowired NoticeService noticeService;
	 
	  
	  @RequestMapping(value = "/board/notice", method = RequestMethod.GET) public
	  String noticeList(Model model) { System.out.println("공지사항 클릭 시 페이지 이동");
	  
	  
	  
	  return "noticeList"; }
	  
	/* @RequestMapping(value = "/board/notice", method = RequestMethod.GET) public
	 * String eventList(Model model) { System.out.println("이벤트 클릭 시 안에서 바꾸기");
	 * 
	 * 
	 * 
	 * return "eventList"; }
	 * 
	 * @RequestMapping(value = "/board/notice/add", method = RequestMethod.GET)
	 * public String noticeAdd(Model model) { System.out.println("글쓰기 클릭 시 페이지 이동");
	 * 
	 * 
	 * 
	 * return "noticeAdd"; }
	 * 
	 * @RequestMapping(value = "/board/notice/view", method = RequestMethod.GET)
	 * public String noSelect(Model model) { System.out.println("게시글 클릭 시 페이지 이동");
	 * 
	 * 
	 * 
	 * retur
	 * n "?"; }
	 */
  
	
}
