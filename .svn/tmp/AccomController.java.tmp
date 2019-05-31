package com.icia.blueballoon.controller;

import java.io.*;
import java.security.*;
import java.sql.*;
import java.time.*;

import javax.mail.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class AccomController {

	@Autowired
	private AccommodationService aService;
	@Autowired
	private ImageService iService;
	@Autowired
	private IslandService isService;
	@Autowired
	private StarService stService;
	@Autowired
	private StayService sService;
	@Autowired
	private Gson gson;
	
	@Secured({"ROLE_ACCOM"})
	@GetMapping("/accom/write")
	public String accomWrite(Principal principal, Model model) {
		model.addAttribute("member", gson.toJson(aService.findByAccom(principal.getName())));
		model.addAttribute("island", isService.noPagingList());
		model.addAttribute("view", "accom/write.jsp");
		return "main";
	}
	@Secured({"ROLE_ACCOM"})
	@PostMapping("/accom/write")
	public String accomWrite(Accommodation accom,Principal principal, Image image,
			MultipartFile picture, Stay stay, HttpSession session) throws IllegalStateException, IOException, MessagingException{
		iService.insertAccomImage(accom,principal, image, picture);
		aService.write(accom, principal);
		sService.write(stay);
		stService.insertForRead(accom.getAccomNum());
		return "redirect:/";
	}
	
	@GetMapping("/accom/list")
	public String accomList(@RequestParam(defaultValue="1") Integer pageNo , Model model, Integer isNum) {
		model.addAttribute("detail" , isService.detail(isNum));
		model.addAttribute("map" , aService.accomList(pageNo , isNum));
		model.addAttribute("view" , "accom/list.jsp");
		return "main";
	}
	
	@GetMapping("/accom/detail")
	public String accomDetail(Model model, Integer accomNum) {
		model.addAttribute("detail", aService.detail(accomNum));
		model.addAttribute("view", "accom/detail.jsp");
		return "main";
	}
	
	@PostMapping("/accom/detail")
	public String accomDetail(Integer cnt, HttpSession session,Stay stay
			, Principal principal,Integer accomNum, String stayDate, Integer isNum) {
		aService.insertForMyPackage(cnt, session, stay, principal, accomNum, stayDate, isNum);
		int isNum1 = (int)session.getAttribute("isNum");
		return "redirect:/ship/list?isNum="+ isNum1;
	}
	
	@DeleteMapping("/accom/delete")
	public ResponseEntity<?> delete(Integer accomnum){
		System.out.println(accomnum+"컨트롤러");
		return ResponseEntity.ok(aService.delete(accomnum));
	}

	@PatchMapping("/accom/updateCnt")
	public ResponseEntity<?> updateCnt(Stay stay){
		return ResponseEntity.ok(sService.updateStayCanCap(stay));
	}
	
	@PatchMapping("/accom/update")
	public ResponseEntity<?> update(Stay stay){
		return ResponseEntity.ok(sService.updateStay(stay));
	}
	@Secured({"ROLE_ACCOM"})
	@GetMapping("/accom/update")
	public String update(Model model, Integer accomNum) {
		model.addAttribute("detail", aService.detail(accomNum));
		model.addAttribute("view", "accom/update.jsp");
		return "main";
	}
	
	@PostMapping("/accom/update")
	public String update(Accommodation accom, Integer accomNum, Principal principal, Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		aService.update(accom);
		iService.updateAccomImage(accom, principal, image, picture);
		return "redirect:/accom/detail?accomNum="+accomNum;
	}	

}
