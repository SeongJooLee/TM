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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.tm.board.service.CommentService;
import com.hk.tm.board.vo.CommentVO;
import com.hk.tm.member.vo.UserVO;

@Controller
@RequestMapping(value="/board/comment")
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String commentlList(Model model) {
	
	List<CommentVO> list = commentService.selectAllComments();
	
	return "tavelView"; 
}
	
	@RequestMapping(value="/select" , method = RequestMethod.GET) 
	public String commentSelectList(Model model) {
		List<CommentVO> list = commentService.selectAllComments();

		return "tavelView"; 
	}
	
	@RequestMapping(value="/view" , method=RequestMethod.GET)
	public String commentView(Model model , @RequestParam("commentNO") String id,HttpSession session) {
		
		Map<String,Object> map = commentService.selectOneComment(id);
		
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
		return "tavelView"; 
		
	}
	
	@RequestMapping(value="/add" ,  method=RequestMethod.GET)
	public String commentAdd(Model model) {			
		return "tavelView"; 
		
	}
	
	@RequestMapping(value="/addDone" ,  method=RequestMethod.POST)
	public void commentAddDone(@ModelAttribute CommentVO commentVO, MultipartHttpServletRequest request, HttpServletResponse response,Model model) throws Exception, ServletException {
		
		response.sendRedirect("/tm/board/tavelView");  	
	}		

	@RequestMapping(value="/update" ,  method=RequestMethod.POST)
	public String commentUpdate(@ModelAttribute CommentVO commentVO, Model model, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception, ServletException {		
		
		commentService.updateComment(commentVO);		

		return "tavelView"; 
		
	}
	
	@RequestMapping(value="/delete" ,  method=RequestMethod.GET) 
		public void commentDelete(@RequestParam("id") String id, HttpServletResponse response) throws Exception {		

		CommentVO commentVO = commentService.deleteComment(id);	

	response.sendRedirect("/tm/board/tavelView"); 
	}
}






