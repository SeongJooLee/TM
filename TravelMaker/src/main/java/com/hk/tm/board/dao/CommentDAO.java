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
	
	public CommentVO selectOneComment(String id) {
		
		CommentVO commentVO = sql.selectOne(ns + "selectOneComment" , id);

		return commentVO;
	}

	public void addComment(CommentVO commentVO) {
		
		sql.insert(ns + "insertComment", commentVO);
	}
	
	public void updateComment(CommentVO commentVO) {
		
		sql.update(ns + "updateComment", commentVO);
	}

	public void deleteComment(String id) {
		
		sql.delete(ns + "deleteComment", id);
	}

	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		List<CommentVO> list = sql.selectList(ns+"select",id);
		return list;
	}

}
