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
    public String kakaoPay(@RequestParam("title")String title,@RequestParam("name")String name,@RequestParam("headCount")String headCount,@RequestParam("price")String price) { // redirec:URL --> URL move 
        String url = kakaopay.kakaoPayReady(title,name,headCount,price);
        return "redirect:" +url; // 해당 유알엘로 이동
 
    }
    
	@RequestMapping(value="/kakaoPaySuccess" , method =RequestMethod.GET) 
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        // 서버에서 성공한 정보 
	
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        return "kakaoPaySuccess"; // jsp 호출
    }
    
}
 