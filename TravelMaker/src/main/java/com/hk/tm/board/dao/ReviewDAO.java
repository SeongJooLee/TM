package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ReviewVO;
@Repository
public class ReviewDAO {
	
	SqlSession sql;
	String ns = "mapper.board.";
	
	public List<ReviewVO> boardAllList() {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sql.selectList(ns+"allList");
		return list;
	}

}
