package com.hk.tm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.tm.member.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping(value="/admin/mypage",method=RequestMethod.GET)
	public String memberLogin(Model model,HttpServletRequest request) {
	
		return "adminMyPage";
		
		
	}
}
