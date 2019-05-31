package com.icia.blueballoon.controller;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.mail.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.google.gson.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.entity.Transport;
import com.icia.blueballoon.service.*;

@Controller
public class ShipController {

	@Autowired
	private ShipService sService;
	@Autowired
	private ImageService iService;
	@Autowired
	private IslandService isService;
	@Autowired
	private TransportService tService;
	@Autowired
	private PackageController1 pService;
	
	@Secured({"ROLE_SHIP"})
	@GetMapping("/ship/write")
	public String shipWrite(Principal principal, Model model) {
		model.addAttribute("member", sService.findByShip(principal.getName()));
		model.addAttribute("island", isService.noPagingList());
		model.addAttribute("view", "ship/write.jsp");
		return "main";
	}
	
	@PostMapping("/ship/write")
	public String shipWrite(Ship ship,Principal principal, Image image, MultipartFile picture,Transport trans) throws IllegalStateException, IOException, MessagingException{
		iService.insertShipImage(ship, principal, image, picture);
		sService.write(ship, principal);
		tService.write(trans);
		return "redirect:/";
	}
	
	@GetMapping("/ship/list")
	public String shipList(@RequestParam(defaultValue="1") Integer pageNo , Model model , Integer isNum) {
		model.addAttribute("detail" , isService.detail(isNum));
		model.addAttribute("map" , sService.shipList(pageNo , isNum));
		model.addAttribute("view" , "ship/list.jsp");
		return "main";
	}
	
	@GetMapping("/ship/detail")
	public String shipDetail(Model model, Integer shipNum) {
		model.addAttribute("detail", sService.detail(shipNum));
		model.addAttribute("view", "ship/detail.jsp");
		return "main";
	}
	
	@PostMapping("/ship/detail")
	public String shipDetail(Principal pricipal,Transport trans,Package1 package1,HttpSession session) {
		trans.setMemId(pricipal.getName());
		tService.writeForMyPackage(trans);
		pService.writeForMyPackage(package1);
		Integer pkgNum = package1.getPkgNum(); 
		return "redirect:/package/info?pkgNum=" + pkgNum;
	}
	
	@Secured({"ROLE_SHIP"})
	@GetMapping("/ship/consumerList")
	public List<Ship> consumerList(Integer shipNum){
		return sService.consumerList(shipNum);
	}
	
	@Secured({"ROLE_SHIP"})
	@GetMapping("/ship/update")
	public String update(Model model, Integer shipNum) {
		model.addAttribute("detail", sService.detail(shipNum));
		model.addAttribute("view", "ship/update.jsp");
		return "main";
	}
	
	@PostMapping("/ship/update")
	public String update(Ship ship, Integer shipNum, Principal principal, Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		sService.update(ship);
		iService.updateShipImage(ship,principal, image, picture);

		return "redirect:/ship/detail?shipNum="+shipNum;
	}	
	
	@DeleteMapping("/ship/delete")
	public ResponseEntity<?> delete(Integer shipnum){
		System.out.println(shipnum+"컨트롤러");
		return ResponseEntity.ok(sService.delete(shipnum));
	}
}
