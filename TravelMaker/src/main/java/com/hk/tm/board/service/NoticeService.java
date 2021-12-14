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
	
	public List<NoticeVO> selectAllNotice() {
		// TODO Auto-generated method stub
		return noticeDAO.selectAllNotice();
	}

	public Map<String, Object> selectOneNotice(int noticeNO) {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = noticeDAO.selectOneNotice(noticeNO);
		ImageVO imageVO = imageDAO.oneListNotice(noticeVO.getNoticeNO());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice", noticeVO);
		map.put("image", imageVO);
		
		return map;
	}
	
	public int selectMaxNotice() {
		// TODO Auto-generated method stub
		return noticeDAO.selectMaxNotice();
	}

	public void boardAdd(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		noticeDAO.boardAdd(noticeVO);
		imageDAO.noticeAdd(imageVO);
	}
	
	public void boardUpdate(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		noticeDAO.boardUpdate(noticeVO);
		imageDAO.noticeUpdate(noticeVO,imageVO);
	}

	public NoticeVO noticeDelete(int noticeNO) {
		// TODO Auto-generated method stub
		imageDAO.noticeDelete(noticeNO);
		NoticeVO noticeVO = noticeDAO.selectOneNotice(noticeNO);
		noticeDAO.noticeDelete(noticeNO);
		
		return noticeVO;
		
	}




}
