package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.CommentDAO;
import com.hk.tm.board.dao.ReviewDAO;
import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.vo.CommentVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;

@Service
public class CommentService {
	
	@Autowired
	CommentDAO commentDAO;	
	
	@Autowired
	TravelDAO travelDAO;
	
	@Autowired
	ReviewDAO reviewDAO;

	public List<CommentVO> selectAllComments() {
		// TODO Auto-generated method stub
		return commentDAO.selectAllComments();
	}

	public Map<String, Object> selectOneComment(String id) {
		
		CommentVO commentVO = commentDAO.selectOneComment(id);
		TravelVO travelVO = TravelDAO.selectOneComment(id);
		//ReviewVO reviewVO = ReviewDAO.selectOneComment(id);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("comment", commentVO);
		map.put("travel" , travelVO);
		//map.put("review", reviewVO);
		
		return map;
	}
	
	public void updateComment(CommentVO commentVO) {
		
		commentDAO.updateComment(commentVO);
	}
	
	public void addComment(CommentVO commentVO, TravelVO travelVO, ReviewVO reviewVO) {		
		
		commentDAO.addComment(commentVO);// 여기문제
		travelDAO.addTravel(travelVO);
		reviewDAO.addReview(reviewVO);
	}

	public CommentVO deleteComment(String id) {
		// TODO Auto-generated method stub
		CommentVO commentVO = commentDAO.selectOneComment(id);
		commentDAO.deleteComment(id);
		
		return commentVO;
	}
	
	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		return commentDAO.selectUserComment(id);
	}

}
