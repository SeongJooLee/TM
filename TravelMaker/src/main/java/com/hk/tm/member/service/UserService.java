package com.hk.tm.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.vo.CommentVO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
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
	
	@Autowired
	ImageDAO imageDAO;
	
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
			int a = userDAO.deleteSellerReservation(promotionVO.getPromotionNO());
			int b = userDAO.deleteSellerCategory(promotionVO.getPromotionNO());
			int c = userDAO.deleteSellerReview(promotionVO.getPromotionNO());
			int d = userDAO.deleteSellerImage(promotionVO.getPromotionNO());
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
//		int likeyouResult = userDAO.deleteLikeyou(userId);
		//comment삭제
		int commentResult = userDAO.deleteComment(userId);
		//travel삭제
		int travelResult = userDAO.deleteTravel(userId);
		//review삭제
		int reviewResult = userDAO.deleteReview(userId);
		//eventproduct삭제
//		int eventProductResult = userDAO.deleteEventProduct(userId);
		//reservation삭제
		int reservationResult= userDAO.deleteReservation(userId);
		//user 삭제
	
		
		return 5;
	}
	public int selectMaxNotice() {
		return userDAO.selectMaxNotice();
	}

	public void noticeAdd(ReviewVO reviewVO, ImageVO imageVO) {
		userDAO.noticeAdd(reviewVO);
		imageDAO.reviewAdd(imageVO);
	}

	public boolean duplicationCheckSeller(String checkID) {
		// TODO Auto-generated method stub
		return userDAO.duplicationCheckSeller(checkID);
	}

	public boolean duplicationCheckUser(String checkID) {
		// TODO Auto-generated method stub
		return userDAO.duplicationCheckUser(checkID);
	}

	public List<CommentVO> selectComment(String id) {
		// TODO Auto-generated method stub
		return userDAO.selectComment(id);
	}

	public List<Integer> selectTravel(String userId) {
		// TODO Auto-generated method stub
		return userDAO.selectTravel(userId);
	}

	public int deleteImageTravel(List<Integer> userTravelPK) {
		// TODO Auto-generated method stub
		return userDAO.deleteImageTravel(userTravelPK);
		
	}

	public int deleteImageCategory(List<Integer> userTravelPK) {
		// TODO Auto-generated method stub
		return userDAO.deleteImageCategory(userTravelPK);
	}

	public int deleteCommentTravel(List<Integer> userTravelPK) {
		// TODO Auto-generated method stub
		return userDAO.deleteCommentTravel(userTravelPK);
	}

	public List<Integer> selectReview(String userId) {
		// TODO Auto-generated method stub
		return userDAO.selectReview(userId);
	}

	public int deleteImageReview(List<Integer> userReviewPK) {
		// TODO Auto-generated method stub
		return userDAO.deleteImageReview(userReviewPK);
	}

	public int deleteCategoryReview(List<Integer> userReviewPK) {
		// TODO Auto-generated method stub
		return userDAO.deleteCategoryReview(userReviewPK);
	}

	public int deleteCommentReview(List<Integer> userReviewPK) {
		// TODO Auto-generated method stub
		return userDAO.deleteCommentReview(userReviewPK);
	}

	public void sellerReservationComplete(String reserNO) {
		// TODO Auto-generated method stub
		userDAO.sellerReservationComplete(reserNO);
	}
}
