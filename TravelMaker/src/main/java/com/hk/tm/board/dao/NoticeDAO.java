package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;

@Repository
public class NoticeDAO {

	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardNotice.";
	
	public List<NoticeVO> selectAllNotice() {
		List<NoticeVO> list = sql.selectList(ns+"selectAllNotice");
		
		return list;
	}

	public NoticeVO selectOneNotice(int noticeNO) {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = sql.selectOne(ns+"selectOneNotice",noticeNO);
		return noticeVO;
	}

	public int selectMaxNotice() {
		// TODO Auto-generated method stub
		int noticeNO = sql.selectOne(ns+"selectMaxNotice",null);
		
		return noticeNO;
	}
	
	public void boardAdd(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		sql.insert(ns+"insertNotice",noticeVO);
	}

	public void boardUpdate(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		sql.update(ns+"updateNotice", noticeVO);
	}

	public void noticeDelete(int noticeNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deleteNotice",noticeNO);
	}




}
