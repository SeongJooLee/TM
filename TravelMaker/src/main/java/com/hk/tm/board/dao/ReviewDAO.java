package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.ReviewVO;
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
	
	public ReviewVO selectOne(int reviewNO) {
		// TODO Auto-generated method stub
		ReviewVO reviewVO = sql.selectOne(ns+"selectOne",reviewNO);
		return reviewVO;
	}

	public void reviewUpdate(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		sql.update(ns+"update", reviewVO);
	}

	public void promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deletePromotion",promotionNO);
	}

} 