package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.CommentDAO;
import com.hk.tm.board.vo.CommentVO;
import com.hk.tm.board.vo.TravelVO;


@Service
public class CommentService {
	
	@Autowired
	CommentDAO commentDAO;	

	public List<CommentVO> selectAllcomments() {
		// TODO Auto-generated method stub
		return commentDAO.selectAllComments();
	}

	public Map<String, Object> selectOneComment(int commentNO) {
		
		CommentVO commentVO = commentDAO.selectOneComment(commentNO);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("comment", commentVO);
		return map;
	}
	
	public void updateComment(CommentVO commentVO) {
		
		commentDAO.updateComment(commentVO);
	}
	
	public void addComment(CommentVO commentVO) {		
		
		commentDAO.addComment(commentVO);
	}

	public CommentVO deleteComment(int commentNO) {
		// TODO Auto-generated method stub
		CommentVO commentVO = commentDAO.selectOneComment(commentNO);
		commentDAO.deleteComment(commentNO);
		
		return commentVO;
	}
	
	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		return commentDAO.selectUserComment(id);
	}

}
