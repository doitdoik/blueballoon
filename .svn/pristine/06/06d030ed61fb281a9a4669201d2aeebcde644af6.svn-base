package com.icia.blueballoon.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

@RequestMapping("/info")
@Controller
public class InfoController {

	@Autowired
	private InfoService service;
	
	@GetMapping("/list")
	public String list(@RequestParam(defaultValue="1")Integer page,Model model) {
		model.addAttribute("map", service.list(page));
		model.addAttribute("view", "info/list.jsp");
		return "main";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/detail")
	public String detail(Model model, Integer infoNum) {
		model.addAttribute("detail", service.detail(infoNum));
		model.addAttribute("view", "info/detail.jsp");
		return "main";
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/write")
	public String write(Model model, Information info) {
		model.addAttribute("view", "info/write.jsp");
		return "main";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/write")
	public String write(Information info) {
		service.write(info);
		int infoNum = info.getInfoNum();
		return "redirect:/info/detail?infoNum="+ infoNum;
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/update")
	public String update(Model model, Integer infoNum) {
		model.addAttribute("detail", service.detail(infoNum));
		model.addAttribute("view", "info/update.jsp");
		return "main";
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("/update")
	public String update(Information info,Integer infoNum) {
		service.update(info);
		return "redirect:/info/detail?infoNum="+ infoNum; 
	}
	
	@Secured("ROLE_ADMIN")
	@DeleteMapping("/delete")
	public ResponseEntity<?> delete(Integer infoNum) {
		return ResponseEntity.ok(service.delete(infoNum));
	}
}