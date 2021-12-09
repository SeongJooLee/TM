package com.hk.tm.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.ReviewDAO;
import com.hk.tm.board.vo.ReviewVO;
@Service
public class ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	
	public List<ReviewVO> boardAllList() {
		// TODO Auto-generated method stub
		return reviewDAO.boardAllList();
	}

}
