package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.PromotionDAO;
import com.hk.tm.board.dao.ReservationDAO;
import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.PromotionVO;
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

	public Map<String, Object> selectOneReservation(ReservationVO reserVO) {
		Map<String,Object> map = new HashMap<String,Object>();
		reserVO = reserDAO.selectOneReservation(reserVO);
		int promotionNO = reserVO.getPromotionNO();
		PromotionImageVO promotionImageVO = promotionDAO.selectOneReservation(promotionNO);

		map.put("reser", reserVO);
		map.put("promotion", promotionImageVO);
		return map;
	}

	public void insertPayment(String reserNO) {
		reserDAO.insertPayment(reserNO);
	}
}
