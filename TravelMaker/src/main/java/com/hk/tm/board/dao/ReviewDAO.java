package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.ReviewImageVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.SelectPageVO;
import com.hk.tm.member.vo.UserVO;
@Repository
public class ReviewDAO {
	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardReview.";

	public List<ReviewVO> boardAllList() {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sql.selectList(ns+"selectAll");
		return list;
	}
	
	public int selectMaxReview() {
		int reviewNO = sql.selectOne(ns+"selectMaxReview",null);
		return reviewNO;
	}
	
	public ReviewVO selectOne(int reviewNO) {
		// TODO Auto-generated method stub
		ReviewVO reviewVO = sql.selectOne(ns+"selectOne",reviewNO);
		return reviewVO;
	}

	public void reviewUpdate(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		sql.update(ns+"reviewUpdate", reviewVO);
	}

	public void reviewDelete(int reviewNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"reviewDelete",reviewNO);
	}

	public void promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deletePromotion",promotionNO);
		
	}

	public List<ReviewVO> userReviewList(UserVO userVO) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sql.selectList(ns+"selectUserReview",userVO.getId());
		return list;
	}

	public List<ReviewVO> selectPageReview(SelectPageVO selectPageVO) {
		List<ReviewVO> list = sql.selectList(ns+"selectPageReview",selectPageVO);
		return list;
	}

	public static ReviewVO selectOneComment(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 댓글관련
	public void addReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		sql.insert(ns + "insertReview", reviewVO);
	}

	public List<ReviewImageVO> selectAllReviewImage(SelectPageVO selectPageVO) {
		List<ReviewImageVO> list = sql.selectList(ns+"selectPageReviewImage",selectPageVO);
		
		return list;
	}



} 