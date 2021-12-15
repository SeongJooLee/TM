package com.hk.tm;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.TravelVO;

@Repository
public class testTravelDAO {
	
	@Autowired
	SqlSession sql;	
	
	String ns = "mapper.boardTravel.";


	public List selectAllTravels(Map pagingMap) throws DataAccessException {
		// TODO Auto-generated method stub
		List<TravelVO> list = sql.selectList(ns+ "selectAllTravels" , pagingMap);
		
		return list;
				
		public int selectTotTravels() throws DataAccessException {
			int totTravels = sql.selectOne("mapper.travel.selectTotTravels");
			return totTravels;
		}
	}
}
