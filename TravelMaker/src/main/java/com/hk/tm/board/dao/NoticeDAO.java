package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardNotice.";
	
	public List<NoticeVO> allList() {
		List<NoticeVO> list = sql.selectList(ns+"selectAll");
		
		return list;
	}

	public NoticeVO oneList(int noticeNO) {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = sql.selectOne(ns+"selectOne",noticeNO);
		
		return noticeVO;
	}

	public void boardAdd(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		System.out.println(noticeVO.toString());
		sql.insert(ns+"insert",noticeVO);
	}

}
