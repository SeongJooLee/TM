package com.hk.tm.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.board.service.ReservationService;
import com.hk.tm.board.vo.PromotionImageVO;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reserService;
	
	
	@RequestMapping(value="/board/reservation", method= {RequestMethod.GET,RequestMethod.POST})
	public String promotionList(@ModelAttribute PromotionImageVO promotionImageVO,Model model) {
		promotionImageVO = reserService.selectOnePromotion(promotionImageVO.getPromotionNO());
		model.addAttribute("reser",promotionImageVO);
		
		return "reservation";
	}
}
