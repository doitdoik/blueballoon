package com.icia.blueballoon.controller;


import java.io.*;

import java.security.*;

import javax.mail.*;
import javax.validation.*;
import javax.websocket.server.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;
@Controller
public class IslandController {
	@Autowired
	private IslandService isService ; 
	@Autowired
	private ImageService iService;
	@Autowired
	private Gson gson;
	
	
	// 섬 리스트 
	@GetMapping
	public String findAll(@RequestParam(defaultValue="1") Integer pageNo , Model model) {
		model.addAttribute("map" , isService.findAll(pageNo));
		model.addAttribute("view" , "index.jsp");
		
		return "main";
	}
	
	// 글읽기
	@GetMapping("/island/detail")
	public String detail(Integer isNum , Model model) {
		model.addAttribute("detail" , isService.detail(isNum));
		System.out.println(isNum);
		model.addAttribute("view" , "island/detail.jsp");
		return "main";
	}
	
	// 섬 작성
	@Secured("ROLE_SHIP")
	@GetMapping("/island/write")
	public String write() {
		return "/island/write";
	}
	
	// 섬 작성 post
	@PostMapping("/island/write")
	public String write(Island island ,Principal principal, Image image ,MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		iService.insertIslandImage(island,principal, image, picture);	
		isService.write(island);

		return "redirect:/";
		
	}
	
	
	// 수정/갱신
	@PostMapping("/island/update")
	public String update(Island island,Integer isNum) {
		isService.update(island);
		return "redirect:/island/detail?isNum="+ isNum; 
	}
	
	// 삭제
	@DeleteMapping("/island/delete")
	public ResponseEntity<?> delete(Integer isNum) {
		System.out.println(isNum);
		return ResponseEntity.ok(isService.delete(isNum));
	}
	
	
	
	
	
}
