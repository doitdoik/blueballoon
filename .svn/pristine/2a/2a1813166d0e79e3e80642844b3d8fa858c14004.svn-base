package com.icia.blueballoon.advice;

import org.springframework.http.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;


import com.icia.blueballoon.exception.*;

// 예외에 대해 응답하는 컨트롤러
@ControllerAdvice
public class BlueballoonAdvice {
	
	// AlreadyJoinException을 처리하는 핸들러
	@ExceptionHandler(AlreadyJoinException.class)
	public ResponseEntity<String> AlreadyJoinExceptionHandler(){
		//한글처리
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/plain;charset=utf-8");
		
		// 메세지 + 상태코드
		return new ResponseEntity<String>("승인 대기중인 값입니다.", headers, HttpStatus.CONFLICT);
	}
	
	// 잘못된 접근에 대한 IllegalAuthorizationException 처리
	@ExceptionHandler(IllegalAuthorizationException.class)
	public String IllegalAuthorizationExceptionHandler(Model model) {
		model.addAttribute("view", "exceptions/msg.jsp");
		model.addAttribute("msg", "잘못된 접근 경로입니다.");
		return "main";
	}
	
	@ExceptionHandler(AlreadyWriteException.class)
	public String AlreadyWriteExceptionHandler(Model model){
		model.addAttribute("view", "exceptions/msg.jsp");
		model.addAttribute("msg", "이미 글을 등록 하셨습니다.");
		return "main";
	}	
}

