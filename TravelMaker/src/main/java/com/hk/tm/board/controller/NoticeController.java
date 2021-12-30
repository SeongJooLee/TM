package com.hk.tm.board.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.service.NoticeService;
import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.NoticeImageVO;
import com.hk.tm.board.vo.NoticeVO;
import com.hk.tm.board.vo.SelectPageVO;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	String REPO = "C:\\files";

	@RequestMapping(value="/board/notice", method= {RequestMethod.GET,RequestMethod.POST})
	public String noticeList(Model model) {
		List<NoticeVO> list = noticeService.selectAllNotice();
		int listCount = list.size(); //전체 게시물의 개수
		int listSize = 6; //한 페이지에 보일 갯수
		int page = (listCount+5)/listSize; //현재 목록의 페이지 번호
		
		int endList = 1*listSize;
		int startList = endList-5;
		
		SelectPageVO selectPageVO = new SelectPageVO();
		
		selectPageVO.setStartPage(startList);
		selectPageVO.setEndPage(endList);
		
		List<NoticeImageVO> selectList = noticeService.selectAllNoticeImage(selectPageVO);
		
		
		model.addAttribute("notice",selectList);
		model.addAttribute("page",page);
		
		return "noticeList";
	}
	
	@RequestMapping(value="/board/notice/select", method= RequestMethod.GET)
	public String noticeSelectList(Model model,@RequestParam(value="selectPage",required=false) int selectPage) {
		List<NoticeVO> list = noticeService.selectAllNotice();
		int listCount = list.size(); //전체 게시물의 개수
		int listSize = 6; //한 페이지에 보일 갯수
		int page = (listCount+5)/listSize; //현재 목록의 페이지 번호

		int endList = 0;
		int startList = 0;

		endList = selectPage*listSize;
		startList = endList-5;
		
		SelectPageVO selectPageVO = new SelectPageVO();
		
		selectPageVO.setStartPage(startList);
		selectPageVO.setEndPage(endList);
		
		List<NoticeImageVO> selectList = noticeService.selectAllNoticeImage(selectPageVO);
		
		model.addAttribute("notice",selectList);
		model.addAttribute("page",page);
		model.addAttribute("selectPage",selectPage);

		return "noticeList";
	}
	
	
	@RequestMapping(value="/board/notice/category", method= {RequestMethod.GET})
	public String noticeCategory(Model model,@RequestParam("key") String key) {
		List<NoticeImageVO> list = noticeService.selectCategoryNotice(key);
		model.addAttribute("notice",list);
		return "noticeList";
	}

	@RequestMapping(value="/board/notice/view", method=RequestMethod.GET)
	public String noticeView(Model model,@RequestParam("noticeNO") int noticeNO,@RequestParam(value="page",required=false) String page,HttpSession session) {
		if(page!=null) {
			noticeNO++;
		}
		
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
	public void noticeAddDone(@ModelAttribute NoticeVO noticeVO,MultipartHttpServletRequest request, HttpServletResponse response,Model model,HttpSession session) throws IOException, ServletException {
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
		ImageVO imageVO = new ImageVO();

		int noticeNO = noticeService.selectMaxNotice();
		noticeNO++;
		noticeVO.setNoticeNO(noticeNO);

		if(fileList.size()>2) {
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
		noticeService.noticeAdd(noticeVO,imageVO);

		for(int i=0;i < fileList.size(); i++) {
			if(fileList.get(i)!=null) {
				File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
				File destDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
				destDir.mkdir();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
		}
		response.sendRedirect("/board/notice");
	}

	@RequestMapping(value="/board/notice/update", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO noticeVO,Model model,MultipartHttpServletRequest multi,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();
		
		Enumeration enu=multi.getParameterNames();

		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multi.getParameter(name);
			map.put(name,value);
		}

		List fileList= upload(multi);
		map.put("fileList", fileList);
		ImageVO imageVO = new ImageVO();
		imageVO.setNoticeNO(noticeVO.getNoticeNO());
		imageVO.setImage1(request.getParameter("image1"));
		imageVO.setImage2(request.getParameter("image2"));
		imageVO.setImage3(request.getParameter("image3"));

		if(fileList.size()>2) {
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

		//		if(noticeVO.getNoticeNO()!=0) {
		//			File imgDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
		//			if(imgDir.exists()) {
		//				FileUtils.deleteDirectory(imgDir);
		//			}
		//		}

		noticeService.noticeUpdate(noticeVO,imageVO);

		for(int i=0;i < fileList.size(); i++) {
			if(fileList.get(i)!=null) {
				File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
				File destDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
				destDir.mkdir();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
		}
		map = noticeService.selectOneNotice(noticeVO.getNoticeNO());
		model.addAttribute("notice",map.get("notice"));
		model.addAttribute("image",map.get("image"));

		return "noticeView";

	}
	@RequestMapping(value="/board/notice/delete", method=RequestMethod.GET)
	public void noticeDelete(@RequestParam("noticeNO") int noticeNO, HttpServletResponse response) throws IOException {

		NoticeVO noticeVO = noticeService.noticeDelete(noticeNO);
		File imgDir = new File(REPO+"\\"+noticeVO.getName()+"\\"+noticeVO.getNoticeNO());
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
		}
		response.sendRedirect("/board/notice");
	}

	@RequestMapping(value="/board/notice/noticeImgDelete", method= {RequestMethod.GET,RequestMethod.POST},produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object> imgDelete(@RequestParam("noticeNO") int noticeNO,@RequestParam("name") String name) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		int ret = noticeService.noticeImgDelete(noticeNO);
		if(ret==0) {
			map.put("result", "false");
		} else {
			map.put("result", "true");
			File imgDir = new File(REPO+"\\"+name+"\\"+noticeNO);
			File thumbnail = new File(REPO+"\\thumbnail\\"+name+"\\"+noticeNO);
			if(imgDir.exists()) {
				FileUtils.deleteDirectory(imgDir);
				FileUtils.deleteDirectory(thumbnail);
			}
		}
		return map;
	}

	@RequestMapping(value="/board/notice/download", method=RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getParameter("image") != null) {

			request.setCharacterEncoding("utf-8");
			String image = request.getParameter("image");
			String noticeNO = request.getParameter("noticeNO");
			String name = request.getParameter("name");

			OutputStream out = response.getOutputStream();
			String path = "C:\\files\\"+name+"\\"+noticeNO+"\\"+image;
			File imageFile = new File(path);

			int lastIndex = image.lastIndexOf(".");
			String fileName = image.substring(0,lastIndex);
			File destDir = new File(REPO+"\\thumbnail");
			File thumbnail = new File(REPO+"\\thumbnail\\"+name+"\\"+noticeNO+"\\"+fileName+".png");
			destDir.mkdir();

			if(imageFile.exists()) {
				thumbnail.getParentFile().mkdirs();
				Thumbnails.of(imageFile).size(500, 500).outputFormat("png").toFile(thumbnail);
			}

			FileInputStream in = new FileInputStream(thumbnail);
			byte[] buffer = new byte[1024*8];
			while(true) {
				int count = in.read(buffer);
				if(count == -1) {
					break;
				}
				out.write(buffer, 0, count);
			}
			in.close();
			out.close();
		}
	}
	
	private List<String> upload(MultipartHttpServletRequest request) throws ServletException, IOException{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = request.getFileNames();
		while(fileNames.hasNext()){
			
			//파일의 원본 이름 저장
			String fileName = fileNames.next();
			
			UUID uuid = UUID.randomUUID();
			String uuidStr = uuid.toString();
			
			MultipartFile mFile = request.getFile(fileName);
			String originalFileName = uuidStr+"_"+mFile.getOriginalFilename();
			
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

	
	
	
}