package com.hk.tm.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;

import com.hk.tm.member.dao.UserDAO;
import com.hk.tm.member.vo.AdminVO;
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Service
public class UserService {
	@Autowired
	UserDAO userDAO;
	
	public List<UserVO> selectAll(){
		return userDAO.selectAll();
	}

	public int addUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return userDAO.addUser(userVO);
	}

	public int addSeller(SellerVO seller) {
		// TODO Auto-generated method stub
		return userDAO.addSeller(seller);
	}

	public UserVO checkUser(UserVO userVO) {
		// TODO Auto-generated method stub
		return userDAO.checkUser(userVO);
	}
	public SellerVO checkUser(SellerVO sellerVO) {
		// TODO Auto-generated method stub
		return userDAO.checkUser(sellerVO);
	}
	public AdminVO checkUser(AdminVO adminVO) {
		// TODO Auto-generated method stub
		return userDAO.checkUser(adminVO);
	}

	public List<TravelVO> travelListAll(String id) {
		return userDAO.travelListAll(id);
		
	}

	public List<ReviewVO> reviewListAll(String id) {
		// TODO Auto-generated method stub
		return userDAO.reviewListAll(id);
	}

	public List<PromotionVO> sellerPromotionList(String id) {
		// TODO Auto-generated method stub
		return userDAO.sellerPromotionList(id);
		
	}

	public List<ReservationVO> checkReservation(int promotionNO) {
		// TODO Auto-generated method stub
		return userDAO.checkReservation(promotionNO);
	}

	public TravelVO checkOneTravel(int travelNO) {
		// TODO Auto-generated method stub
		return userDAO.checkOneTravel(travelNO);
	}

	public List<ReservationVO> userReservationList(String id) {
		// TODO Auto-generated method stub
		return userDAO.userReservationList(id);
	}

	public ReviewVO selectReview(int reviewNO) {
		// TODO Auto-generated method stub
		return userDAO.selectReview(reviewNO);
	}

	public int update(UserVO user) {
		// TODO Auto-generated method stub
		return userDAO.update(user);
	}

	public int delete(String userId) {
		// TODO Auto-generated method stub
		return userDAO.delete(userId);
	}
	public int deleteTravel(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteTravel(userId);
	}

	public int deleteComment(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteComment(userId);
	}

	public int deleteReview(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteReview(userId);
	}

	public int deleteLikeyou(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteLikeyou(userId);
	}

	public int eventProduct(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteEventProduct(userId);
	}

	public int delectReservation(String userId) {
		// TODO Auto-generated method stub
		return userDAO.delectReservation(userId);
	}

	public int deleteImage(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteImage(userId);
	}

	public int updateSeller(SellerVO seller) {
		// TODO Auto-generated method stub
		return userDAO.updateSeller(seller);
	}

	public int sellerDelete(String sellerId) {
		// TODO Auto-generated method stub
		return userDAO.sellerDelete(sellerId);
	}

	public int promotionDelete(String sellerId) {
		// TODO Auto-generated method stub
		
		return userDAO.promotionDelete(sellerId);
	}
}
