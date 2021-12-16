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

	public int deletㄷReservation(String userId) {
		// TODO Auto-generated method stub
		return userDAO.deleteReservation(userId);
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

	public int imageDelete(String sellerId) {
		// TODO Auto-generated method stub
		return userDAO.imageDelete(sellerId);
	}

	public List<PromotionVO> promotionOne(String sellerId) {
		// TODO Auto-generated method stub
		return userDAO.promotionOne(sellerId);
	}

	public int childDeleteAll(List<PromotionVO> promotion) {
		// TODO Auto-generated method stub
		for (PromotionVO promotionVO : promotion) {
			System.out.println("테스트해볼게 "+promotionVO.getPromotionNO());
			int a = userDAO.deleteSellerReservation(promotionVO.getPromotionNO());
			int b = userDAO.deleteSellerCategory(promotionVO.getPromotionNO());
			int c = userDAO.deleteSellerReview(promotionVO.getPromotionNO());
			int d = userDAO.deleteSellerImage(promotionVO.getPromotionNO());
			System.out.println(a+" "+b+" "+c+" "+d);
		}
		return 0;
	}

	public int addReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return userDAO.addReview(reviewVO);
	}

	public int deleteTotal(String userId) {
		// TODO Auto-generated method stub
		//image
		int imageResult = userDAO.deleteImage(userId);
		//liktyou삭제
		int likeyouResult = userDAO.deleteLikeyou(userId);
		//comment삭제
		int commentResult = userDAO.deleteComment(userId);
		//travel삭제
		int travelResult = userDAO.deleteTravel(userId);
		//review삭제
		int reviewResult = userDAO.deleteReview(userId);
		//eventproduct삭제
		int eventProductResult = userDAO.deleteEventProduct(userId);
		//reservation삭제
		int reservationResult= userDAO.deleteReservation(userId);
		//user 삭제
		System.out.println("image 테이블 삭제개수 = "+imageResult);
		System.out.println("likeyou 테이블 삭제개수 = "+likeyouResult);
		System.out.println("comment 테이블 삭제개수 = "+commentResult);
		System.out.println("travel 테이블 삭제개수 = "+travelResult);
		System.out.println("review 테이블 삭제개수 = "+reviewResult);
		System.out.println("eventProduct 테이블 삭제개수 = "+eventProductResult);
		System.out.println("reservation 테이블 삭제개수 = "+reservationResult);
		
		return 5;
	}
}
