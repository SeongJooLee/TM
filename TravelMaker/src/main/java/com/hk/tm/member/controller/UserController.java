package com.hk.tm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.member.service.UserService;



@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String memberLogin(Model model) {
		System.out.println("회원가입기능 실행");
		
		
		return "memberLogin";
	}
	
	@RequestMapping(value="/member/register",method=RequestMethod.GET)
	public String memberRegister(Model model) {
		System.out.println("회원가입기능 실행");
		
		
		return "memberRegister";
		// 과연
	}
}
