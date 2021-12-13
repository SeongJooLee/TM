package com.hk.tm.board.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.NoticeDAO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;

	@Autowired
	ImageDAO imageDAO;
	
	public List<NoticeVO> allList() {
		// TODO Auto-generated method stub
		return noticeDAO.allList();
	}

	public Map<String, Object> oneList(int noticeNO) {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = noticeDAO.oneList(noticeNO);
		ImageVO imageVO = imageDAO.oneListNotice(noticeVO.getNoticeNO());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice", noticeVO);
		map.put("image", imageVO);
		
		return map;
	}
	
	public int oneMaxList() {
		// TODO Auto-generated method stub
		return noticeDAO.oneMaxList();
	}

	public void boardAdd(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		noticeDAO.boardAdd(noticeVO);
		imageDAO.noticeAdd(imageVO);
		
	}

	public void noticeUpdate(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		
		
	}



}
