package com.hk.tm.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.SearchAllDAO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;

@Service
public class SearchAllService {
	@Autowired
	SearchAllDAO searchAllDAO;

	public List<NoticeVO> boardSearchAll() {
		// TODO Auto-generated method stub
		return searchAllDAO.boardSearchAll();
	}

	public List<NoticeVO> searchIdList(String result) {
		// TODO Auto-generated method stub
		return searchAllDAO.searchIdList(result);
	}

	public List<NoticeVO> searchTitleList(String result) {
		// TODO Auto-generated method stub
		return searchAllDAO.searchTitleList(result);
	}

	public List<NoticeVO> searchContentList(String result) {
		// TODO Auto-generated method stub
		return searchAllDAO.searchContentList(result);
	}

	public List<NoticeVO> searchTitleContentList(String result) {
		// TODO Auto-generated method stub
		return searchAllDAO.searchTitleContentList(result);
	}

	public NoticeVO selectNoticeOne(int randomNO) {
		// TODO Auto-generated method stub
		return searchAllDAO.selectNoticeOne(randomNO);
	}

	public PromotionVO selectPromotionOne(int randomNO) {
		// TODO Auto-generated method stub
		return searchAllDAO.selectPromotionOne(randomNO);
	}

	public ReviewVO selectReviewOne(int randomNO) {
		// TODO Auto-generated method stub
		return searchAllDAO.selectReviewOne(randomNO);
	}

	public TravelVO selectTravelOne(int randomNO) {
		// TODO Auto-generated method stub
		return searchAllDAO.selectTravelOne(randomNO);
	}
}
