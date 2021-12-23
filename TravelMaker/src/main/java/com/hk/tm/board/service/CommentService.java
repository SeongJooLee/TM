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

	public List<CommentVO> selectAllComments(int travelNO) {
		return commentDAO.selectAllComments();
	}

	public Map<String, Object> selectOneComment(int TravelNO) {
		
		CommentVO commentVO = commentDAO.selectOneComment(TravelNO);
		TravelVO travelVO = TravelDAO.selectOneComment(TravelNO);		
		//ReviewVO reviewVO = ReviewDAO.selectOneComment(reviewNO);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("comment", commentVO);
		map.put("travel" , travelVO);
		//map.put("review", reviewVO);
		
		return map;
	}
	
	public void updateComment(CommentVO commentVO) {
		
		commentDAO.updateComment(commentVO);
	}
	
	public void addComment(CommentVO commentVO) {		
		
		commentDAO.addComment(commentVO);// 여기문제
	}

	public CommentVO travelDelete(int travelNO) {
		// TODO Auto-generated method stub
		CommentVO commentVO = commentDAO.selectOneComment(travelNO);
		commentDAO.travelDelete(travelNO);
		
		return commentVO;
	}
	
	public List<CommentVO> selectUserComment(String id) {
		// TODO Auto-generated method stub
		return commentDAO.selectUserComment(id);
	}

	public List<CommentVO> selectTravelComment(int travelNO) {
		return commentDAO.selectTravelComment(travelNO);
	}

	public int addTravelComment(CommentVO commentVO) {
		return commentDAO.addTravelComment(commentVO);
	}

	public List<CommentVO> selectReviewComment(int reviewNO) {
		return commentDAO.selectReviewComment(reviewNO);
	}

	public int addReviewComment(CommentVO commentVO) {
		return commentDAO.addReviewComment(commentVO);
	}
}
