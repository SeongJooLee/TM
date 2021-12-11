package com.hk.tm.member.controller;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	@Autowired
	SellerVO sellerVO;
	
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String memberLogin(Model model,HttpServletRequest request) {

		
		return "memberLogin";
		
		
	}
	@RequestMapping(value="/member/logout",method=RequestMethod.GET)
	public String memberLogout(HttpSession session) {
		session.invalidate();
		System.out.println("세션삭제");
		return "logout";
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
	public String memberSellerAdd(@ModelAttribute SellerVO seller,Model model) {
		int ret = userService.addSeller(seller);
		
		model.addAttribute("result", ret);
		return "addResult";
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
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute UserVO userVO,Model model,HttpSession session,HttpServletResponse response) {

		 switch(userVO.getGrade()){
	        case "user":   
	        	UserVO user = userService.checkUser(userVO);  
	        	if(user !=null) {
	        		System.out.println("1번실행");
	        		session.setAttribute("userSession", user);
	        	}
	        	
	        	model.addAttribute("user", user);   
	        	
	        	return "userhome";            
	        case "seller":	      
	        	System.out.println("작업할공간");
	        	sellerVO.setSellerID(userVO.getId());
				sellerVO.setPw(userVO.getPw());
				sellerVO.setGrade(userVO.getGrade());
				SellerVO seller = userService.checkUser(sellerVO);
				if(seller !=null) {
	        		System.out.println("33번실행");
	        		session.setAttribute("userSession", seller);
	        	}			
				model.addAttribute("seller", seller);
	        	return "sellerhome";
	        case "admin" :
	        	return "adminMyPage";
	    }
		return null;
	}
	
	@RequestMapping(value="/member/mypage",method=RequestMethod.GET)
	public String memberMyPage(@ModelAttribute UserVO userVO,Model model,HttpSession session) {
		System.out.println("민수야.? = "+session.getAttribute("userSession").getClass().getName());
		String check = session.getAttribute("userSession").getClass().getName();
		
		
		 switch(check){
	        case "com.hk.tm.member.vo.UserVO":   
	        	UserVO user = (UserVO) session.getAttribute("userSession");
	        	model.addAttribute("user", user);   
	        	
	        	return "userMyPage";            
	        case "com.hk.tm.member.vo.SellerVO":	 
	        	System.out.println("진짜 끝인가 ?----------");
	        	SellerVO seller = (SellerVO) session.getAttribute("userSession");
	        	System.out.println("seller switch = "+seller);
				model.addAttribute("seller", seller);
	        	return "sellerMyPage";
	        case "admin" :
	        	return "adminMyPage";
	    }
		return null;
	}
	
}
