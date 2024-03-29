package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.tm.board.dao.CategoryDAO;
import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.NoticeDAO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.SelectPageVO;

@Service
public class NoticeService {

	@Autowired
	NoticeDAO noticeDAO;

	@Autowired
	ImageDAO imageDAO;

	@Autowired
	CategoryDAO categoryDAO;

	public List<NoticeVO> selectAllNotice() {
		return noticeDAO.selectAllNotice();
	}

	public Map<String, Object> selectOneNotice(int noticeNO) {
		NoticeVO noticeVO = noticeDAO.selectOneNotice(noticeNO);
		ImageVO imageVO = imageDAO.selectOneNotice(noticeVO.getNoticeNO());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notice", noticeVO);
		map.put("image", imageVO);

		return map;
	}

	public int selectMaxNotice() {
		return noticeDAO.selectMaxNotice();
	}
	
	@Transactional(rollbackFor = {Exception.class})
	public void noticeAdd(NoticeVO noticeVO, ImageVO imageVO) {
		
		try {
			noticeDAO.noticeAdd(noticeVO);
			imageDAO.noticeAdd(imageVO);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Eror!!!");
		
		}
		
	}

	public void noticeUpdate(NoticeVO noticeVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		noticeDAO.noticeUpdate(noticeVO);
		imageDAO.noticeUpdate(imageVO);
	}

	public NoticeVO noticeDelete(int noticeNO) {
		imageDAO.noticeDelete(noticeNO);

		NoticeVO noticeVO = noticeDAO.selectOneNotice(noticeNO);

		noticeDAO.noticeDelete(noticeNO);

		return noticeVO;

	}

	public int noticeImgDelete(int noticeNO) {
		return imageDAO.noticeImgDelete(noticeNO);
	}

	public List<NoticeImageVO> selectCategoryNotice(String key) {
		return noticeDAO.selectCategoryNotice(key);
	}

	public List<NoticeVO> selectPageNotice(SelectPageVO selectPageVO) {
		return noticeDAO.selectPageNotice(selectPageVO);
	}

	public List<NoticeImageVO> selectAllNoticeImage(SelectPageVO selectPageVO) {
		return noticeDAO.selectAllNoticeImage(selectPageVO); 
	}

	public List<NoticeImageVO> selectHomeNoticeImage() {
		// TODO Auto-generated method stub
		return noticeDAO.selectHomeNoticeImage();
	}
}
