package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.dao.UserDAO;
import com.hk.tm.member.vo.UserVO;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);
	
	@Autowired
	TravelDAO travelDAO;	
	
	UserDAO userDAO;	
	
	ImageDAO imageDAO;
	
	public List<TravelVO> allList() {
		// TODO Auto-generated method stub
		return travelDAO.allList();
	}
	
	public Map<String, Object> selectOneTravel(int travelNO) {
		// TODO Auto-generated method stub
		TravelVO travelVO = travelDAO.selectOneTravel(travelNO);
		//UserVO userVO = userDAO.selectOneTravel(travelVO.getId());
		ImageVO imageVO = imageDAO.selectOneTravel(travelVO.getTravelNO());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("travel", travelVO);
		//map.put("user", userVO);
		map.put("image", imageVO);
		
		return map;
	}
	
	public int addTravel(TravelVO travelVO) {		
		// TODO Auto-generated method stub
		return travelDAO.addTravel(travelVO);
	}

	public void updateTravel(TravelVO travelVO, ImageVO imageVO) {
		// TODO Auto-generated method stub
		travelDAO.updateTravel(travelVO);
		imageDAO.travelUpdate(travelVO,imageVO);
	}
	
	public int removeTravel(int travelNO) {
		return travelDAO.deleteTravel(travelNO);
	}

	public int selectMaxTravel() {
		// TODO Auto-generated method stub
		return 0;
	}


}
