package com.hk.tm.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

@Repository
public class AdminDAO {
	@Autowired
	SqlSession sqlSession;
	public List<UserVO> userListAll() {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectAll");
		return userList;
	}
	public List<UserVO> nameList() {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectAllName");
		return userList;
	}
	public List<UserVO> dateList() {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectAllDate");
		return userList;
	}
	public List<UserVO> searchID(String search) {
		// TODO Auto-generated method stub
		List<UserVO>userList = sqlSession.selectList("mapper.memberUser.selectSearchID",search);
		
		return userList;
	}
	public UserVO selectOne(String id) {
		// TODO Auto-generated method stub
		UserVO user = sqlSession.selectOne("mapper.memberUser.selectView",id);
		return user;
	}
	public List<SellerVO> selectListAll() {
		// TODO Auto-generated method stub
		List<SellerVO> sellerList = sqlSession.selectList("mapper.memberSeller.selectAll");
		return sellerList;
	}
	public SellerVO selectOneSeller(String id) {
		// TODO Auto-generated method stub
		SellerVO seller = sqlSession.selectOne("mapper.memberSeller.selectOneSeller",id);
		return seller;
	}
	public List<ReservationVO> selectOneReservation(String userReservation) {
		// TODO Auto-generated method stub
		List<ReservationVO> list = sqlSession.selectList("mapper.boardReservation.selectId",userReservation);
		return list;
	}
	public List<TravelVO> travelListAll(String userBoard) {
		// TODO Auto-generated method stub
		List<TravelVO> list = sqlSession.selectList("mapper.boardTravel.select",userBoard);
		return list;
	}
	public List<ReviewVO> reviewListAll(String userBoard) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sqlSession.selectList("mapper.boardReview.select",userBoard);
		return list;
	}
	public List<PromotionVO> sellerPromotion(String selectSellerOne) {
		// TODO Auto-generated method stub
		List<PromotionVO> list = sqlSession.selectList("mapper.boardPromotion.select",selectSellerOne);
		return list;
	}
	public TravelVO userDetailTravel(int travelNO) {
		// TODO Auto-generated method stub
		TravelVO travel = sqlSession.selectOne("mapper.boardTravel.selectOneTravel",travelNO);
		return travel;
	}
	public ReviewVO userDetailReview(int reviewNO) {
		// TODO Auto-generated method stub
		ReviewVO review = sqlSession.selectOne("mapper.boardReview.selectOne",reviewNO);
		return review;
	}
	public ReservationVO userDetailReservation(String reserNO) {
		// TODO Auto-generated method stub
		ReservationVO reservation = sqlSession.selectOne("mapper.boardReservation.selectOne", reserNO);
		
		
		return reservation;
	}
	public List<PromotionVO> listPro() {
		// TODO Auto-generated method stub
		List<PromotionVO> list= sqlSession.selectList("mapper.boardPromotion.selectAllPromotion");
		
		
		return list;
	}
	public List<ReservationVO> listReser() {
		// TODO Auto-generated method stub
		List<ReservationVO> list= sqlSession.selectList("mapper.boardReservation.selectAll");
		
		
		return list;
	}
	public ReservationVO reservationOne(String reserNO) {
		// TODO Auto-generated method stub
		ReservationVO reservation = sqlSession.selectOne("mapper.boardReservation.selectOne", reserNO);
		return reservation;
	}
	public int reservationUpdate(ReservationVO reservation) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("mapper.boardReservation.updateOne", reservation);
		return result;
	}
	public int deleteReservation(String reserNO) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("mapper.boardReservation.delete", reserNO);
		return result;
	}
	public List<NoticeVO> noticeAllList() {
		// TODO Auto-generated method stub
		List<NoticeVO> list = sqlSession.selectList("mapper.boardNotice.selectNoticeAll");
		return list;
	}
	public List<PromotionVO> promotionAllList() {
		// TODO Auto-generated method stub
		List<PromotionVO> list = sqlSession.selectList("mapper.boardPromotion.selectPromotionAll");
		return list;
	}
	public List<ReviewVO> reviewAllList() {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sqlSession.selectList("mapper.boardReview.selectReviewAll");
		return list;
	}
	public List<TravelVO> travelAllList() {
		// TODO Auto-generated method stub
		List<TravelVO> list = sqlSession.selectList("mapper.boardTravel.selectTravelAll");
		return list;
	}
	public List<NoticeVO> selectBoardAll(NoticeVO notice) {
		// TODO Auto-generated method stub
		List<NoticeVO> list = sqlSession.selectList("mapper.boardNotice.selectUnion",notice);
		return list;
	}
	

}
