package com.hk.tm.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.dao.AdminDAO;
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;
	public List<UserVO> userListAll() {
		// TODO Auto-generated method stub
		return adminDAO.userListAll();
	}
	public List<UserVO> nameList() {
		// TODO Auto-generated method stub
		return adminDAO.nameList();
	}
	public List<UserVO> dateList() {
		// TODO Auto-generated method stub
		return adminDAO.dateList();
	}
	public List<UserVO> searchID(String search) {
		// TODO Auto-generated method stub
		return adminDAO.searchID(search);
	}
	public UserVO selectOne(String id) {
		// TODO Auto-generated method stub
		return adminDAO.selectOne(id);
	}
	public List<SellerVO> sellerListAll() {
		// TODO Auto-generated method stub
		return adminDAO.selectListAll();
	}
	public SellerVO selectOneSeller(String id) {
		// TODO Auto-generated method stub
		return adminDAO.selectOneSeller(id);
	}
	public List<ReservationVO> selectOneReservation(String userReservation) {
		// TODO Auto-generated method stub
		return adminDAO.selectOneReservation(userReservation);
	}
	public List<TravelVO> travelListAll(String userBoard) {
		// TODO Auto-generated method stub
		return adminDAO.travelListAll(userBoard);
	}
	public List<ReviewVO> reviewListAll(String userBoard) {
		// TODO Auto-generated method stub
		return adminDAO.reviewListAll(userBoard);
	}
	public List<PromotionVO> sellerPromotion(String selectSellerOne) {
		// TODO Auto-generated method stub
		return adminDAO.sellerPromotion(selectSellerOne);
	}
	public TravelVO userDetailTravel(int travelNO) {
		// TODO Auto-generated method stub
		return adminDAO.userDetailTravel(travelNO);
	}
	public ReviewVO userDetailReview(int reviewNO) {
		// TODO Auto-generated method stub
		return adminDAO.userDetailReview(reviewNO);
	}
	public ReservationVO userDetailReservation(String reserNO) {
		// TODO Auto-generated method stub
		return adminDAO.userDetailReservation(reserNO);
	}
	public List<PromotionVO> listPro() {
		// TODO Auto-generated method stub
		
		
		
		return adminDAO.listPro();
	}
	public List<ReservationVO> listReser() {
		// TODO Auto-generated method stub
		
		
		
		return adminDAO.listReser();
	}
	public ReservationVO reservationOne(String reservationNO) {
		// TODO Auto-generated method stub
		return adminDAO.reservationOne(reservationNO);
	}
	public int reservationUpdate(ReservationVO reservation) {
		// TODO Auto-generated method stub
		return adminDAO.reservationUpdate(reservation);
	}
	public int deleteReservation(String reserNO) {
		// TODO Auto-generated method stub
		return adminDAO.deleteReservation(reserNO);
	}
	

}
