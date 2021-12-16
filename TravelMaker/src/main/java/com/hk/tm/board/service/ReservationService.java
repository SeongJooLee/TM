package com.hk.tm.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.PromotionDAO;
import com.hk.tm.board.dao.ReservationDAO;
import com.hk.tm.board.vo.PromotionImageVO;
@Service
public class ReservationService {

	@Autowired
	ReservationDAO reserDAO;
	
	@Autowired
	PromotionDAO promotionDAO;
	
	public PromotionImageVO selectOnePromotion(int promotionNO) {
		// TODO Auto-generated method stub
		return promotionDAO.selectOneReservation(promotionNO);
	}

}
