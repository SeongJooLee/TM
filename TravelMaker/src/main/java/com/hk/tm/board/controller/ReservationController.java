package com.hk.tm.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

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
	public String reservation(@ModelAttribute PromotionImageVO promotionImageVO,Model model) {
		promotionImageVO = reserService.selectOnePromotion(promotionImageVO.getPromotionNO());
		model.addAttribute("reser",promotionImageVO);
		
		return "reservation";
	}

	@RequestMapping(value="/board/reservation/done", method=RequestMethod.POST)
	public String reservationDone(@ModelAttribute ReservationVO reserVO,@RequestParam("promotionNO") int promotionNO,@RequestParam("title") String title ,@RequestParam("price") int price,Model model) {
		//reserVO에 저장될 값
		//reserNO, promotionNO, reserDate, headCount, id(user)
		//ModelAttribute 로 reserDate, headCount 받고
		//RequestParam 으로 promotionNO 받고
		//user Session 값 받아서 값 저장
		UserVO userVO = new UserVO(); // <--- 저장하기
		reserVO.setId(userVO.getId());
		reserVO.setPromotionNO(promotionNO);
		PromotionVO promotionVO = new PromotionVO();
		promotionVO.setTitle(title);
		promotionVO.setPrice(price);
		
		reserVO = reserService.insertReservation(reserVO);
		
		model.addAttribute("reser",reserVO);
		model.addAttribute("promotion",promotionVO);
		
		
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
	
		return "reservationView";
	}
}
