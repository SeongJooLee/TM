package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.CategoryDAO;
import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.vo.CategoryVO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.TravelImageVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.dao.UserDAO;
import com.hk.tm.member.vo.UserVO;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);
	
	@Autowired
	TravelDAO travelDAO;			
	
	ImageDAO imageDAO;
	
	CategoryDAO categoryDAO;
	
	public List<TravelVO> selectAllTravels() {
		// TODO Auto-generated method stub
		return travelDAO.selectAllTravels();
	}
	
	public Map<String, Object> selectOneTravel(int travelNO) {
		// TODO Auto-generated method stub
		TravelVO travelVO = travelDAO.selectOneTravel(travelNO);		
		ImageVO imageVO = imageDAO.selectOneTravel(travelNO); // 여기 문제
		CategoryVO categoryVO = categoryDAO.selectOneTravel(travelNO);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("travel", travelVO);		
		map.put("image", imageVO);
		map.put("category", categoryVO);
		
		return map;
	}
	
	public void addTravel(TravelVO travelVO, ImageVO imageVO, CategoryVO categoryVO) {		
		// TODO Auto-generated method stub
		travelDAO.addTravel(travelVO);
		imageDAO.addTravel(imageVO);
		categoryDAO.addTravel(categoryVO);// 여기 문제
	}

	public void updateTravel(TravelVO travelVO, ImageVO imageVO, CategoryVO categoryVO) {
		// TODO Auto-generated method stub
		travelDAO.updateTravel(travelVO);
		imageDAO.travelUpdate(travelVO,imageVO);
		categoryDAO.updateTravel(categoryVO);
		imageVO.setTravelNO(travelVO.getTravelNO());
		categoryVO.setTravelNO(travelVO.getTravelNO());
	}
	
	public TravelVO deleteTravel(int travelNO) {
		imageDAO.deleteTravel(travelNO);
		categoryDAO.deleteTravel(travelNO);		
		travelDAO.deleteTravel(travelNO);
		TravelVO travelVO = travelDAO.selectOneTravel(travelNO);		
		
		return travelVO;
	}

	public int selectMaxTravel() {
		// TODO Auto-generated method stub
		return travelDAO.selectMaxTravel();
	}
	
	public int travelImgDelete(int travelNO) {
		// TODO Auto-generated method stub				
		return imageDAO.travelImgDelete(travelNO);
	}

	public List<TravelImageVO> selectAllTravelImage() {
		// TODO Auto-generated method stub
		return travelDAO.selectAllTravelImage();
	}
}	
