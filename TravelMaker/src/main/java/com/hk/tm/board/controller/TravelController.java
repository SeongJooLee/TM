package com.hk.tm.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.dao.TravelDAO;
import com.hk.tm.board.service.TravelService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.TravelVO;

@Controller
@RequestMapping(value="/board/")
public class TravelController {
	private static final Logger logger = LoggerFactory.getLogger(TravelController.class);


	@Autowired
	TravelService travelService;
	
	TravelDAO travelDAO;
	
	String REPO = "C:\\files";
	
	@RequestMapping(value="travel" , method = {RequestMethod.GET, RequestMethod.POST}) 
		public String travelList(Model model) {
		
		List<TravelVO> list = travelService.selectAllTravels();
		
		model.addAttribute("travel", list);
		logger.debug("---------/list called");
		return "travelList"; //travelList.jsp 호출
	}
	
	@RequestMapping(value="travel/View" , method=RequestMethod.GET)
	public String travelView(Model model , @RequestParam("travelNO") int travelNO) {
		
		Map<String,Object> map = travelService.selectOneTravel(travelNO);
		
		model.addAttribute("travel", map.get("travel"));		
		model.addAttribute("image",map.get("image"));
		
		System.out.println("여기는 view +"+ map.get("travel").toString());
		return "travelView"; // travelView.jsp 호출
		
	}
	
	@RequestMapping(value="travel/add" ,  method=RequestMethod.GET)
	public String travelAdd(Model model) {			
		return "travelAdd"; // travelAdd.jsp 호출
		
	}
	
	@RequestMapping(value="travel/addDone" ,  method=RequestMethod.POST)
	public void travelAddDone(MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
		
		//logger.debug("title", travelVO.getTitle());
		//logger.debug("content", travelVO.getContent());
		
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			//System.out.println(name+", "+value);
			map.put(name,value);
		}
		//upload 빨간줄 처리
		List fileList= upload(request);
		map.put("fileList", fileList);
		
		TravelVO travelVO = new TravelVO();
		ImageVO imageVO = new ImageVO();
		
		int travelNO = travelService.selectMaxTravel();
		travelNO++;
		
		travelVO.setTravelNO(travelNO);
		travelVO.setTitle((String) map.get("title"));
		travelVO.setContent((String) map.get("content"));
		travelVO.setId((String) map.get("id"));
		travelVO.setName((String) map.get("name"));
		
		
		if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
			if(fileList.get(0) == "") {
				imageVO.setImage1(null);
			}
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			
		} if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			
		} if(fileList.size()>3) {
			imageVO.setImage4((String) fileList.get(3));
			
		} if(fileList.size()>4) {
			imageVO.setImage5((String) fileList.get(4));
			
		} if(fileList.size()>5) {
			imageVO.setImage6((String) fileList.get(5));
			
		} if(fileList.size()>6) {
			imageVO.setImage7((String) fileList.get(6));
			
		} if(fileList.size()>7) {
			imageVO.setImage8((String) fileList.get(7));
			
		} if(fileList.size()>8) {
			imageVO.setImage9((String) fileList.get(8));
			
		} if(fileList.size()>9) {
			imageVO.setImage10((String) fileList.get(9));
		}
		System.out.println("이미지 브이오 어케 댐 "+imageVO.toString());
		travelService.addTravel(travelVO,imageVO);
		if(imageVO.getImage1()!=null ) {
			
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					File destDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
					destDir.mkdir();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		}
		
		response.sendRedirect("/board/travel");
	}
	
	private List<String> upload(MultipartHttpServletRequest request) throws Exception{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = request.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = request.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
					if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); //이후 파일 생성
					}
				}
				File destDir = new File(REPO +"\\temp\\");
				destDir.mkdir();
				mFile.transferTo(new File(REPO +"\\temp\\"+ originalFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
			}
		}
		return fileList;
	}
	
	@RequestMapping(value="travel/update" ,  method=RequestMethod.POST)
	public String travelUpdate(@RequestParam("travelNO") int travelNO, Model model, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("일단 여기");
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();
		Enumeration enu=request.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			map.put(name,value);
		}
		
		List fileList= upload(request);
		map.put("fileList", fileList);
		
		
		TravelVO travelVO = new TravelVO();
		ImageVO imageVO = new ImageVO();
		
		travelVO.setTravelNO(travelNO);
		travelVO.setTitle((String) map.get("title"));
		travelVO.setContent((String) map.get("content"));
		travelVO.setId((String) map.get("id"));
		travelVO.setName((String) map.get("name"));
		
		if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			
		} if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			
		} if(fileList.size()>3) {
			imageVO.setImage4((String) fileList.get(3));
			
		} if(fileList.size()>4) {
			imageVO.setImage5((String) fileList.get(4));
			
		} if(fileList.size()>5) {
			imageVO.setImage6((String) fileList.get(5));
			
		} if(fileList.size()>6) {
			imageVO.setImage7((String) fileList.get(6));
			
		} if(fileList.size()>7) {
			imageVO.setImage8((String) fileList.get(7));
			
		} if(fileList.size()>8) {
			imageVO.setImage9((String) fileList.get(8));
			
		} if(fileList.size()>9) {
			imageVO.setImage10((String) fileList.get(9));
		}
		
		if(imageVO.getImage1() != null && imageVO.getImage1().length()!=0) {
			System.out.println("살려줘");
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					String originalFileName = (String) fileList.get(i);
					System.out.println("오리지날 파일 이름 :"+originalFileName);
					System.out.println("오리지날 파일 이름 :"+imageVO.getImage1());
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					System.out.println("srcFile 파일 이름 :"+srcFile);
					File destDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					
					File oldFile = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO()+"\\"+originalFileName);
					oldFile.delete();
				}
			}
		}
		
		System.out.println("여기도 확인 "+travelVO.toString());
		System.out.println("여기도 확인 "+imageVO.toString());
		travelService.updateTravel(travelVO,imageVO);
		System.out.println("여기도 확인 "+travelVO.toString());
		System.out.println("여기도 확인 "+imageVO.toString());
		
		
		model.addAttribute("notice", travelVO);
		model.addAttribute("image", imageVO);
		
		
		return "noticeView";
		
	}
	
	@RequestMapping(value="travel/delete" ,  method=RequestMethod.GET)
	public void addTravel(@RequestParam("travelNO") int travelNO, HttpServletResponse response) throws IOException {

		TravelVO travelVO = travelService.deleteTravel(travelNO);
		System.out.println("삭제 후 travelVO 기록"+travelVO.toString());
		File imgDir = new File(REPO+"\\"+travelVO.getName()+"\\"+travelVO.getTravelNO());
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
		}
		response.sendRedirect("/board/travel"); 
	}
	
}
