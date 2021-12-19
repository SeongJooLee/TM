package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.ReservationVO;

@Repository
public class ReservationDAO {
	
	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardReservation.";
	
	public void promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deletePromotion",promotionNO);	
	}

	public ReservationVO insertReservation(ReservationVO reserVO) {
		int ret = sql.insert(ns+"insertReservation",reserVO);

		if(ret==1) {
			reserVO = sql.selectOne(ns+"selectOneReservation",reserVO);
			System.out.println("여기 사용하니? "+reserVO.toString());
			return reserVO;
		}
		return null;
	}

	public int deleteReservation(ReservationVO reserVO) {
		int ret = sql.delete(ns+"deleteReservation",reserVO);
		return ret;
	}

	public ReservationVO selectOneReservation(ReservationVO reserVO) {
		// TODO Auto-generated method stub
		reserVO = sql.selectOne(ns+"selectOneReservationView",reserVO);
		return reserVO;
	}

}
