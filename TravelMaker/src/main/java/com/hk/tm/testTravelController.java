package com.hk.tm;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/board/")
public class testTravelController {
	
	@Autowired
	testTravelService testtravelService;

	@RequestMapping(value="testtravel" , method = { RequestMethod.GET , RequestMethod.POST })
	public ModelAndView travelList(HttpServletRequest request , HttpServletResponse response) throws Exception {
		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt(((_section == null)? "1":_section));
		int pageNum = Integer.parseInt(((_pageNum == null)? "1":_pageNum));
		Map pagingMap = new HashMap();
		pagingMap.put("section", section);
		pagingMap.put("pageNum", pageNum);		
		Map travelsMap = testtravelService.selectAllTravels(pagingMap);
		
		travelsMap.put("section", section);
		travelsMap.put("pageNum", pageNum);
		
		String viewName = (String) request.getAttribute("viewName");
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("travelsMap" , travelsMap);
		return mav;
	}
}
