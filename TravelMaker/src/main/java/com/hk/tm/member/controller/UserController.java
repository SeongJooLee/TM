package com.hk.tm.member.controller;



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

import com.hk.tm.board.vo.ImageVO;
import com.hk.tm.board.vo.PromotionVO;
import com.hk.tm.board.vo.ReservationVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.service.UserService;
import com.hk.tm.member.vo.AdminVO;
import com.hk.tm.member.vo.SellerVO;
import com.hk.tm.member.vo.UserVO;

import net.coobird.thumbnailator.Thumbnails;



@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	SellerVO sellerVO;
	@Autowired
	AdminVO adminVO;
	
	String REPO = "C:\\files";
	
	
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String memberLogin(Model model,HttpServletRequest request) {

		
		return "memberLogin";
		
		
	}
	@RequestMapping(value="/member/logout",method=RequestMethod.GET)
	public String memberLogout(HttpSession session,@RequestParam(value="key",required = false)String key) {
		if(key != null) {
			session.invalidate();
			return "logoutUpdate";
		}else {
			session.invalidate();
			System.out.println("세션삭제");
			return "logout";
		}
		
	}
	
	@RequestMapping(value="/member/registerCheck",method=RequestMethod.GET)
	public String memberRegisterCheck(Model model) {
		System.out.println("회원가입기능 실행");
		
		
		return "memberRegisterCheck";
		// 과연
	}
	@RequestMapping(value="/member/userAdd",method=RequestMethod.POST)
	public String memberUserAdd(@ModelAttribute UserVO userVO,Model model) {
		System.out.println("hello");
		System.out.println(userVO);
		
		int ret = userService.addUser(userVO);
		System.out.println(ret);
		
		model.addAttribute("result",ret);
		
		
		return "addResult";
		// 과연
	}
	@RequestMapping(value="/member/sellerAdd",method=RequestMethod.POST)
	public String memberSellerAdd(@ModelAttribute SellerVO seller,Model model) {
		int ret = userService.addSeller(seller);
		
		model.addAttribute("result", ret);
		return "addResult";
		// 과연
	}
	@RequestMapping(value="/member/register",method=RequestMethod.GET)
	public String memberRegister(@RequestParam("name")String name) {
		System.out.println("name="+name);
		switch(name){
        case "user": 
        	return "memberRegister";            
        case "seller":
        	return "sellerRegister";  
		}
		
		return null;
		// 과연
	}
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String memberLogin(@ModelAttribute UserVO userVO,Model model,HttpSession session) {

		 switch(userVO.getGrade()){
	        case "user":   
	        	UserVO user = userService.checkUser(userVO);  
	        	if(user !=null) {
	        		System.out.println("1번실행");
	        		session.setAttribute("userSession", user);
	        	}
	        	
	        	model.addAttribute("user", user);   
	        	
	        	return "userhome";            
	        case "seller":	      
	        	System.out.println("작업할공간");
	        	sellerVO.setSellerID(userVO.getId());
				sellerVO.setPw(userVO.getPw());
				sellerVO.setGrade(userVO.getGrade());
				SellerVO seller = userService.checkUser(sellerVO);
				if(seller !=null) {
	        		System.out.println("33번실행");
	        		session.setAttribute("userSession", seller);
	        	}			
				model.addAttribute("seller", seller);
	        	return "sellerhome";
	        case "admin" :
	        	adminVO.setAdminID(userVO.getId());
	        	adminVO.setPw(userVO.getPw());
	        	adminVO.setGrade(userVO.getGrade());
	        	
	        	AdminVO admin = userService.checkUser(adminVO);
	        	if(admin !=null) {
	        		
	        		session.setAttribute("userSession", admin);
	        		System.out.println("관리자 세션생성");
	        	}	
	        	model.addAttribute("admin", admin);
	        	return "adminhome";
	    }
		return null;
	}
	
	@RequestMapping(value="/member/mypage",method=RequestMethod.GET)
	public String memberMyPage(@ModelAttribute UserVO userVO,Model model,HttpSession session,@RequestParam(required = false,value="promotionNO") String proNO,@RequestParam(required = false,value="travelNO") String traNO,@RequestParam(required=false,value="reviewNO") String revNO,@RequestParam(required=false,value="userId") String userId,@RequestParam(required=false,value="proNO") String promotionNO_) {
		System.out.println("민수야.? = "+session.getAttribute("userSession").getClass().getName());
		String check = session.getAttribute("userSession").getClass().getName();
		System.out.println("관리자 세션체크 : "+check);
		
		
		if(proNO!=null) {
			int promotionNO = Integer.parseInt(proNO);
			List<ReservationVO> result = userService.checkReservation(promotionNO);
			//System.out.println("result = "+result);
			System.out.println("Controller의 result = "+result);
			model.addAttribute("proNO",proNO);
			model.addAttribute("reservation",result);
			return "sellerReservation";
		}else if(traNO != null) {
			System.out.println("이번에 작업할곳");
			int travelNO = Integer.parseInt(traNO);
			System.out.println(travelNO);
			TravelVO travel = userService.checkOneTravel(travelNO);
			model.addAttribute("travel",travel);
			return "userBoardListDone";
		}else if(revNO !=null) {
			int reviewNO = Integer.parseInt(revNO);
			ReviewVO reviewVO = userService.selectReview(reviewNO);
			model.addAttribute("reviewVO",reviewVO);
			return "userReviewDone";
		}else if(promotionNO_ !=null) {
			int promotionNO = Integer.parseInt(promotionNO_);
			model.addAttribute("promotionNO",promotionNO);
			return "userReviewAdd";
			
		}
		
		
		 switch(check){
	        case "com.hk.tm.member.vo.UserVO":   
	        	UserVO user = (UserVO) session.getAttribute("userSession");
	        	model.addAttribute("user", user);   
	        	
	        	return "userMyPage";            
	        case "com.hk.tm.member.vo.SellerVO":
//	        	if() {
//	        		return ;
//	        	}
	        	System.out.println("12-13작업공간");
	        	SellerVO seller = (SellerVO) session.getAttribute("userSession");
	        	System.out.println("seller switch = "+seller);
				model.addAttribute("seller", seller);
	        	return "sellerMyPage";
	        
	        case "com.hk.tm.member.vo.AdminVO" :
	        	return "adminMyPage";
	    }
		return null;
	}
	
	@RequestMapping(value="/member/mypage", method=RequestMethod.POST)
	public String mypage(HttpSession session,@RequestParam(value="testKey",required=false) String key,Model model){	
//		UserVO user = null;
//		if(session.getAttribute("userSession")!=null) {
//			user = (UserVO) session.getAttribute("userSession");
//		}else if(session.getAttribute("")) {
//			session.
//		}
		System.out.println("햇던일또하게생겻네");
		UserVO user = null;
		SellerVO seller = null;
		try {
			user = (UserVO) session.getAttribute("userSession");
			System.out.println("오류발생");
		} catch (Exception e) {
			seller = (SellerVO)session.getAttribute("userSession");
			System.out.println("변형성공");
		}
		System.out.println("처리완료");
		
		
		switch(key) {
		case "one" :
			
			System.out.println("세션값 받아오기 11 test "+user.getId());
			return "userMyPage";
		case "two":
			//user = (UserVO) session.getAttribute("userSession");
			System.out.println("세션값 받아오기 22 "+user.getId());
			List <TravelVO> travel = userService.travelListAll(user.getId());
			List <ReviewVO> review = userService.reviewListAll(user.getId());
			model.addAttribute("travel",travel);
			model.addAttribute("review",review);
			System.out.println("review = "+review);
			System.out.println("설마?");
			return "userBoardList";
		case "three":
			//user = (UserVO) session.getAttribute("userSession");
			System.out.println("세션값 받아오기 33 "+user.getId());
			List<ReservationVO> userReservationList = userService.userReservationList(user.getId());
			model.addAttribute("list",userReservationList);
			return "userReservationList";
		case "four":
			//user = (UserVO) session.getAttribute("userSession");
			System.out.println("세션값 받아오기 44 "+user.getId());
			return null;
		
		case "sellerOne":
			System.out.println("sellerOne실행");
			return "sellerMyPage";
		case "sellerTwo":
			List<PromotionVO> list = userService.sellerPromotionList(seller.getSellerID());
			model.addAttribute("proList",list);
			return "sellerBoardList";
		case "sellerThree":
			System.out.println(seller);
			//System.out.println("프로모션 넘버 = "+proNum);
			System.out.println("sellerThree실행");
		
			//
			return null;
		case "sellerFour":
			System.out.println("sellerFour실행");
			return null;
		
		}
		return null;
	}
	@RequestMapping(value="/member/mypage/update", method=RequestMethod.GET)
	public String mypageUpdate(){	
		return "userMyPageUpdate";
	}
	
	@RequestMapping(value="/member/mypage/update", method=RequestMethod.POST)
	public String mypageUpdatePost(@ModelAttribute UserVO user,Model model){	
		System.out.println(user);
		int result = userService.update(user);
		model.addAttribute("result",result);
		return "userMyPageUpdateDone";
	}
	
	@RequestMapping(value="/member/mypage/delete", method=RequestMethod.GET)
	public String mypageDelete(@RequestParam(value="userId",required=false) String userId,Model model){	
		if(userId != null) {
			int totalResult = userService.deleteTotal(userId);	
			int result = userService.delete(userId);
			model.addAttribute("result",result);
		}
		return "userMyPageDeleteDone";
	}
	@RequestMapping(value="/member/mypage/sellerUpdate", method=RequestMethod.GET)
	public String sellermypageUpdate(){	
		return "sellerMyPageUpdate";
	}
	@RequestMapping(value="/member/mypage/sellerUpdate", method=RequestMethod.POST)
	public String sellermypageUpdatePost(@ModelAttribute SellerVO seller,Model model){	
		System.out.println(seller);
		int result = userService.updateSeller(seller);
		model.addAttribute("result",result);
		System.out.println("실행?? ="+result);
		return "sellerMyPageUpdateDone";
	}
	@RequestMapping(value="/member/sellerMypage/delete", method=RequestMethod.GET)
	public String sellerMypageDelete(@RequestParam(value="sellerId",required=false) String sellerId,Model model){	
		if(sellerId != null) {	
//			System.out.println(sellerId+" 셀러아이디");
//			int imageResult = userService.imageDelete(sellerId);
//			System.out.println("이미지테이블 개수 = "+imageResult);
			List<PromotionVO> promotion = userService.promotionOne(sellerId);
			System.out.println("시작 "+promotion);
			int childDeleteResult = userService.childDeleteAll(promotion);
			int promotionResult = userService.promotionDelete(sellerId);
			int result = userService.sellerDelete(sellerId);
			model.addAttribute("result",result);
		}
		return "sellerMyPageDeleteDone";
	}
	
	@RequestMapping(value="/member/mypage/review", method=RequestMethod.POST)
	public String userAddReview(@ModelAttribute ReviewVO reviewVO , Model model,HttpSession session,MultipartHttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{	
		
//		UserVO user = (UserVO)session.getAttribute("userSession");
//		reviewVO.setId(user.getId());
//		
//		int result = 0;
//		
//		result = userService.addReview(reviewVO);
//		model.addAttribute("result",result);
		System.out.println("reviewVO 파라미터확인"+reviewVO);
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

		int reviewNO = userService.selectMaxNotice();
		reviewNO++;
		reviewVO.setReviewNO(reviewNO);

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
		System.out.println("reviewVO =="+reviewVO);
		userService.noticeAdd(reviewVO,imageVO);

		for(int i=0;i < fileList.size(); i++) {
			if(fileList.get(i)!=null) {
				File srcFile = new File(REPO+"\\"+"temp"+"\\"+fileList.get(i));
				File destDir = new File(REPO+"\\"+reviewVO.getName()+"\\"+reviewVO.getReviewNO());
				destDir.mkdir();
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
		}
		response.sendRedirect("/tm/board/review");
		return "userReviewAddDone";
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
	
	
	
	@RequestMapping(value="/member/duplicationCheck", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object>  duplicationCheck(@RequestParam("checkID")String checkID){	
		System.out.println("전달받은 ID = "+checkID);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(checkID == "") {
			map.put("result", null);
			System.out.println("이쪽실행?");
			return map;
		}
		
		map.put("result",userService.duplicationCheckSeller(checkID));

		return map;
	}
	
	@RequestMapping(value="/member/duplicationCheckUser", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, Object>  duplicationCheckUser(@RequestParam("checkID")String checkID){	
		System.out.println("전달받은 ID = "+checkID);
		Map<String, Object> map = new HashMap<String, Object>();

		
		  if(checkID == "") {
			  map.put("result", null); System.out.println("null??");
			  return map; 
		  }
		 
		
		map.put("result",userService.duplicationCheckUser(checkID));
		
		return map;
	}
	
	
}
