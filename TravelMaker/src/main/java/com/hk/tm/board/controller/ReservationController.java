package com.hk.tm.board.controller;

import java.io.IOException;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hk.tm.board.service.ReservationService;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;

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
		
		System.out.println("TestreserVO"+reserVO.toString());
		
		int priceSum = price * reserVO.getHeadCount();
		
		
		PromotionImageVO promotionVO = new PromotionImageVO();
		promotionVO.setTitle(title);
		promotionVO.setPrice(priceSum);

		
		
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
	@RequestMapping(value="/board/reservation/payment", method=RequestMethod.POST)
	public String reservationPayment(RedirectAttributes redirectAttributes,@RequestParam("reserNO")String reserNO,HttpServletResponse response) throws IOException {
		System.out.println("결제 확인 "+reserNO);
		reserService.insertPayment(reserNO);
		
		redirectAttributes.addAttribute("reserNO",reserNO);
		
		return "redirect:/board/reservation/view";
	}
}
