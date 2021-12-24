package com.hk.tm.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.dao.CategoryDAO;
import com.hk.tm.board.dao.CommentDAO;
import com.hk.tm.board.dao.ImageDAO;
import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.vo.CategoryVO;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.SelectPageVO;
import com.hk.tm.board.vo.TravelImageVO;
import com.hk.tm.board.vo.TravelVO;

@Service
public class TravelService {
	private static final Logger logger = LoggerFactory.getLogger(TravelService.class);

	@Autowired
	TravelDAO travelDAO;

	@Autowired
	ImageDAO imageDAO;

	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	CommentDAO commentDAO;

	public List<TravelVO> selectAllTravels() {

		return travelDAO.selectAllTravels();
	}

	public List<TravelImageVO> selectAllTravelImage(SelectPageVO selectPageVO) {

		return travelDAO.selectAllTravelImage(selectPageVO);
	}

	public Map<String, Object> selectOneTravel(int travelNO) {

		TravelVO travelVO = travelDAO.selectOneTravel(travelNO);
		ImageVO imageVO = imageDAO.selectOneTravel(travelNO);
		CategoryVO categoryVO = categoryDAO.selectOneTravel(travelNO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("travel", travelVO);
		map.put("image", imageVO);
		map.put("category", categoryVO);

		return map;
	}

	public int selectMaxTravel() {

		return travelDAO.selectMaxTravel();
	}

	public void addTravel(TravelVO travelVO, ImageVO imageVO, CategoryVO categoryVO) {

		travelDAO.addTravel(travelVO);
		imageDAO.addTravel(imageVO);
		categoryDAO.addTravel(categoryVO);
	}

	public void updateTravel(TravelVO travelVO, ImageVO imageVO, CategoryVO categoryVO) {

		travelDAO.updateTravel(travelVO);
		imageDAO.travelUpdate(travelVO, imageVO);
		categoryDAO.updateTravel(categoryVO);
	}

	public TravelVO deleteTravel(int travelNO) {
		//게시글 삭제를 위한 재료
		commentDAO.deleteTravel(travelNO);
		
		imageDAO.deleteTravel(travelNO);
		categoryDAO.deleteTravel(travelNO);
		TravelVO travelVO = travelDAO.selectOneTravel(travelNO);

		travelDAO.deleteTravel(travelNO);

		return travelVO;
	}

	public int travelImgDelete(int travelNO) {

		return imageDAO.travelImgDelete(travelNO);
	}

	public List<TravelImageVO> selectCategoryTravel(String key) {

		return travelDAO.selectCategoryTravel(key);
	}

	public List<TravelVO> selectUserTravel(String id) {
		// TODO Auto-generated method stub
		return travelDAO.selectUserTravel(id);
	}

	public List<TravelImageVO> selectHomeTravelImage() {
		// TODO Auto-generated method stub
		return travelDAO.selectHomeTravelImage();
	}
}
