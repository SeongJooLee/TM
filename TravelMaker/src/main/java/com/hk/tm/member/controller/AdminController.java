package com.hk.tm.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.member.service.AdminService;
import com.hk.tm.member.vo.UserVO;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping(value="/admin/mypage",method=RequestMethod.GET)
	public String adminMyPage(Model model,@RequestParam(value="list",required=false) String list) {
		
		if(list == null) {
			return"adminMyPage";
		}else if(list.equals("name")) {
			List<UserVO>nameList = adminService.nameList();
			model.addAttribute("list",nameList);
			return"listUserAllName";
		}else if(list.equals("date")) {
			List<UserVO>dateList = adminService.dateList();
			model.addAttribute("list",dateList);
			return"listUserAllDate";
		}
		
		return "adminMyPage";
		
		
	}
	
	@RequestMapping(value="/admin/mypage",method=RequestMethod.POST)
	public String adminMyPageDone(Model model,@RequestParam(value="key",required=false)String key,@RequestParam(value="search",required=false)String search) {
		if(key ==null && search!=null) {
			List<UserVO>list = adminService.searchID(search);
			model.addAttribute("list",list);
			return "userSerachList";
		}
		
		switch(key) {
		
		case "one":
			return "adminMyPage";
		case "two":
			List<UserVO>userList = adminService.userListAll();
			model.addAttribute("list",userList);
			return "listUserAll";
		case "three":
			return "adminMyPage";
		}
		
		
		return "adminMyPage";
//		admin/mypage
		
	}
}
