package com.hk.tm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SeongJooTest {

	
	@RequestMapping(value = "/member/admin", method = RequestMethod.GET)
	public String home() {
		
		return "adminMyPage";
		
	}
	@RequestMapping(value = "/member/seongjoo", method = RequestMethod.GET)
	public String seongjoo() {
		
		return "seonhjooTest";
		
	}
}
