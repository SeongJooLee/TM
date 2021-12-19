package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.CommentVO;


@Repository
public class CommentDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardComment.";
	
	public List<CommentVO> selectAllComments() {
		
		List<CommentVO> list = sql.selectList(ns+ "selectAllComments");
		
		return list;
	}
	
	public CommentVO selectOneComment(int travelNO) {
		
		CommentVO commentVO = sql.selectOne(ns + "selectOneComment" , travelNO);

		return commentVO;
	}

	public void addComment(CommentVO commentVO) {
		
		sql.insert(ns + "insertComment", commentVO);// 여기 문제?
	}
	
	public void updateComment(CommentVO commentVO) {
		
		sql.update(ns + "updateComment", commentVO);
	}

	public void deleteComment(int travelNO) {
		
		sql.delete(ns + "deleteComment", travelNO);
	}

	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		List<CommentVO> list = sql.selectList(ns+"select",id);
		return list;
	}

	public List<CommentVO> selectTravelComment(int travelNO) {
		List<CommentVO> list = sql.selectList(ns+"selectTravelComment", travelNO);
		
		return list;
	}

	public int addTravelComment(CommentVO commentVO) {
		int ret = sql.insert(ns+"addTravelComment",commentVO);
		
		return ret;
	}

}
