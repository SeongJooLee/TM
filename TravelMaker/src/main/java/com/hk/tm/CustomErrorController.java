package com.hk.tm;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@Controller
public class CustomErrorController{
	
	
	/*
	 * @ExceptionHandler(NoHandlerFoundException.class)
	 * 
	 * @ResponseStatus(HttpStatus.NOT_FOUND) public String
	 * kakaoPaySuccess(NoHandlerFoundException ex) { System.out.println("오류컨트롤러실행");
	 * 
	 * return "error404"; }
	 */
}
