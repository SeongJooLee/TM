package com.hk.tm.member.controller;



import java.io.IOException;
import java.util.List;

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

import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
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
	public String memberMyPage(@ModelAttribute UserVO userVO,Model model,HttpSession session,@RequestParam(required = false,value="promotionNO") String proNO,@RequestParam(required = false,value="travelNO") String traNO) {
		System.out.println("민수야.? = "+session.getAttribute("userSession").getClass().getName());
		String check = session.getAttribute("userSession").getClass().getName();
		System.out.println("proNO= "+proNO);
		if(proNO!=null) {
			int promotionNO = Integer.parseInt(proNO);
			List<ReservationVO> result = userService.checkReservation(promotionNO);
			//System.out.println("result = "+result);
			System.out.println("Controller의 result = "+result);
			model.addAttribute("proNO",proNO);
			model.addAttribute("reservation",result);
			return "sellerReservation";
		}else if(traNO != null) {
			System.out.println("이번에 작업할곳");
			int travelNO = Integer.parseInt(traNO);
			System.out.println(travelNO);
			TravelVO travel = userService.checkOneTravel(travelNO);
			model.addAttribute("travel",travel);
			return "userBoardListDone";
		}
		
		
		 switch(check){
	        case "com.hk.tm.member.vo.UserVO":   
	        	UserVO user = (UserVO) session.getAttribute("userSession");
	        	model.addAttribute("user", user);   
	        	
	        	return "userMyPage";            
	        case "com.hk.tm.member.vo.SellerVO":
//	        	if() {
//	        		return ;
//	        	}
	        	System.out.println("12-13작업공간");
	        	SellerVO seller = (SellerVO) session.getAttribute("userSession");
	        	System.out.println("seller switch = "+seller);
				model.addAttribute("seller", seller);
	        	return "sellerMyPage";
	        
	        case "admin" :
	        	return "adminMyPage";
	    }
		return null;
	}
	
	@RequestMapping(value="/member/mypage", method=RequestMethod.POST)
	public String mypage(HttpSession session,@RequestParam("testKey") String key,Model model){	
//		UserVO user = null;
//		if(session.getAttribute("userSession")!=null) {
//			user = (UserVO) session.getAttribute("userSession");
//		}else if(session.getAttribute("")) {
//			session.
//		}
		UserVO user = null;
		SellerVO seller = null;
		try {
			user = (UserVO) session.getAttribute("userSession");
			System.out.println("오류발생");
		} catch (Exception e) {
			seller = (SellerVO)session.getAttribute("userSession");
			System.out.println("변형성공");
		}
		System.out.println("처리완료");
		
		
		switch(key) {
		case "one" :
			
			System.out.println("세션값 받아오기 11 test "+user.getId());
			return "userMyPage";
		case "two":
			//user = (UserVO) session.getAttribute("userSession");
			System.out.println("세션값 받아오기 22 "+user.getId());
			List <TravelVO> travel = userService.travelListAll(user.getId());
			List <ReviewVO> review = userService.reviewListAll(user.getId());
			model.addAttribute("travel",travel);
			model.addAttribute("review",review);
			System.out.println("review = "+review);
			System.out.println("설마?");
			return "userBoardList";
		case "three":
			//user = (UserVO) session.getAttribute("userSession");
			System.out.println("세션값 받아오기 33 "+user.getId());
			List<ReservationVO> userReservationList = userService.userReservationList(user.getId());
			model.addAttribute("list",userReservationList);
			return "userReservationList";
		case "four":
			//user = (UserVO) session.getAttribute("userSession");
			System.out.println("세션값 받아오기 44 "+user.getId());
			return null;
		
		case "sellerOne":
			System.out.println("sellerOne실행");
			return "sellerMyPage";
		case "sellerTwo":
			List<PromotionVO> list = userService.sellerPromotionList(seller.getSellerID());
			model.addAttribute("proList",list);
			return "sellerBoardList";
		case "sellerThree":
			System.out.println(seller);
			//System.out.println("프로모션 넘버 = "+proNum);
			System.out.println("sellerThree실행");
		
			//
			return null;
		case "sellerFour":
			System.out.println("sellerFour실행");
			return null;
		}
		return null;
	}
	
}
