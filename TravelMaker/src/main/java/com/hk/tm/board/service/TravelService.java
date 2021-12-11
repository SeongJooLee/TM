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
	
	public List<TravelVO> listTravels() {
		// TODO Auto-generated method stub
		return travelDAO.selectAllTravels();
	}
	
	public Map<String,Object> viewTravel(int travelVO) {
		
		TravelVO travelVO = travelDAO.selectTravel(travelVO);
		UserVO userVO = userDAO.selectName(userVO.getId());
		logger.debug("travelVO = " + travelVO.toString());
		logger.debug("userVO = " + userVO.toString());
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("travelVO", travelVO);
		map.put("userVO", userVO);
		
		return map;
	}
	
	public int addTravel(TravelVO travelVO) {		
		// TODO Auto-generated method stub
		return travelDAO.addTravel(travelVO);
	}

}
