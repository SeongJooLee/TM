package com.hk.tm.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.CategoryDAO;
import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.PromotionDAO;
import com.hk.tm.board.vo.PromotionVO;

@Service
public class PromotionService {

	@Autowired
	PromotionDAO promotionDAO;
	
	@Autowired
	ImageDAO imageDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	public List<PromotionVO> selectAllPromotion() {
		// TODO Auto-generated method stub
		return promotionDAO.selectAllPromotion();
	}
	public Map<String, Object> selectOneNotice(int promotionNO) {
		PromotionVO promotionVO = promotionDAO.selectOneNotice(promotionNO);
//		ImageVO imageVO = imageDAO.oneListNotice(noticeVO.getNoticeNO());
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("notice", noticeVO);
//		map.put("image", imageVO);
		
		return null;
	}

}
