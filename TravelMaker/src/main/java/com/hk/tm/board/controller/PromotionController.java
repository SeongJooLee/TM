package com.hk.tm.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.service.PromotionService;
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
	@RequestMapping(value="/board/promotion/view", method= {RequestMethod.GET,RequestMethod.POST})
	public String promotionView(Model model,@RequestParam("promotionNO") int promotionNO) {
		Map<String,Object> map = promotionService.selectOneNotice(promotionNO);
		model.addAttribute("promotion",map.get("promotion"));
		model.addAttribute("image",map.get("image"));
		model.addAttribute("category",map.get("category"));
		
		System.out.println("여기는 view +"+ map.get("notice").toString());
		return "noticeView";
	}
	
	
	
}
