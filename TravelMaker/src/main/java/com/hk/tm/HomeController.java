package com.hk.tm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.board.service.NoticeService;
import com.hk.tm.board.service.PromotionService;
import com.hk.tm.board.service.TravelService;
import com.hk.tm.board.vo.NoticeImageVO;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.TravelImageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	PromotionService promotionService;
	
	@Autowired
	TravelService travelService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		
		// 시작시간 
		long startTime = System.currentTimeMillis(); // 1/1000 초 
		// NoticeImageVO - AllSelect
		List<NoticeImageVO> noticeList = noticeService.selectHomeNoticeImage();
		// PromotionImageVO - AllSelect
		long endTime1 = System.currentTimeMillis(); // 1/1000 초 
		
		List<PromotionImageVO> promotionList = promotionService.selectHomePromotionImage();
		long endTime2 = System.currentTimeMillis(); // 1/1000 초 
		
		// travelImageVO - AllSelect
		List<TravelImageVO> travelList = travelService.selectHomeTravelImage();
		
		model.addAttribute("travel",travelList);
		model.addAttribute("notice",noticeList);
		model.addAttribute("promotion",promotionList);
		
		// 끝시간
		long endTime = System.currentTimeMillis(); // 1/1000 초 
		// diff ( 실행시간 ) 
		System.out.println("Diff = " + (endTime-startTime));
		System.out.println("Diff range1= " + (endTime1-startTime));
		System.out.println("Diff range2= " + (endTime2-endTime1));

		return "home";
		
	}
	@RequestMapping(value = "/seongJooTest", method = RequestMethod.GET)
	public String seongJooTest( Model model) {
		// 시작시간 

		// 끝시간
		// diff ( 실행시간 ) 
		return "/seongtest";
		
	}
	
}
