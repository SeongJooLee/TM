package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.ReviewDAO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.ReviewVO;
@Service
public class ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	ImageDAO imageDAO;
	
	
	public List<ReviewVO> boardAllList() {
		// TODO Auto-generated method stub
		return reviewDAO.boardAllList();
	}

	public Map<String, Object> selectOne(int reviewNO) {
		// TODO Auto-generated method stub
		ReviewVO reviewVO = reviewDAO.selectOne(reviewNO);
		ImageVO imageVO = imageDAO.selectOne(reviewVO.getReviewNO());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("review", reviewVO);
		map.put("image", imageVO);
		
		return map;
	}

}
