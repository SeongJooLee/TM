package com.hk.tm.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.SearchAllDAO;
import com.hk.tm.board.vo.NoticeVO;

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
}
