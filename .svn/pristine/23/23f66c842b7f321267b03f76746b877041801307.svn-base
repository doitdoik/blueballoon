package com.icia.blueballoon.controller;

import java.io.*;
import java.security.*;

import javax.mail.*;

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
public class AttrController {
	@Autowired
	private AttrService attrService;
	@Autowired
	private ImageService iService;
	@Autowired
	private IslandService isService;
	@Autowired
	private Gson gson;
	// 명소 리스트 
	@GetMapping("/attr/list")
	public String attrList(@RequestParam(defaultValue="1") Integer pageNo , Model model , Integer isNum) {
		model.addAttribute("detail" , isService.detail(isNum));
		model.addAttribute("map" , attrService.findByList(pageNo , isNum));
		model.addAttribute("view" , "attr/list.jsp");
		return "main";
	}
	
	// 명소 작성 페이지 
	@Secured("ROLE_ADMIN")
	@GetMapping("/attr/write")
	public String attrWrite(Principal principal , Model model) {

		model.addAttribute("island" , isService.noPagingList());
		System.out.println(isService.noPagingList());
		System.out.println(attrService.findByAttr(principal.getName()));
		model.addAttribute("member" , gson.toJson(attrService.findByAttr(principal.getName())));

		model.addAttribute("view" , "attr/write.jsp");

		return "main";
	}
	// 명소 작성 기능
	@PostMapping("/attr/write")
	public String attrWrite(Attraction attraction , Principal principal , Image image , MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		iService.insertAttrImage(attraction, principal, image, picture);
		attrService.write(attraction, principal);

		return "redirect:/";
	}
	
	// 명소 상세 페이지 
	
	@GetMapping("/attr/detail")
	public String detail(@RequestParam Integer attrNum, Model model) {
		System.out.println(attrService.detail(attrNum));
		model.addAttribute("detail" , attrService.detail(attrNum));
		model.addAttribute("view" , "attr/detail.jsp");
		return "main";
	}
	// 삭제
	@DeleteMapping("/attr/delete")
	public ResponseEntity<?> delete(Integer attrNum) {
		System.out.println(attrNum);
		return ResponseEntity.ok(attrService.delete(attrNum));
	}
	
	// 추가
	
	@PatchMapping("/attr/favoUpdate")
	public ResponseEntity<?> favoUpdate(Integer attrNum , Principal principal){
		attrService.findByAttr(principal.getName());
		System.out.println(attrNum +"컨트롤러@@@@@@@@@@@@@");
		System.out.println(principal +"컨트롤러@@@@@@@@@@@@@");

		
		return ResponseEntity.ok(attrService.favoUpdate( attrNum , principal ));
	}
	// 삭제
	@PatchMapping("/attr/favoDelete")
	public ResponseEntity<?> favoDelete(Integer attrNum){
		System.out.println(attrNum);
		return ResponseEntity.ok(attrService.favoDelete( attrNum));
	}
	

	
}
