package com.hk.tm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NayounTest {

	@RequestMapping(value = "/member/nayounTest", method = RequestMethod.GET)
	public String nayoun() {
		
		return "nayounTest";
	}
	
	@RequestMapping(value = "/member/adminBoardList", method = RequestMethod.GET)
	public String adminBoard() {
		
		return "adminBoardList";
	}
}
