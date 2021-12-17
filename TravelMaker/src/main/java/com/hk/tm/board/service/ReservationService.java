package com.hk.tm.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.PromotionDAO;
import com.hk.tm.board.dao.ReservationDAO;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.ReservationVO;
@Service
public class ReservationService {

	@Autowired
	ReservationDAO reserDAO;
	
	@Autowired
	PromotionDAO promotionDAO;
	
	public PromotionImageVO selectOnePromotion(int promotionNO) {
		return promotionDAO.selectOneReservation(promotionNO);
	}

	public ReservationVO insertReservation(ReservationVO reserVO) {
		return reserDAO.insertReservation(reserVO);
	}

	public int deleteReservation(ReservationVO reserVO) {
		return reserDAO.deleteReservation(reserVO);
	}
}
