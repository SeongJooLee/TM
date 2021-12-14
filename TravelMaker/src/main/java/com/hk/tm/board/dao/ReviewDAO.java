package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

} 