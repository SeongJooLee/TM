package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.SelectPageVO;
import com.hk.tm.board.vo.TravelImageVO;
import com.hk.tm.board.vo.TravelVO;

@Repository
public class TravelDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardTravel.";
	
	public List<TravelVO> selectAllTravels() {
		
		List<TravelVO> list = sql.selectList(ns+ "selectAllTravels");
		
		return list;
	}
	
	public List<TravelImageVO> selectAllTravelImage(SelectPageVO selectPageVO) {
		
		List<TravelImageVO> list = sql.selectList(ns+"selectPageAllTravelImage",selectPageVO);
		return list;
	}
	
	public TravelVO selectOneTravel(int travelNO) {
		TravelVO travelVO = sql.selectOne(ns + "selectOneTravel" , travelNO);
		
		return travelVO;
	}
	
	public int selectMaxTravel() {
		
		int travelNO = sql.selectOne(ns+"selectMaxTravel", null); 
		
		return travelNO;
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

	public List<TravelImageVO> selectCategoryTravel(String key) {
		List<TravelImageVO> list = sql.selectList(ns+"selectCategory",key);
		return list;
	}

	public List<TravelVO> selectUserTravel(String id) {
		// TODO Auto-generated method stub
		List<TravelVO> list = sql.selectList(ns+"select",id);
		return list;
	}
	
	public List<TravelImageVO> selectHomeTravelImage() {
		// TODO Auto-generated method stub
		List<TravelImageVO> list = sql.selectList(ns+"selectHomeTravelImage");
		return list;
	}

	public static TravelVO selectOneComment(int travelNO) {
		// TODO Auto-generated method stub
		return null;
	}
}
