package com.icia.blueballoon.controller;

import java.security.*;
import java.util.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.service.*;
@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private MemberService mService;
	
	// 관리자 로그인 페이지 	
	@GetMapping("/admin/login")
	public String login() {
		return "admin/login";
	}
	
	// 임시 회원 리스트
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/permitCompany")
	public String permitCompanyList(Model model) {
		model.addAttribute("adView", "admin/permitCompany.jsp");
		model.addAttribute("map", service.findpermitCompanyList());
		return "mainAd";
	}
	
	//임시 회원 -> 업체 회원 승인
	@Secured("ROLE_ADMIN")
	@PutMapping("/admin/permitCompany")
	public ResponseEntity<?> permitCompany(String tempId , String authName) {
		return ResponseEntity.ok(mService.join(tempId , authName));
	}
	
	// 회원 목록 선택 페이지
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/manageList")
	public String manageList(Model model) {
		model.addAttribute("adView","admin/manageList.jsp");
		return "mainAd";
	}
	
	
	// 일반 회원 목록 리스트
	@Secured("ROLE_ADMIN")
	@GetMapping("admin/userList")
	public String userList(@RequestParam(defaultValue="1") Integer pageNo , Model model) {
		model.addAttribute("adView" ,"admin/userList.jsp");
		model.addAttribute("map", service.userList(pageNo));
		return "mainAd";	
	}
	
	// 업체 회원 목록 리스트
	@Secured("ROLE_ADMIN")
	@GetMapping("admin/companyList")
	public String companyList(@RequestParam(defaultValue="1") Integer pageNo , Model model) {
		model.addAttribute("adView" , "admin/companyList.jsp");
		model.addAttribute("map", service.userList(pageNo));
		return "mainAd";
	}

	// 회원 블락 
	@PatchMapping("/admin/userBlock")
	public ResponseEntity<?> userBlock(String memId){
		return ResponseEntity.ok(service.userBlock(memId));
	}
	
	// 블락 해제 
	@PatchMapping("/admin/userCancel")
	public ResponseEntity<?> userCencel(String memId){
		return ResponseEntity.ok(service.userCancel(memId));
	}
	

	
	// 회원 블락 리스트
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/blockList")
	public String blockList(@RequestParam(defaultValue="1") Integer pageNo, Model model) {
		model.addAttribute("map", service.userList(pageNo));
		model.addAttribute("adView" , "admin/blockList.jsp");
		return "mainAd";
	}
	
	// 게시판 관리
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/boardManage")
	public String boardManage(Model model) {
		model.addAttribute("adView" , "admin/boardManage.jsp");
		return "mainAd";
		
	}
	
	
	
	

	// 공지 관리 페이지 리스트 
	@GetMapping("/admin/infoList")
	public String infoList(@RequestParam(defaultValue="1") Integer pageNo , Model model) {
		model.addAttribute("map", service.infoList(pageNo));
		model.addAttribute("adView", "admin/infoList.jsp");
		return "mainAd";
	}
	
	// 공지 삭제 
	@DeleteMapping("/admin/delete")
	public ResponseEntity<?> delete(Integer infoNum){
		return ResponseEntity.ok(service.deleteBoard(infoNum));
	}

	// 통계 페이지
	@GetMapping("/admin/stats")
	public String stats(Principal principal,Model model) {
		String memId = principal.getName();
		//model.addAttribute("stats", service.());
		model.addAttribute("adView", "admin/stats.jsp");
		return "mainAd";
	}
	
	// 통계 그래프2
	@GetMapping("/admin/stats2")
	public ResponseEntity<?> stats2(String username) {
		List<Integer> p1 = new ArrayList<>();
		p1.add(390);
		p1.add(411);
		p1.add(384);
		p1.add(377);
		p1.add(400);
		p1.add(370);
		
		List<Integer> p2 = new ArrayList<>();
		p2.add(342);
		p2.add(378);
		p2.add(400);
		p2.add(420);
		p2.add(360);
		p2.add(350);
		
		List<Integer> p3 = new ArrayList<>();
		p3.add(370);
		p3.add(410);
		p3.add(320);
		p3.add(340);
		p3.add(328);
		p3.add(390);
		
		List result = new ArrayList<>();
		result.add(p1);
		result.add(p2);
		result.add(p3);
		return ResponseEntity.ok(result);
	}


	// 통계 그래프3
	@GetMapping("/admin/stats3")
	public ResponseEntity<?> stats3(String username) {
		List<Integer> proceeds = new ArrayList<>();
		proceeds.add(60);
		proceeds.add(100);
		proceeds.add(100);
		return ResponseEntity.ok(proceeds);
	}
	
}