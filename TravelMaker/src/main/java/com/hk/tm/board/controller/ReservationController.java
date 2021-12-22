package com.hk.tm.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.service.ReservationService;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.member.vo.UserVO;

@Controller
public class ReservationController {

	@Autowired
	ReservationService reserService;
	
	
	@RequestMapping(value="/board/reservation", method= {RequestMethod.GET,RequestMethod.POST})
	public String reservation(@ModelAttribute PromotionImageVO promotionImageVO,Model model,HttpSession session) {
		promotionImageVO = reserService.selectOnePromotion(promotionImageVO.getPromotionNO());
		model.addAttribute("reser",promotionImageVO);
		
		return "reservation";
	}

	@RequestMapping(value="/board/reservation/done", method={RequestMethod.GET,RequestMethod.POST})
	public String reservationDone(HttpSession session,@ModelAttribute ReservationVO reserVO,@RequestParam("id") String id,@RequestParam("promotionNO") int promotionNO,@RequestParam("title") String title ,@RequestParam("price") int price,Model model) {
		reserVO.setId(id);
		reserVO.setPromotionNO(promotionNO);
		PromotionVO promotionVO = new PromotionVO();
		promotionVO.setTitle(title);
		promotionVO.setPrice(price);

		
		reserVO = reserService.insertReservation(reserVO);
		
		model.addAttribute("reser",reserVO);
		model.addAttribute("promotion",promotionVO);
		
		
		return "reservationView";
	}
	
	@RequestMapping(value="/board/reservation/view", method=RequestMethod.GET)
	public String reservationDone(@ModelAttribute ReservationVO reserVO,Model model) {
		Map<String, Object> map =reserService.selectOneReservation(reserVO);
		
		model.addAttribute("reser",map.get("reser"));
		model.addAttribute("promotion",map.get("promotion"));
		
		return "reservationView";
	}
	
	@RequestMapping(value="/board/reservation/delete", method=RequestMethod.GET)
	public String reservationDelete(@ModelAttribute ReservationVO reserVO,HttpServletResponse response) throws IOException {
		
		int ret = reserService.deleteReservation(reserVO);
		if(ret==1) {
			//삭제 성공
			response.sendRedirect("/tm/board/promotion");
		} else {
			//실패..?
			
		}
	
		return "promotionList";
	}
	@RequestMapping(value="/board/reservation/payment", method=RequestMethod.GET)
	public String reservationPayment(@RequestParam("reserNO")String reserNO,HttpServletResponse response) throws IOException {
		reserService.insertPayment(reserNO);
		
		return "home";
	}
}
