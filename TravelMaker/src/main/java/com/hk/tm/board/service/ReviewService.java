package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.ReviewDAO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.ReviewImageVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.SelectPageVO;
import com.hk.tm.member.vo.UserVO;
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

	public int selectMaxReview() {
		return reviewDAO.selectMaxReview();
	}


	public void reviewUpdate(ReviewVO reviewVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		
		reviewDAO.reviewUpdate(reviewVO);
		imageDAO.reviewUpdate(imageVO);
		
	}
	
	public ReviewVO reviewDelete(int reviewNO) {
		imageDAO.reviewDelete(reviewNO);
		
		ReviewVO reviewVO = reviewDAO.selectOne(reviewNO);
		
		reviewDAO.reviewDelete(reviewNO);
		
		return reviewVO;
		
	}

	public int reviewImgDelete(int reviewNO) {
		return imageDAO.reviewImgDelete(reviewNO);
	}

	public List<ReviewVO> userReviewList(UserVO userVO) {
		// TODO Auto-generated method stub
		return reviewDAO.userReviewList(userVO);
	}

	public List<ReviewVO> selectPageReview(SelectPageVO selectPageVO) {
		return reviewDAO.selectPageReview(selectPageVO);
	}

	public List<ReviewImageVO> selectAllReviewImage(SelectPageVO selectPageVO) {
		return reviewDAO.selectAllReviewImage(selectPageVO);
	}

}
