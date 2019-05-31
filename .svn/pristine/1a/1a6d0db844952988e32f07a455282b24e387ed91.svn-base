package com.icia.blueballoon.controller;

import java.security.*;
import java.time.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.core.context.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;
@Secured("ROLE_USER")
@Controller
public class PaymentController {
	@Autowired
	private PaymentService service;
	
	// 방금 결제한 결제 정보
	@Secured("ROLE_USER")
	@GetMapping("/pay/info")
	public String info(Model model, Principal principal) {
		String memId = principal.getName();
		model.addAttribute("info", service.newPayInfo(memId));
		model.addAttribute("view", "pay/info.jsp");
		return "main";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/pay/payment")
	// 결제하기
	public ResponseEntity<?> write(Payment1 payment, Principal principal){
		return ResponseEntity.ok(service.write(payment, principal));
	}
}
