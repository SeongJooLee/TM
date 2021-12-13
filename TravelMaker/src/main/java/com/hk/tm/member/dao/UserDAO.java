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

	

}
