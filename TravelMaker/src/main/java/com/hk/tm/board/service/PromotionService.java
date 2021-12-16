package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.CategoryDAO;
import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.PromotionDAO;
import com.hk.tm.board.dao.ReservationDAO;
import com.hk.tm.board.dao.ReviewDAO;
import com.hk.tm.board.vo.CategoryVO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.PromotionVO;

@Service
public class PromotionService {

	@Autowired
	PromotionDAO promotionDAO;
	
	@Autowired
	ImageDAO imageDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ReservationDAO reservationyDAO;
	
	@Autowired
	ReviewDAO reviewDAO;
	
	public List<PromotionVO> selectAllPromotion() {
		// TODO Auto-generated method stub
		return promotionDAO.selectAllPromotion();
	}
	
	public Map<String, Object> selectOneNotice(int promotionNO) {
		PromotionVO promotionVO = promotionDAO.selectOnePromotion(promotionNO);
		ImageVO imageVO = imageDAO.selectOnePromotion(promotionNO);
		CategoryVO categoryVO = categoryDAO.selectOnePromotion(promotionNO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("promotion", promotionVO);
		map.put("image", imageVO);
		map.put("category", categoryVO);
		
		return map;
	}

	public int selectMaxPromotion() {
		// TODO Auto-generated method stub
		return promotionDAO.selectMaxNotice();
	}

	public void promotionAdd(PromotionVO promotionVO, ImageVO imageVO, CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		promotionDAO.promotionAdd(promotionVO);
		imageDAO.promotionAdd(imageVO);
		categoryDAO.promotionAdd(categoryVO);
	}

	public void promotionUpdate(PromotionVO promotionVO, ImageVO imageVO, CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		promotionDAO.promotionUpdate(promotionVO);
		imageVO.setPromotionNO(promotionVO.getPromotionNO());
		categoryVO.setPromotionNO(promotionVO.getPromotionNO());
		imageDAO.promotionUpdate(imageVO);
		categoryDAO.promotionUpdate(categoryVO);
	}

	public PromotionVO promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		imageDAO.promotionDelete(promotionNO);
		categoryDAO.promotionDelete(promotionNO);
		reservationyDAO.promotionDelete(promotionNO);
		reviewDAO.promotionDelete(promotionNO);
		PromotionVO promotionVO = promotionDAO.selectOnePromotion(promotionNO);
		promotionDAO.promotionDelete(promotionNO);
		return promotionVO;
	}

	public int promotionImgDelete(int promotionNO) {
		// TODO Auto-generated method stub
		return imageDAO.promotionImgDelete(promotionNO);
	}
}
