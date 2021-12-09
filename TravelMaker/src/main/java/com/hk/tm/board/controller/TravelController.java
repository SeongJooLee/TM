package com.hk.tm.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.board.service.TravelService;
import com.hk.tm.board.vo.TravelVO;

@Controller
public class TravelController {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	TravelService travelService;
	
	@RequestMapping(value="/board/travel" , method = RequestMethod.GET) 
		public String travelList(Model model) {
		
		List<TravelVO> travelsList = travelService.listTravels();
		
		model.addAttribute("travelsList", travelsList);
		logger.debug("---------/list called");
		return "boardTravel"; //boardTravel.jsp 호출
	}
}
