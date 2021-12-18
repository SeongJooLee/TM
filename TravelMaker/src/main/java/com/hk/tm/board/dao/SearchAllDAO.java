package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;

@Repository
public class SearchAllDAO {
	@Autowired
	SqlSession sqlSession;

	public List<NoticeVO> boardSearchAll() {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchAll");
		return list;
	}

	public List<NoticeVO> searchIdList(String result) {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchID",result);
		return list;
	}

	public List<NoticeVO> searchTitleList(String result) {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchTitle",result);
		return list;
	}

	public List<NoticeVO> searchContentList(String result) {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchContent",result);
		return list;
	}

	public List<NoticeVO> searchTitleContentList(String result) {
		// TODO Auto-generated method stub
		List<NoticeVO>list = sqlSession.selectList("mapper.boardNotice.selectUnionSearchTitleContent",result);
		return list;
	}

	public NoticeVO selectNoticeOne(int randomNO) {
		// TODO Auto-generated method stub
		NoticeVO notice = sqlSession.selectOne("mapper.boardNotice.selectOneNotice", randomNO);
		return notice;
	}

	public PromotionVO selectPromotionOne(int randomNO) {
		// TODO Auto-generated method stub
		PromotionVO promotion = sqlSession.selectOne("mapper.boardPromotion.selectOnePromotion", randomNO);
		return promotion;
	}

	public ReviewVO selectReviewOne(int randomNO) {
		// TODO Auto-generated method stub
		ReviewVO review = sqlSession.selectOne("mapper.boardReview.selectOne", randomNO);
		return review;
	}

	public TravelVO selectTravelOne(int randomNO) {
		// TODO Auto-generated method stub
		TravelVO travel = sqlSession.selectOne("mapper.boardTravel.selectOne", randomNO);
		return travel;
	}
}
