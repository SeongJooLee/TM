package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.dao.UserDAO;
import com.hk.tm.member.vo.UserVO;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);
	
	@Autowired
	TravelDAO travelDAO;
	
	@Autowired
	UserDAO userDAO;
	
	public List<TravelVO> allList() {
		// TODO Auto-generated method stub
		return travelDAO.allList();
	}
	
	public Map<String, Object> oneList(int travelNO) {
		// TODO Auto-generated method stub
		TravelVO travelVO = travelDAO.oneList(travelNO);
		UserVO userVO = userDAO.oneList(travelVO.getId());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("travel", travelVO);
		map.put("user", userVO);
		
		return map;
	}
	
	public int addTravel(TravelVO travelVO) {		
		// TODO Auto-generated method stub
		return travelDAO.addTravel(travelVO);
	}

	public int modTravel(TravelVO travelVO) {
		return travelDAO.updateTravel(travelVO);
	}
	
	public int removeTravel(int travelNO) {
		return travelDAO.deleteTravel(travelNO);
	}


}
