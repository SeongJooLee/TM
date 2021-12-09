package com.hk.tm.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.vo.TravelVO;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);
	
	@Autowired
	TravelDAO travelDAO;

	public List<TravelVO> listTravels() {
		// TODO Auto-generated method stub
		return travelDAO.selectAllTravels();
	}

}
