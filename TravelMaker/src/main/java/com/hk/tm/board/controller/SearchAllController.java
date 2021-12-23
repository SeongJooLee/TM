package com.hk.tm.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.tm.board.service.SearchAllService;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;

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
	public String popupEnterPost(Model model,@RequestParam("headSearchOption")String option,@RequestParam("headSearchResult")String result){	
		
		switch(option) {
		case "person" : //검색옵션 == 작성자
			List<NoticeVO> listID = searchAllService.searchIdList(result);
			model.addAttribute("list",listID);
			return "popupResult";
		case "title" : //검색옵션 == 제목
			List<NoticeVO> listTitle = searchAllService.searchTitleList(result);
			model.addAttribute("list",listTitle);
			return "popupResult";
		case "content": //검색옵션 == 내용
			List<NoticeVO> listContent = searchAllService.searchContentList(result);
			model.addAttribute("list",listContent);
			return "popupResult";
		case "titleContent": //검색옵션 == 제목+내용
			List<NoticeVO> listTitleContent = searchAllService.searchTitleContentList(result);
			model.addAttribute("list",listTitleContent);
			return "popupResult";
		
		}
		return null;
	}
	
	@RequestMapping(value="/board/popupCheck", method=RequestMethod.GET)
	public String popupCheckGet(Model model,@RequestParam(value="randomNO",required=false)int randomNO,@RequestParam(value="randomName",required=false)String randomName){	
	
		switch(randomName) {
		case "공지사항":
			NoticeVO notice = searchAllService.selectNoticeOne(randomNO);
			model.addAttribute("notice",notice);
			return "popupCheckDone";
		case "이벤트":
			NoticeVO event = searchAllService.selectNoticeOne(randomNO);
			model.addAttribute("notice",event);
			return "popupCheckDone";
		case "홍보상품":
			PromotionVO promotion = searchAllService.selectPromotionOne(randomNO);
			model.addAttribute("promotion",promotion);
			return "popupCheckDone";
		case "이용후기":
			ReviewVO review = searchAllService.selectReviewOne(randomNO);
			model.addAttribute("review",review);
			return "popupCheckDone";
		case "테마여행":
			TravelVO travel = searchAllService.selectTravelOne(randomNO);
			model.addAttribute("travel",travel);
			return "popupCheckDone";
		}
		return null;
	}
}
