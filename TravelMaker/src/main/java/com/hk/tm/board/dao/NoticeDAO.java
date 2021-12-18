package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.SelectPageVO;

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
		NoticeVO noticeVO = sql.selectOne(ns+"selectOneNotice",noticeNO);
		return noticeVO;
	}

	public int selectMaxNotice() {
		int noticeNO = sql.selectOne(ns+"selectMaxNotice",null);
		return noticeNO;
	}
	
	public void noticeAdd(NoticeVO noticeVO) {
		sql.insert(ns+"insertNotice",noticeVO);
	}

	public void noticeUpdate(NoticeVO noticeVO) {
		sql.update(ns+"updateNotice", noticeVO);
	}

	public void noticeDelete(int noticeNO) {
		sql.delete(ns+"deleteNotice",noticeNO);
	}

	public List<NoticeVO> selectCategoryNotice(String key) {
		List<NoticeVO> list = sql.selectList(ns+"selectCategory",key);
		return list;
	}

	public List<NoticeVO> selectPageNotice(SelectPageVO selectPageVO) {
		List<NoticeVO>list = sql.selectList(ns+"selectPageNotice", selectPageVO);
		return list;
	}
}
