package com.hk.tm.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hk.tm.board.vo.NoticeVO;
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
	@Autowired
	NoticeVO noticeVO;
	
	
	@RequestMapping(value="/admin/mypage",method=RequestMethod.GET)
	public String adminMyPage(Model model,@RequestParam(value="list",required=false) String list,@RequestParam(value="id",required=false) String id,@RequestParam(value="grade",required=false) String grade) {
		
		if(list == null && id==null) {
			
//			List<NoticeVO> noticeList = adminService.noticeAllList();
//			List<PromotionVO> promotionList = adminService.promotionAllList();
//			List<ReviewVO> reviewList = adminService.reviewAllList();
//			List<TravelVO> travelList = adminService.travelAllList();
//			
//			model.addAttribute("noticeList",noticeList);
//			model.addAttribute("promotionList",promotionList);
//			model.addAttribute("reviewList",reviewList);
//			model.addAttribute("travelList",travelList);
			
//			List<Integer> in = new ArrayList<>();
//			in.add(1);
//			in.add(5);
			
			noticeVO.setX(1);
			noticeVO.setY(5);
			
			List<NoticeVO> boardList = adminService.selectBoardAll(noticeVO);
			model.addAttribute("boardList",boardList);
			model.addAttribute("notice",noticeVO);
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
			System.out.println("post요청");
			
			noticeVO.setX(1);
			noticeVO.setY(5);
			List<NoticeVO> boardList = adminService.selectBoardAll(noticeVO);
			model.addAttribute("boardList",boardList);
			model.addAttribute("notice",noticeVO);
			return "adminMyPage";
		case "two":
			System.out.println("시작해보자");
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

			return "adminReservationAll";
		}
		
		
		return "adminMyPage";

		
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
	@RequestMapping(value="/admin/mypage/reservationUpdate",method=RequestMethod.GET)
	public String myPageReservationUpdate(Model model,@RequestParam(value="key",required=false) String reservationNO){
		
		ReservationVO reservation = adminService.reservationOne(reservationNO);
		List<PromotionVO> list = adminService.listPro();
		System.out.println("실행인가..?");
		System.out.println(list);
		model.addAttribute("proList",list);
		model.addAttribute("reservation",reservation);
		
		return "adminReservationUpdate";
	}
	@RequestMapping(value="/admin/mypage/reservationUpdate",method=RequestMethod.POST)
	public String myPageReservationUpdatePost(Model model,@ModelAttribute ReservationVO reservation){
		
		int result = adminService.reservationUpdate(reservation);
		
		
		model.addAttribute("result",result);
		
		return "adminLastCheck";
	}
	@RequestMapping(value="/admin/mypage/reservationDelete",method=RequestMethod.GET)
	public String myPageReservationDelete(Model model,@RequestParam(value="key",required=false) String reserNO){
		
		int result=adminService.deleteReservation(reserNO);
		
		model.addAttribute("deleteResult",result);
		
		return "adminLastCheck";
	}
	
	@RequestMapping(value="/admin/mypage/next",method=RequestMethod.GET)
	public String nextPage(Model model,@RequestParam(value="indexOne",required=false)int x,@RequestParam(value="indexTwo",required=false)int y){
		
		
			List<NoticeVO> list = adminService.selectBoardAll(noticeVO);
			
			if(list.size()==0) {
				model.addAttribute("list",list);
				return "adminMyPage";
			}else if(list.size()!=5) {
				noticeVO.setX(1);
				noticeVO.setY(5);
				model.addAttribute("notice",noticeVO);
				model.addAttribute("list",list);
				return "adminMyPage";
			}
			noticeVO.setX(x+4);
			noticeVO.setY(y+4);	
			model.addAttribute("boardList", list);
			model.addAttribute("notice",noticeVO);
			return "adminMyPage";
		
		
	}
	
	@RequestMapping(value="/admin/mypage/before",method=RequestMethod.GET)
	public String beforePage(Model model,@RequestParam(value="indexOne",required=false)int x,@RequestParam(value="indexTwo",required=false)int y){
		
		noticeVO.setX(x-4);
		noticeVO.setY(y-4);
		
		
		if(noticeVO.getX()<=0 || noticeVO.getY()<=0) {
			noticeVO.setX(1);
			noticeVO.setY(5);
		}
		
		
		List<NoticeVO> list = adminService.selectBoardAll(noticeVO);
		model.addAttribute("boardList", list);
		model.addAttribute("notice",noticeVO);
		return "adminMyPage";
	}
	
	@RequestMapping(value="/admin/mypage/check",method=RequestMethod.GET)
	public String checkGet(Model model,@RequestParam(value="randomNO",required=false) int randomNO,@RequestParam(value="randomName",required=false)String randomName){
		
		System.out.println(randomNO);
		System.out.println(randomName);
		
		switch(randomName) {
		case "notice":
			noticeVO = adminService.selectNoticeOne(randomNO);
			model.addAttribute("notice",noticeVO);
			return "adminRandomLocation";
		case "event":
			noticeVO = adminService.selectNoticeOne(randomNO);
			model.addAttribute("notice",noticeVO);
			return "adminRandomLocation";
		case "promotion":
			PromotionVO promotionVO = adminService.selectPromotionOne(randomNO);
			model.addAttribute("promotion",promotionVO);
			return "adminRandomLocation";
		case "review":
			ReviewVO reviewVO = adminService.selectReviewOne(randomNO);
			model.addAttribute("review",reviewVO);
			return "adminRandomLocation";
		case "travel":
			TravelVO travelVO = adminService.selectTravelOne(randomNO);
			model.addAttribute("travel", travelVO);
			return "adminRandomLocation";
			
		}
		
		return "adminMyPage";
	}
	
	
	
	
	
}
