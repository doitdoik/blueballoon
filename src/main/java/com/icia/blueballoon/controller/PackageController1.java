package com.icia.blueballoon.controller;

import java.io.*;
import java.security.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

import lombok.extern.slf4j.*;

@Slf4j
@RequestMapping("/package")
@Controller
public class PackageController1 {
	@Autowired
	private PackageService service;
	@Autowired
	private AccommodationService aService;
	@Autowired
	private ShipService sService;
	@Autowired
	private TransportService tService;
	@Autowired
	private StayService stService;
	@Autowired
	private ImageService iService;
	
	
	@GetMapping("/list")
	// 패키지 리스트
	public String list(Model model,
			@RequestParam(defaultValue="1") Integer pageNo) {
		model.addAttribute("map", service.list(pageNo));
		model.addAttribute("view", "package/list.jsp");
		return "main";
	}
	
	@GetMapping("/detail")
	// 패키지 상세보기
	public String detail(Model model, Integer pkgNum, Integer accomNum, Integer shipNum) {
		model.addAttribute("detail", service.detail(pkgNum,accomNum,shipNum));
		model.addAttribute("view", "package/detail.jsp");
		return "main";
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/write")
	// 패키지 작성
	public String write(Model model, Package1 package1) {
		model.addAttribute("accom", aService.noPagingList());
		model.addAttribute("ship", sService.noPagingList());
		model.addAttribute("view", "package/write.jsp");
		return "main";
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Secured("ROLE_ADMIN")
	@PostMapping("/write")
	// 패키지 작성
	public String write(Package1 package1,Principal principal, Transport trans, Stay stay, Image image, MultipartFile picture) throws IllegalStateException, IOException {
		iService.insertPackageImage(package1,principal, image, picture);
		tService.writeForPackage(trans);
		stService.writeForPackage(stay);
		service.write(package1);
		int pkgNum = package1.getPkgNum();
		int accomNum = stay.getAccomNum();
		return "redirect:/package/detail?pkgNum="+pkgNum+"&accomNum="+accomNum;
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/update")
	// 패키지 수정
	public String update(Model model, Integer pkgNum, Integer accomNum,Integer shipNum) {
		model.addAttribute("detail", service.detail(pkgNum,accomNum,shipNum));
		model.addAttribute("view", "package/update.jsp");
		return "main";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/update")
	// 패키지 수정
	public String update(Package1 package1, Integer pkgNum) {
		service.update(package1);
		return "redirect:/package/detail?pkgNum="+pkgNum;
	}
	
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/delete")
	// 패키지 삭제
	public ResponseEntity<?> delete(Integer pkgNum) {
		return ResponseEntity.ok(service.delete(pkgNum));
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/info")
	// 나만의 패키지 이용시 패키지 정보
	public String info(Model model,Principal principal,Integer pkgNum) {
		String memId = principal.getName();
		model.addAttribute("info", service.myPackageInfo(memId, pkgNum));
		model.addAttribute("stay", service.myPackageStayList(memId));
		model.addAttribute("trans", service.myPackageTransList(memId));
		model.addAttribute("view", "package/info.jsp");
		return "main";
	}
	
	@Secured("ROLE_USER")
	@PostMapping("/info")
	// 결제를 하면 패키지 작성을 위해 사용한 세션 모두 삭제
	public String info(HttpSession session) {
		session.removeAttribute("cnt");
		session.removeAttribute("departure");
		session.removeAttribute("stayNum");
		session.removeAttribute("accomNum");
		session.removeAttribute("newUser");
		return "redirect:/pay/info";
	}
	
	@PutMapping("/insert")
	// 나만의 패키지 작성을 위한 등록
	public ResponseEntity<?> writeForMyPackage(Package1 package1){
		return ResponseEntity.ok(service.writeForMyPackage(package1));
	}
	
	@PatchMapping("/package")
	public ResponseEntity<?> updateStayAndTransport(Stay stay, Transport trans){
		tService.updateTransCanCapAndDate(trans);
		return ResponseEntity.ok(stService.updateStayCanCapAndDate(stay));
	}
}
