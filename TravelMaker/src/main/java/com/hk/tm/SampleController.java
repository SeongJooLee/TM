package com.hk.tm;

import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiDevice.Info;

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
    
	@Autowired
	HttpSession session;
    
	@RequestMapping(value="/kakaoPay" , method =RequestMethod.GET) 
    public void kakaoPayGet() {
        
    }
    
	@RequestMapping(value="/kakaoPay" , method =RequestMethod.POST) 
    public String kakaoPay(Model model,@RequestParam("title")String title,@RequestParam("reserNO")String reserNO,@RequestParam("headCount")String headCount,@RequestParam("price")String price) { // redirec:URL --> URL move 
        String url = kakaopay.kakaoPayReady(title,headCount,price,reserNO);
        return "redirect:" +url; // 해당 유알엘로 이동
    }
    
	@RequestMapping(value="/kakaoPaySuccess" , method =RequestMethod.GET) 
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        // 서버에서 성공한 정보 
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
        
        return "kakaoPaySuccess"; // jsp 호출
    }
    
}
 