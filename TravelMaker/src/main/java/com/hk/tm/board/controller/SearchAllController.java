package com.hk.tm.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.service.SearchAllService;
import com.hk.tm.board.vo.NoticeVO;

@Controller
public class SearchAllController {
	@Autowired
	SearchAllService searchAllService;
	
	@RequestMapping(value="/board/popupEnter", method=RequestMethod.GET)
	public String popupEnterGet(Model model){	
		List<NoticeVO> boardList = searchAllService.boardSearchAll();
		model.addAttribute("boardList",boardList);
		return "popupEnter";
	}
	
	@RequestMapping(value="/board/popupEnter", method=RequestMethod.POST)
	public String popupEnterPost(Model model,@RequestParam("searchOption")String option,@RequestParam("searchResult")String result){	
		switch(option) {
		case "person" : //검색옵션 == 작성자
			List<NoticeVO> list = searchAllService.searchIdList(result);
			model.addAttribute("list",list);
			return "popupResult";
		case "title" : //검색옵션 == 제목
			model.addAttribute("option",option);
			model.addAttribute("result",result);
			return "popupResult";
		case "content": //검색옵션 == 내용
			model.addAttribute("option",option);
			model.addAttribute("result",result);
			return "popupResult";
		case "titleContent": //검색옵션 == 제목+내용
			model.addAttribute("option",option);
			model.addAttribute("result",result);
			return "popupResult";
		
		}
		return null;
	}
}
