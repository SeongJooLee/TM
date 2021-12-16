package com.hk.tm.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.vo.AdminVO;
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<UserVO> selectAll() {
		
		return null;
	}

	public int addUser(UserVO userVO) {
		int result = 0;
		userVO.setGrade("user");
		result = sqlSession.insert("mapper.memberUser.insert",userVO);
		return result;
	}

	public int addSeller(SellerVO seller) {
		int result = 0;
		seller.setGrade("seller");
		System.out.println("dao seller = "+seller);
		result = sqlSession.insert("mapper.memberSeller.insert",seller);
		return result;
	}

	public UserVO checkUser(UserVO userVO) {
		// TODO Auto-generated method stub
		System.out.println("dao USER = "+userVO);
		UserVO user = sqlSession.selectOne("mapper.memberUser.selectOne", userVO);
		
		System.out.println("user ="+user);
		return user;
	}

	public SellerVO checkUser(SellerVO sellerVO) {
		System.out.println("dao seller = "+sellerVO);
		SellerVO seller = sqlSession.selectOne("mapper.memberSeller.selectOne",sellerVO);
		return seller;
	}
	public AdminVO checkUser(AdminVO adminVO) {
		// TODO Auto-generated method stub
		AdminVO admin = sqlSession.selectOne("mapper.memberAdmin.selectOne",adminVO);
		return admin;
	}
	public UserVO oneList(String id) {
		// TODO Auto-generated method stub
		UserVO userVO = sqlSession.selectOne("mapper.memberUser.selectOne", id);
		return userVO;
	}
	
	public List<TravelVO> travelListAll(String id) {
		// TODO Auto-generated method stub
		System.out.println("dao id ="+id);
		List<TravelVO> travel = sqlSession.selectList("mapper.boardTravel.select",id);
		return travel;
	}

	public List<ReviewVO> reviewListAll(String id) {
		// TODO Auto-generated method stub
		System.out.println("dao id=2 "+id);
		List<ReviewVO> review = sqlSession.selectList("mapper.boardReview.select",id);
		return review;
	}

	public List<PromotionVO> sellerPromotionList(String id) {
		// TODO Auto-generated method stub
		List<PromotionVO> list = sqlSession.selectList("mapper.boardPromotion.select",id);
		return list;
	}

	public List<ReservationVO> checkReservation(int promotionNO) {
		// TODO Auto-generated method stub
		List<ReservationVO> result = sqlSession.selectList("mapper.boardReservation.select",promotionNO);
		
		return result;
	}

	public TravelVO checkOneTravel(int travelNO) {
		// TODO Auto-generated method stub
		TravelVO result = sqlSession.selectOne("mapper.boardTravel.selectOne",travelNO);
		return result;
	}

	public List<ReservationVO> userReservationList(String id) {
		// TODO Auto-generated method stub
		List<ReservationVO>list = sqlSession.selectList("mapper.boardReservation.selectId",id);
		return list;
	}

	public ReviewVO selectReview(int reviewNO) {
		// TODO Auto-generated method stub
		ReviewVO review = sqlSession.selectOne("mapper.boardReview.selectOne",reviewNO);
		return review;
	}

	public int update(UserVO user) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("mapper.memberUser.update",user);
		return result;
	}

	public int delete(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.memberUser.delete",userId);
		return result;
	}

	public int deleteTravel(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardTravel.deleteUserTravel",userId);
		return result;
	}

	public int deleteComment(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardComment.delete",userId);
		return result;
	}

	public int deleteReview(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardReview.deleteUserOne",userId);
		return result;
	}

	public int deleteLikeyou(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardLikeyou.delete",userId);
		return result;
	}
	
	public int deleteEventProduct(String userId) {
		int result = sqlSession.delete("mapper.boardEvent.delete",userId);
		return result;
	}

	public int delectReservation(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardReservation.deleteOneUser",userId);
		return result;
	}

	public int deleteImage(String userId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardImage.deleteUser",userId);
		return 0;
	}

	public int updateSeller(SellerVO seller) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("mapper.memberSeller.update", seller);
		return result;
	}

	public int sellerDelete(String sellerID) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.memberSeller.delete", sellerID);
		return result;
	}

	public int promotionDelete(String sellerId) {
		// TODO Auto-generated method stub
		System.out.println("프로모션에서 "+sellerId);
		int result = sqlSession.delete("mapper.boardPromotion.deleteSeller",sellerId);
		return result;
	}

	public int imageDelete(String sellerId) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardImage.deleteSeller",sellerId);
		return result;
	}

	public List<PromotionVO> promotionOne(String sellerId) {
		// TODO Auto-generated method stub
		List<PromotionVO> promotion = sqlSession.selectList("mapper.boardPromotion.select", sellerId);
		return promotion;
	}

	public int deleteSellerReservation(int promotionNO) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardReservation.deletePromotion", promotionNO);
		return result;
	}

	public int deleteSellerCategory(int promotionNO) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardCategory.deletePromotion", promotionNO);
		return result;
	}

	public int deleteSellerReview(int promotionNO) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardReview.deletePro", promotionNO);
		return result;
	}

	public int deleteSellerImage(int promotionNO) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardImage.deletePro", promotionNO);
		return result;
	}

	public int addReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("mapper.boardReview.insert", reviewVO);
		return result;
	}

	

}
