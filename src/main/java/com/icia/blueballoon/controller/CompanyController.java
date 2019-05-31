package com.icia.blueballoon.controller;

import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.google.gson.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService service;
	@Autowired
	private AccommodationService aService;
	@Autowired
	private MemberService mService;
	@Autowired
	private ShipService sService;
	@Autowired
	private Gson gson;
	
	@GetMapping("/company/join")
	public String join(Model model) {
		model.addAttribute("view","company/join.jsp");
		return "main";
	}
	
	@PostMapping("/company/join")
	public String join(@ModelAttribute TempMember tempMember) {
		service.insertTempMember(tempMember);
		return "redirect:/member/login";
	}
	
	@GetMapping("/tempMember/id/{tempId}")
	public ResponseEntity<?> idAvailable(@PathVariable String tempId) {
		return ResponseEntity.ok(service.tempIdAvailable(tempId));
	}
	
	@GetMapping("/tempMember/email")
	public ResponseEntity<?> emailAvailable(String tempEmail) {
		return ResponseEntity.ok(service.tempEmailAvailable(tempEmail));
	}
	
	@GetMapping("/tempMember/licence")
	public ResponseEntity<?> licenceAvailable(String tempLicence) {
		return ResponseEntity.ok(service.tempLicenceAvailable(tempLicence));
	}
	
	@Secured({"ROLE_SHIP","ROLE_ACCOM"})
	@GetMapping("/company/myPage")
	public String myPage(Model model, Principal principal) {
		model.addAttribute("member", mService.findByIdForConsumerList(principal));
		model.addAttribute("view","company/myPage.jsp");
		return "main";
	}
	// 업체정보관리 페이지
	@Secured({"ROLE_SHIP","ROLE_ACCOM"})
	@GetMapping("/company/info")
	public String info(Principal principal, Model model) {
		model.addAttribute("member", gson.toJson(service.findCInfoById(principal.getName())));
		model.addAttribute("view", "company/info.jsp");
		return "company/info";
	}
	// 숙박 구매자리스트
	@Secured({"ROLE_SHIP","ROLE_ACCOM"})
	@GetMapping("/company/consumerList")
	public String consumerList(Principal principal, Integer accomNum, Model model, Integer shipNum) {	
		model.addAttribute("member", gson.toJson(aService.findByAccom(principal.getName())));
		model.addAttribute("ship", sService.consumerList(shipNum));
		model.addAttribute("info", aService.consumerList(accomNum));
		model.addAttribute("view", "company/consumerList.jsp");
		return "main";
	}
	// 통계 페이지
	@Secured({"ROLE_SHIP","ROLE_ACCOM"})
	@GetMapping("/company/stats")
	public String stats(Principal principal,Model model) {
		String memId = principal.getName();
		//model.addAttribute("stats", service.());
		model.addAttribute("view", "company/stats.jsp");
		return "main";
	}
	
	// 통계 그래프1
	@GetMapping("/stats1")
	public ResponseEntity<?> stats1(String username) {
		List<Integer> proceeds = new ArrayList<>();
		proceeds.add(31600);
		proceeds.add(38900);
		proceeds.add(67000);
		proceeds.add(85400);
		proceeds.add(78200);
		proceeds.add(55300);
		return ResponseEntity.ok(proceeds);
	}

	// 통계 그래프2
	@GetMapping("/stats2")
	public ResponseEntity<?> stats2(String username) {
		List<Integer> p1 = new ArrayList<>();
		p1.add(323);
		p1.add(411);
		p1.add(384);
		p1.add(377);
		
		List<Integer> p2 = new ArrayList<>();
		p2.add(342);
		p2.add(378);
		p2.add(378);
		p2.add(378);
		
		List result = new ArrayList<>();
		result.add(p1);
		result.add(p2);
		return ResponseEntity.ok(result);
	}

	// 통계 그래프3
	@GetMapping("/stats3")
	public ResponseEntity<?> stats3(String username) {
		List<Integer> proceeds = new ArrayList<>();
		proceeds.add(60);
		proceeds.add(100);
		return ResponseEntity.ok(proceeds);
	}
}
