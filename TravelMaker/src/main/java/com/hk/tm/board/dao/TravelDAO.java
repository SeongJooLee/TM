package com.hk.tm.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.tm.board.vo.TravelVO;

@Repository
public class TravelDAO {
	
	@Autowired
	SqlSession sqlSession;	
	
	public List<TravelVO> selectAllTravels() {
		// TODO Auto-generated method stub
		List<TravelVO> travelsList = sqlSession.selectList("mapper.board.selectAllTravelList");
		
		return travelsList;
	}
}
