package com.icia.blueballoon.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

@RequestMapping("/star")
@Controller
public class StarController {
	@Autowired
	private StarService service;
	
	@GetMapping("/form")
	// 별점을 등록하기 위한 화면
	public String form(Model model,Integer accomNum) {
		model.addAttribute("star", service.detail(accomNum));
		return "star/form";
	}
	
	@GetMapping("/star")
	// 별점 등록
	public ResponseEntity<?> insert(Star star) {
		return ResponseEntity.ok(service.insert(star));
	}

	@DeleteMapping("/delete")
	// 임시로 숙박번호만 넣었던 것 삭제
	public ResponseEntity<?> delete(){
		return ResponseEntity.ok(service.delete());
	}
}
