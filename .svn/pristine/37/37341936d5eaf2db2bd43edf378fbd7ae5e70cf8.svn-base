package com.icia.blueballoon.controller;



import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.service.*;


@Controller
public class MainController {
	@Autowired
	private IslandService isService;
	
	// 섬 리스트 
	@GetMapping("/")
	public String findAll(@RequestParam(defaultValue="1") Integer pageNo , Model model) {
		model.addAttribute("map" , isService.findAll(pageNo));
		model.addAttribute("view" , "index.jsp");
		
		return "main";
	}
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin")
	public String adMain(Model model) {
		model.addAttribute("adView","admin/manageList.jsp" );
		return "mainAd";
	}
 
	

}
