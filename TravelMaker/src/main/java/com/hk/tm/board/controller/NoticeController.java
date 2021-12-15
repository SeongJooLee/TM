package com.hk.tm.board.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.spi.FileSystemProvider;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.service.NoticeService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	String REPO = "C:\\files";


	@RequestMapping(value="/board/notice", method= {RequestMethod.GET,RequestMethod.POST})
	public String noticeList(Model model) {

		List<NoticeVO> list = noticeService.selectAllNotice();

		model.addAttribute("notice",list);

		return "noticeList";
	}

	@RequestMapping(value="/board/notice/view", method=RequestMethod.GET)
	public String noticeView(Model model,@RequestParam("noticeNO") int noticeNO) {
		Map<String,Object> map = noticeService.selectOneNotice(noticeNO);
		model.addAttribute("notice",map.get("notice"));
		model.addAttribute("image",map.get("image"));
		
		return "noticeView";
	}

	@RequestMapping(value="/board/notice/add", method=RequestMethod.GET)
	public String noticeAdd(Model model) {
		return "noticeAdd";
	}

	@RequestMapping(value="/board/notice/addDone", method=RequestMethod.POST)
	public void noticeAddDone(MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws IOException, ServletException {
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

		NoticeVO noticeVO = new NoticeVO();
		ImageVO imageVO = new ImageVO();
		
		int noticeNO = noticeService.selectMaxNotice();
		noticeNO++;
		
		noticeVO.setNoticeNO(noticeNO);
		noticeVO.setTitle((String) map.get("title"));
		noticeVO.setContent((String) map.get("content"));
		noticeVO.setAdminID((String) map.get("adminID"));
		noticeVO.setName((String) map.get("name"));
		String noImage = "noImage";
		if(fileList.size()>9) {
			imageVO.setImage10((String) fileList.get(9));
			if(fileList.get(9) == "") {
				imageVO.setImage10(noImage);
				fileList.remove(9);
			}
		} if(fileList.size()>8) {
			imageVO.setImage9((String) fileList.get(8));
			if(fileList.get(8) == "") {
				imageVO.setImage9(noImage);
				fileList.remove(8);
			}
		} if(fileList.size()>7) {
			imageVO.setImage8((String) fileList.get(7));
			if(fileList.get(7) == "") {
				imageVO.setImage8(noImage);
				fileList.remove(7);
			}
		} if(fileList.size()>6) {
			imageVO.setImage7((String) fileList.get(6));
			if(fileList.get(6) == "") {
				imageVO.setImage7(noImage);
				fileList.remove(6);
			}
		} if(fileList.size()>5) {
			imageVO.setImage6((String) fileList.get(5));
			if(fileList.get(5) == "") {
				imageVO.setImage6(noImage);
				fileList.remove(5);
			}
		} if(fileList.size()>4) {
			imageVO.setImage5((String) fileList.get(4));
			if(fileList.get(4) == "") {
				imageVO.setImage5(null);
				fileList.remove(4);
			}
		} if(fileList.size()>3) {
			imageVO.setImage4((String) fileList.get(3));
			if(fileList.get(3) == "") {
				imageVO.setImage4(null);
				fileList.remove(3);
			}
		} if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			if(fileList.get(2) == "") {
				imageVO.setImage3(null);
				fileList.remove(2);
			}
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			if(fileList.get(1) == "") {
				imageVO.setImage2(null);
				fileList.remove(1);
			}
		} if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
			if(fileList.get(0) == "") {
				imageVO.setImage1(null);
				fileList.remove(0);
			}
		}
		System.out.println("에드에서 무브되엇는가?" +imageVO.toString());
		System.out.println("에드에서 무브되엇는가?" +fileList.toString());
		noticeService.boardAdd(noticeVO,imageVO);
		if(imageVO.getImage1()!=null ) {
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					File destDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
					destDir.mkdir();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		}
		response.sendRedirect("/tm/board/notice");
	}

	private List<String> upload(MultipartHttpServletRequest request) throws ServletException, IOException{
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

	
	@RequestMapping(value="/board/notice/update", method=RequestMethod.POST)
	public String noticeUpdate(@RequestParam("noticeNO") int noticeNO,Model model,MultipartHttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		
		NoticeVO noticeVO = new NoticeVO();
		ImageVO imageVO = new ImageVO();
		
		noticeVO.setNoticeNO(noticeNO);
		noticeVO.setTitle((String) map.get("title"));
		noticeVO.setContent((String) map.get("content"));
		noticeVO.setAdminID((String) map.get("adminID"));
		noticeVO.setName((String) map.get("name"));
		
		if(fileList.size()>0) {
			imageVO.setImage1((String) fileList.get(0));
			if(fileList.get(0) == "") {
				imageVO.setImage1(null);
			}
		} if(fileList.size()>1) {
			imageVO.setImage2((String) fileList.get(1));
			if(fileList.get(1) == "") {
				imageVO.setImage2(null);
			}
		} if(fileList.size()>2) {
			imageVO.setImage3((String) fileList.get(2));
			if(fileList.get(1) == "") {
				imageVO.setImage3(null);
			}
		} if(fileList.size()>3) {
			imageVO.setImage4((String) fileList.get(3));
			if(fileList.get(1) == "") {
				imageVO.setImage4(null);
			}
		} if(fileList.size()>4) {
			imageVO.setImage5((String) fileList.get(4));
			if(fileList.get(1) == "") {
				imageVO.setImage5(null);
			}
		} if(fileList.size()>5) {
			imageVO.setImage6((String) fileList.get(5));
			if(fileList.get(1) == "") {
				imageVO.setImage6(null);
			}
		} if(fileList.size()>6) {
			imageVO.setImage7((String) fileList.get(6));
			if(fileList.get(1) == "") {
				imageVO.setImage7(null);
			}
		} if(fileList.size()>7) {
			imageVO.setImage8((String) fileList.get(7));
			if(fileList.get(1) == "") {
				imageVO.setImage8(null);
			}
		} if(fileList.size()>8) {
			imageVO.setImage9((String) fileList.get(8));
			if(fileList.get(1) == "") {
				imageVO.setImage9(null);
			}
		} if(fileList.size()>9) {
			imageVO.setImage10((String) fileList.get(9));
			if(fileList.get(1) == "") {
				imageVO.setImage10(null);
			}
		}
		
		if(noticeNO!=0) {
			File imgDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
			}
		}

		if(imageVO.getImage1()!=null ) {
			for(int i=0;i < fileList.size(); i++) {
				if(fileList.get(i)!=null) {
					File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
					File destDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
					destDir.mkdir();
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		}
		
		noticeService.boardUpdate(noticeVO,imageVO);
		
		model.addAttribute("notice", noticeVO);
		model.addAttribute("image", imageVO);
		
		return "noticeView";
		
	}
	@RequestMapping(value="/board/notice/delete", method=RequestMethod.GET)
	public void noticeDelete(@RequestParam("noticeNO") int noticeNO, HttpServletResponse response) throws IOException {
		
		NoticeVO noticeVO = noticeService.noticeDelete(noticeNO);
		File imgDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
		}
		response.sendRedirect("/tm/board/notice");
	}
	
	@RequestMapping(value="/board/notice/imgDelete", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> imgDelete(@RequestParam("noticeNO") int noticeNO) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		int ret = noticeService.imgDelete(noticeNO);
		if(ret==0) {
			map.put("result", "false");
		} else {
			map.put("result", "true");
			File imgDir = new File(REPO+"\\notice\\"+noticeNO);
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
			}
		}
		return map;
		
	}
}
