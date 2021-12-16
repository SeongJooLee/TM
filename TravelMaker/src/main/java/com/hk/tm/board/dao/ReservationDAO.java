package com.hk.tm.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {
	
	@Autowired
	SqlSession sql;
	
	String ns = "mapper.boardReservation.";
	
	public void promotionDelete(int promotionNO) {
		// TODO Auto-generated method stub
		sql.delete(ns+"deletePromotion",promotionNO);	
	}

}
