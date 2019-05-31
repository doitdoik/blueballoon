package com.icia.blueballoon.controller;

import java.security.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.core.context.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

import oracle.jdbc.proxy.annotation.*;

@RequestMapping("/qna")
@Controller
public class QnaBoardController {
	@Autowired
	private QnaBoardService service;
	
	@GetMapping("/list")
	public String list(@RequestParam(defaultValue="1") Integer page, Model model) {
		Object auth = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(auth=="anonymousUser") {
			return "redirect:/member/login";
		}
		model.addAttribute("map", service.list(page));
		model.addAttribute("view", "qna/list.jsp");
		return "main";
	}
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/detail")
	public String detail(Model model, Integer qnaNum) {
		model.addAttribute("detail", service.detail(qnaNum));
		model.addAttribute("view", "qna/detail.jsp");
		return "main";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/write")
	public String write(Model model, QnaBoard qna) {
		model.addAttribute("view", "qna/write.jsp");
		return "main";
	}
	
	@PostMapping("/write")
	public String write(String qnaTitle, String qnaContent, Principal principal) {
		service.insert(qnaTitle, qnaContent, principal.getName());
		return "redirect:/qna/list";
	}
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/update")
	public String update(Model model, Integer qnaNum) {
		model.addAttribute("detail", service.detail(qnaNum));
		model.addAttribute("view", "qna/update.jsp");
		return "main";
	}
	
	@PostMapping("/update")
	public String update(QnaBoard qna, Integer qnaNum) {
		service.update(qna);
		return "redirect:/qna/detail?qnaNum="+ qnaNum;
	}
	
	@DeleteMapping("/delete")
	public ResponseEntity<?> delete(Integer qnaNum) {
		return ResponseEntity.ok(service.delete(qnaNum));
	}
}
