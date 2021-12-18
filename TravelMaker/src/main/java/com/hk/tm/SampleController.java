package com.hk.tm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

 
@Controller
public class SampleController {

	@Autowired
    private KakaoPay kakaopay;
    
    
	@RequestMapping(value="/kakaoPay" , method =RequestMethod.GET) 
    public void kakaoPayGet() {
        
    }
    
	@RequestMapping(value="/kakaoPay" , method =RequestMethod.POST) 
    public String kakaoPay() {
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
	@RequestMapping(value="/kakaoPaySuccess" , method =RequestMethod.GET) 
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        
    }
    
}
 