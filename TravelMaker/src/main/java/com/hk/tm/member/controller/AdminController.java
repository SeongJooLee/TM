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
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping(value="/admin/mypage",method=RequestMethod.GET)
	public String adminMyPage(Model model,@RequestParam(value="list",required=false) String list,@RequestParam(value="id",required=false) String id,@RequestParam(value="grade",required=false) String grade) {
		
		if(list == null && id==null) {
			return"adminMyPage";
		}else if(id!=null&&grade.equals("user")) {
			
			UserVO user = adminService.selectOne(id);
			model.addAttribute("user",user);
			return "userOneList";
		}else if(id!=null&&grade.equals("seller")) {			
			SellerVO seller = adminService.selectOneSeller(id);
			model.addAttribute("seller",seller);
			return "sellerOneList";
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
			System.out.println(list);
			return "userSerachList";
		}
		
		switch(key) {
		
		case "one":
			return "adminMyPage";
		case "two":
			List<UserVO>userList = adminService.userListAll();
			List<SellerVO>sellerList = adminService.sellerListAll();
			model.addAttribute("sellerList",sellerList);
			model.addAttribute("list",userList);
			return "listUserAll";
		case "three":
			return "adminMyPage";
		}
		
		
		return "adminMyPage";
//		admin/mypage
		
	}
}
