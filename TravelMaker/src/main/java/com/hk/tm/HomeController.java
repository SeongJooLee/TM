package com.hk.tm;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.board.service.NoticeService;
import com.hk.tm.board.service.PromotionService;
import com.hk.tm.board.vo.NoticeImageVO;
import com.hk.tm.board.vo.PromotionImageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	PromotionService promotionService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		// NoticeImageVO - AllSelect
		List<NoticeImageVO> noticeList = noticeService.selectHomeNoticeImage();
		// PromotionImageVO - AllSelect
		List<PromotionImageVO> promotionList = promotionService.selectHomePromotionImage();
		
		model.addAttribute("notice",noticeList);
		model.addAttribute("promotion",promotionList);
		
		return "home";
		
	}
	@RequestMapping(value = "/seongJooTest", method = RequestMethod.GET)
	public String seongJooTest( Model model) {
		
		return "/seongtest";
		
	}
	
}
