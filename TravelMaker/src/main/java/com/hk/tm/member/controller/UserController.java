package com.hk.tm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.member.service.UserService;
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;



@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String memberLogin(Model model) {
		System.out.println("로그인기능 실행");
		
		return "memberLogin";
	}
	
	@RequestMapping(value="/member/registerCheck",method=RequestMethod.GET)
	public String memberRegisterCheck(Model model) {
		System.out.println("회원가입기능 실행");
		
		
		return "memberRegisterCheck";
		// 과연
	}
	@RequestMapping(value="/member/userAdd",method=RequestMethod.POST)
	public String memberUserAdd(@ModelAttribute UserVO userVO,Model model) {
		System.out.println("hello");
		System.out.println(userVO);
		
		int ret = userService.addUser(userVO);
		System.out.println(ret);
		
		model.addAttribute("result",ret);
		
		
		return "addResult";
		// 과연
	}
	@RequestMapping(value="/member/sellerAdd",method=RequestMethod.POST)
	public String memberSellerAdd(@ModelAttribute SellerVO seller) {
		System.out.println(seller);
		
		
		return "home";
		// 과연
	}
	@RequestMapping(value="/member/register",method=RequestMethod.GET)
	public String memberRegister(@RequestParam("name")String name) {
		System.out.println("name="+name);
		switch(name){
        case "user": 
        	return "memberRegister";            
        case "seller":
        	return "sellerRegister";  
		}
		
		return null;
		// 과연
	}
	@RequestMapping(value="/member/mypage",method=RequestMethod.POST)
	public String memberMyPage(@ModelAttribute UserVO userVO) {
		System.out.println(userVO);
		 switch(userVO.getGrade()){
	        case "user": 
	        	return "userMyPage";            
	        case "seller":
	        	return "sellerMyPage";
	        case "admin" :
	        	return "adminMyPage";
	    }
		return null;
	}
}
