package com.hk.tm.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.board.service.ReviewService;
import com.hk.tm.board.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value = "/board/review", method = RequestMethod.GET)
	public String home(Model model) {
		List<ReviewVO> list = reviewService.boardAllList();
		
		model.addAttribute("list",list);
		
		return "reviewList";
		
	}
}
