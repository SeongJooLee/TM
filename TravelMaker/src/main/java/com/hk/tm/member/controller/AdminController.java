package com.hk.tm.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
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
	public String adminMyPageDone(Model model,@RequestParam(value="key",required=false)String key,@RequestParam(value="search",required=false)String search,@RequestParam(value="selectUserBoard",required=false)String userBoard,@RequestParam(value="selectUserReservation",required=false)String userReservation,@RequestParam(value="selectSellerOne",required=false)String selectSellerOne) {
		if(key ==null && search!=null) {
			List<UserVO>list = adminService.searchID(search);
			model.addAttribute("list",list);
			model.addAttribute("search",search);
			System.out.println(list);
			
			return "userSearchList";
		}
		
		if(userBoard!=null) {	
			List<ReservationVO> reserList = adminService.selectOneReservation(userReservation);
			
			List <TravelVO> travel = adminService.travelListAll(userBoard);
			List <ReviewVO> review = adminService.reviewListAll(userBoard);
			model.addAttribute("travelList",travel);
			model.addAttribute("reviewList",review);
			return "adminBoardAll";		
		}else if(userReservation !=null) {
			List<ReservationVO> reserList = adminService.selectOneReservation(userReservation);
			model.addAttribute("list",reserList);
			return "adminReservation";
		}else if(selectSellerOne != null) {
			System.out.println("민수야 일어나.. 코딩해야지..");
			List<PromotionVO> seller = adminService.sellerPromotion(selectSellerOne);
			model.addAttribute("seller",seller);
			return "adminSellerOne";
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
			List<PromotionVO>proList = adminService.listPro();
			List<ReservationVO>reserList = adminService.listReser();
			model.addAttribute("proList",proList);
			model.addAttribute("reserList",reserList);
			for (int i = 0; i < proList.size(); i++) {
				for (int j = 0; j < reserList.size(); j++) {
					if(proList.get(i).getPromotionNO()==reserList.get(j).getPromotionNO()) {
						System.out.println(proList.get(i)+" JOIN  "+reserList.get(j));
						
						continue;
					}
					
				}
				
				
			}
			return "adminReservationAll";
		}
		
		
		return "adminMyPage";
//		admin/mypage
		
	}
	
	@RequestMapping(value="/admin/mypage/detail",method=RequestMethod.GET)
	public String myPageDetailGet(Model model,@RequestParam(value="travelNO",required = false)String travelNO_,@RequestParam(value="reserNO",required = false)String reserNO,@RequestParam(value="reviewNO",required=false)String reviewNO_){
		if(travelNO_ != null) {
			int travelNO = Integer.parseInt(travelNO_);
			TravelVO travel = adminService.userDetailTravel(travelNO);
			model.addAttribute("travel",travel);
			return"userDetailTravel";
		}else if(reviewNO_ != null) {
			int reviewNO = Integer.parseInt(reviewNO_);
			ReviewVO review = adminService.userDetailReview(reviewNO);
			model.addAttribute("review",review);
			return "userDetailReview";
		}else if(reserNO != null) {
			ReservationVO reservation = adminService.userDetailReservation(reserNO);
			model.addAttribute("reservation", reservation);
			
			return "userDetailReservation";
		}
		return "";
		
	}
	@RequestMapping(value="/admin/mypage/search",method=RequestMethod.GET)
	public String myPageDetail(@RequestParam(value="search" ,required=false) String search,Model model){
		
		List<PromotionVO>proList = adminService.listPro();
		List<ReservationVO>reserList = adminService.listReser();
		
		model.addAttribute("result",search);
		model.addAttribute("proList",proList);
		model.addAttribute("reserList",reserList);
		return "userSearchReservation";
	}
	
}
