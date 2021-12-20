package com.hk.tm;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		// NoticeImageVO - AllSelect
		
		// PromotionImageVO - AllSelect
		
		
		
		return "home";
		
	}
	@RequestMapping(value = "/seongJooTest", method = RequestMethod.GET)
	public String seongJooTest( Model model) {
		
		return "/seongtest";
		
	}
	
}
