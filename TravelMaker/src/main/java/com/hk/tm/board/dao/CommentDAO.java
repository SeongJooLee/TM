package com.hk.tm.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.CommentVO;
import com.hk.tm.board.vo.TravelVO;

@Repository
public class CommentDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardComment.";
	
	public List<CommentVO> selectAllComments() {
		
		List<CommentVO> list = sql.selectList(ns+ "selectAllComments");
		
		return list;
	}
	
	public CommentVO selectOneComment(int commentNO) {
		
		CommentVO commentVO = sql.selectOne(ns + "selectOneComment" , commentNO);

		return commentVO;
	}

	public void addComment(CommentVO commentVO) {
		
		sql.insert(ns + "insertComment", commentVO);
	}
	
	public void updateComment(CommentVO commentVO) {
		
		sql.update(ns + "updateComment", commentVO);
	}

	public void deleteComment(int commentNO) {
		
		sql.delete(ns + "deleteComment", commentNO);
	}

	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		List<CommentVO> list = sql.selectList(ns+"select",id);
		return list;
	}

}
