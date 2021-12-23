package com.hk.tm.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.service.CommentService;
import com.hk.tm.board.vo.CommentVO;
import com.hk.tm.board.vo.ReviewVO;
import com.hk.tm.board.vo.TravelVO;
import com.hk.tm.member.vo.UserVO;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
//	@RequestMapping(value="/board/comment/allList" , method = {RequestMethod.GET, RequestMethod.POST}) 
//	public String commentList(Model model) {
//	
//	List<CommentVO> list = commentService.selectAllComments();
//	
//	return "commentList"; 
//}
	
	@RequestMapping(value="/board/travel/comment" , method = RequestMethod.GET) 
	public String commentTravelList(Model model,@RequestParam("travelNO")int travelNO) {
		List<CommentVO> list = commentService.selectTravelComment(travelNO);
		model.addAttribute("comment",list);
		
		return "commentTest"; 
	}
	
	
	@RequestMapping(value="/board/travel/add" ,  method=RequestMethod.POST)
	public String commentTravelAdd(Model model, @RequestParam("commentTravelNO") int commentTravelNO,@RequestParam("id") String id,@RequestParam("content")String content) {			
		CommentVO commentVO = new CommentVO();
		System.out.println("어..느..새 ..힙..합..은 안..멋져");
		commentVO.setContent(content);
		commentVO.setId(id);
		
		commentVO.setTravelNO(commentTravelNO);
		int ret = commentService.addTravelComment(commentVO);
		System.out.println("성공? : "+ret);
		model.addAttribute("travel",commentTravelNO);
		return "travelViewCheck";
	}
	
	@RequestMapping(value="/board/review/comment" , method = RequestMethod.GET) 
	public String commentSelectList(Model model,@RequestParam("reviewNO")int reviewNO) {
		List<CommentVO> list = commentService.selectReviewComment(reviewNO);
		model.addAttribute("comment",list);
		
		
		return "commentTest"; 
	}
	
	@RequestMapping(value="/board/review/add" ,  method=RequestMethod.POST)
	public String commentAdd(Model model, @RequestParam("commentReviewNO") int commentReviewNO,@RequestParam("id") String id,@RequestParam("content")String content) {			
		CommentVO commentVO = new CommentVO();
		
		commentVO.setContent(content);
		commentVO.setId(id);
		commentVO.setReviewNO(commentReviewNO);
		int ret = commentService.addReviewComment(commentVO);
		System.out.println("성공? : "+ret);
		System.out.println("잡았다 요너석!!");
		model.addAttribute("review",commentReviewNO);
		return "reviewViewCheck";
	}
	
	
	
	
	
	@RequestMapping(value="/addDone" ,  method=RequestMethod.POST)
	public void commentAddDone(@ModelAttribute CommentVO commentVO,@ModelAttribute TravelVO travelVO, @ModelAttribute ReviewVO reviewVO , MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws Exception, ServletException {
		
		commentService.addComment(commentVO);// 여기문제
		
		response.sendRedirect("/tm/board/comment");  	
	}		
	
	@RequestMapping(value="/view" , method=RequestMethod.GET)
	public String commentView(Model model , @RequestParam("travelNO") int travelNO,HttpSession session) {
		
		Map<String,Object> map = commentService.selectOneComment(travelNO);
		
		model.addAttribute("comment", map.get("comment"));		
		System.out.println("여기는 view +"+ map.get("comment").toString());
		
		try {
			UserVO userVO = (UserVO)session.getAttribute("userSession");
			System.out.println(userVO);
			List<CommentVO> list = commentService.selectUserComment(userVO.getId());
			System.out.println(userVO.getId()+"님의 댓글 리스트  "+list);
			model.addAttribute("list",list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("오류발생");
		}
		return "commentView"; 
		
	}

	@RequestMapping(value="/update" ,  method=RequestMethod.POST)
	public String commentUpdate(@ModelAttribute CommentVO commentVO, Model model, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception, ServletException {		
		
		commentService.updateComment(commentVO);		

		return "commentView"; 
		
	}
	
	@RequestMapping(value="/delete" ,  method=RequestMethod.GET) 
		public void travelDelete(@RequestParam("travelNO") int travelNO, HttpServletResponse response) throws Exception {		

		CommentVO commentVO = commentService.travelDelete(travelNO);	

	}
}






