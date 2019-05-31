package com.icia.blueballoon.controller;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.context.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;
import com.icia.blueballoon.service.*;

import lombok.extern.slf4j.*;

@Slf4j
@RequestMapping("/review")
@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;

	@GetMapping("/list")
	public String list(@RequestParam(defaultValue = "1") Integer page, Model model, Integer revNum) {
		model.addAttribute("map", service.list(page));
		model.addAttribute("view", "review/list.jsp");
		return "main";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/detail")
	public String detail(Model model, Integer revNum, Principal principal) {
		Object auth = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(auth=="anonymousUser") {
			return "redirect:/member/login";
		}
		model.addAttribute("detail", service.detail(revNum, principal.getName()));
		model.addAttribute("view", "review/detail.jsp");
		return "main";
	}

	// 글쓰기 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/write")
	public String write(Model model, Review review) {
		model.addAttribute("view", "review/write.jsp");
		return "main";
	}

	// 작성자 출력
	@PostMapping("/write")
	public String write(String revTitle, String revContent, Principal principal) {
		service.insert(revTitle, revContent, principal.getName());
		return "redirect:/review/list";
	}

	// 추가
	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@GetMapping("/update")
	public String update(Model model, Integer revNum, String memId) {
		model.addAttribute("detail", service.detail(revNum,memId));
		model.addAttribute("view", "review/update.jsp");
		return "main";
	}

	@PostMapping("/update")
	public String update(Review review, Integer revNum) {
		service.update(review);
		return "redirect:/review/detail?revNum=" + revNum;
	}

	@DeleteMapping("/delete")
	public ResponseEntity<?> delete(Integer revNum) {
		return ResponseEntity.ok(service.delete(revNum));
	}
	
	//글 추천++
	@Secured("ROLE_USER")
	@PostMapping("/revGood")
	public ResponseEntity<?> revGoodReview(Review review, Principal principal) {		
		return ResponseEntity.ok(service.revGoodReview(review, principal.getName()));
	}

}
