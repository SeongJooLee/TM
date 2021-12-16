package com.hk.tm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.tm.board.vo.TravelVO;



@Service
public class testTravelService {

	@Autowired
	testTravelDAO testtravelDAO;		

	
	
	  public Map selectAllTravels(Map pagingMap) throws Exception { // TODO
	  Auto-generated method stub Map travelsMap = new HashMap(); List<TravelVO>
	  travelsList = testtravelDAO.selectAllTravels(pagingMap); int totTravels =
	  testtravelDAO.selectTotTravels(); travelsMap.put("travelsList", travelsList);
	  travelsMap.put("totTravels", totTravels); return travelsMap; }
	 
}
