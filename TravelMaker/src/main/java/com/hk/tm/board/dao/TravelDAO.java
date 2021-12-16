package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.PromotionImageVO;
import com.hk.tm.board.vo.TravelImageVO;
import com.hk.tm.board.vo.TravelVO;

@Repository
public class TravelDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardTravel.";
	
	public List<TravelVO> selectAllTravels() {
		// TODO Auto-generated method stub
		List<TravelVO> list = sql.selectList(ns+ "selectAllTravels");
		
		return list;
	}
	
	public TravelVO selectOneTravel(int travelNO) {
		TravelVO travelVO = sql.selectOne(ns + "selectOneTravel" , travelNO);
		
		return travelVO;
	}

	public void addTravel(TravelVO travelVO) {		
		
		sql.insert(ns + "insertTravel", travelVO);

	}
	
	public void updateTravel(TravelVO travelVO) {
		
		sql.update(ns + "updateTravel", travelVO);

	}
	
	public void deleteTravel(int travelNO) {
		
		sql.delete(ns + "deleteTravel", travelNO);

	}

	public int selectMaxTravel() {
		
		int travelNO = sql.selectOne(ns+"selectMaxTravel", null);
		
		return travelNO;
	}
	
	public List<TravelImageVO> selectAllTravelImage() {
		// TODO Auto-generated method stub
		List<TravelImageVO> list = sql.selectList(ns+"selectAllTravelImage");
		return list;
	}
}
