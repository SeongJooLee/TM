package com.hk.tm.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.service.TravelService;
import com.hk.tm.board.vo.TravelVO;

@Controller
@RequestMapping(value="/board/")
public class TravelController {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	TravelService travelService;
	
	@Autowired
	TravelDAO travelDAO;
	
	@RequestMapping(value="travel" , method = RequestMethod.GET) 
		public String travelList(Model model) {
		
		List<TravelVO> list = travelService.allList();
		
		model.addAttribute("travel", list);
		logger.debug("---------/list called");
		return "travelList"; //travelList.jsp 호출
	}
	
	@RequestMapping(value="travel/View" , method=RequestMethod.GET)
	public String travelView(Model model , @RequestParam("travelNO") int travelNO) {
		
		Map<String,Object> map = travelService.oneList(travelNO);
		
		model.addAttribute("travel", map.get("travelVO"));
		model.addAttribute("user", map.get("userVO"));
		return "travelView"; // travelView.jsp 호출
		
	}
	
	@RequestMapping(value="travel/add" ,  method=RequestMethod.GET)
	public String travelAdd() {			
		return "travelAdd"; // travelAdd.jsp 호출
		
	}
	
	@RequestMapping(value="travel/addDone" ,  method=RequestMethod.POST)
	public String travelAddDone(Model model, @ModelAttribute TravelVO travelVO) {
		
		logger.debug("title", travelVO.getTitle());
		logger.debug("content", travelVO.getContent());
		
		int ret = travelService.addTravel(travelVO);
		model.addAttribute("ret", ret);
		return "travelAddDone"; 
	}
	
	@RequestMapping(value="travel/update" ,  method=RequestMethod.POST)
	public String travelUpdate(Model model, @ModelAttribute TravelVO travelVO) {
		
		int ret = travelService.modTravel(travelVO);
		model.addAttribute("ret", ret);
		return "travellUpdateDone";
	}
	
	@RequestMapping(value="travel/delete" ,  method=RequestMethod.GET)
	public String travelDelete(Model model , @RequestParam("travelNO") int travelNO) {
			
		int ret = travelService.removeTravel(travelNO);
		model.addAttribute("ret", ret);
		return "travelTravelDeleteDone"; // boardDeleteDone.jsp 호출		
	}
	
}
