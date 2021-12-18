package com.hk.tm.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.service.SearchAllService;

@Controller
public class SearchAllController {
	@Autowired
	SearchAllService searchAllService;
	
	@RequestMapping(value="/board/popupEnter", method=RequestMethod.GET)
	public String mypageDelete(){	
		
		return "popupEnter";
	}
}
