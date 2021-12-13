package com.hk.tm.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.service.TravelService;
import com.hk.tm.board.vo.TravelVO;

@Controller
@RequestMapping(value="/board/")
public class TravelController {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);

	@Autowired
	TravelService travelService;
	
	@Autowired
	TravelDAO travelDAO;
	
	@RequestMapping(value="travel" , method = RequestMethod.GET) 
		public String travelList(Model model) {
		
		List<TravelVO> list = travelService.allList();
		
		model.addAttribute("travel", list);
		logger.debug("---------/list called");
		return "travelList"; //travelList.jsp 호출
	}
	
	@RequestMapping(value="travel/View" , method=RequestMethod.GET)
	public String travelView(Model model , @RequestParam("travelNO") int travelNO) {
		
		Map<String,Object> map = travelService.oneList(travelNO);
		
		model.addAttribute("travel", map.get("travelVO"));
		model.addAttribute("user", map.get("userVO"));
		return "travelView"; // travelView.jsp 호출
		
	}
	
	@RequestMapping(value="travel/add" ,  method=RequestMethod.GET)
	public String travelAdd() {			
		return "travelAdd"; // travelAdd.jsp 호출
		
	}
	
	@RequestMapping(value="travel/addDone" ,  method=RequestMethod.POST)
	public String travelAddDone(MultipartHttpServletRequest multipartRequest, HttpServletResponse response, Model model, @ModelAttribute TravelVO travelVO) {
		
		logger.debug("title", travelVO.getTitle());
		logger.debug("content", travelVO.getContent());
		
		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			//System.out.println(name+", "+value);
			map.put(name,value);
		}
		
		List fileList= fileProcess(multipartRequest);
		map.put("fileList", fileList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("result");
		return mav;
	}
	/*
	 * int ret = travelService.addTravel(travelVO); model.addAttribute("ret", ret);
	 * return "travelAddDone"; // travelAddDone.jsp 호출 }
	 */
	
	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
					if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); //이후 파일 생성
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
			}
		}
		return fileList;
	}
	
	@RequestMapping(value="travel/update" ,  method=RequestMethod.POST)
	public String travelUpdate(Model model, @ModelAttribute TravelVO travelVO) {
		
		int ret = travelService.modTravel(travelVO);
		model.addAttribute("ret", ret);
		return "travelUpdateDone"; // travelUpdateDone.jsp 호출
	}
	
	@RequestMapping(value="travel/delete" ,  method=RequestMethod.GET)
	public String travelDelete(Model model , @RequestParam("travelNO") int travelNO) {
			
		int ret = travelService.removeTravel(travelNO);
		model.addAttribute("ret", ret);
		return "travelDeleteDone"; // travelDeleteDone.jsp 호출		
	}
	
}
