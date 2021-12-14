package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.TravelVO;

@Repository
public class TravelDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardTravel.";
	
	public List<TravelVO> allList() {
		// TODO Auto-generated method stub
		List<TravelVO> list = sql.selectList(ns+ "selectAllTravels");
		
		return list;
	}
	
	public TravelVO oneList(int travelNO) {
		TravelVO travelVO = sql.selectOne(ns + "selectOne" , travelNO);		
		return travelVO;
	}

	public int addTravel(TravelVO travelVO) {		
		int ret = sql.insert(ns + "insert", travelVO);
		return ret;
	}
	
	public int updateTravel(TravelVO travelVO) {
		int ret = sql.update(ns + "update", travelVO);
		return ret;
	}
	
	public int deleteTravel(int travelNO) {
		int ret = sql.delete(ns + "delete", travelNO);
		return ret;
	}
}
