package com.icia.blueballoon.controller;

import java.security.*;

import javax.mail.*;
import javax.servlet.http.*;
import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
import org.springframework.security.core.annotation.*;
import org.springframework.security.core.context.*;
import org.springframework.security.web.authentication.logout.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.google.gson.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

import lombok.*;
import lombok.extern.slf4j.*;

@Slf4j
@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	//gson추가
	@Autowired
	private Gson gson;
	
	@GetMapping("/member/joinChoice")
	public String joinChoice(Model model) {
		model.addAttribute("view", "member/joinChoice.jsp");
		return "main";
	}

	@GetMapping("/member/join")
	public String join(Model model) {
		model.addAttribute("view", "member/join.jsp");
		return "main";
	}
	
	@GetMapping("/member/id/{memId}")
	public ResponseEntity<?> idAvailable(@PathVariable String memId) {
		return ResponseEntity.ok(service.memIdAvailable(memId));
	}
	
	@GetMapping("/member/email")
	public ResponseEntity<?> emailAvailable(String memEmail) {
		return ResponseEntity.ok(service.memEmailAvailable(memEmail));
	}
	
	@GetMapping("/member/licence")
	public ResponseEntity<?> licenceAvailable(String memLicence) {
		return ResponseEntity.ok(service.memLicenceAvailable(memLicence));
	}
	
	@PostMapping("/member/join")
	public String join(@ModelAttribute Member member) {
		service.insertMember(member);
		return "redirect:/member/login";
	}
    //아이디 찾기 링크
	@GetMapping("/member/findId")
	public String findId( Model model) {	
		model.addAttribute("view", "member/findId.jsp");
		return "main";
	}
	
	@PostMapping("/member/findId")
	public String findId(@NonNull String memName, @NonNull String memEmail, Model model, HttpSession session) {
		String msg = service.findId(memName, memEmail);
		session.setAttribute("msg", "당신의 아이디 : " + msg);
		return "findMsg";
	}
	
	//비밀번호 찾기 링크+
	@GetMapping("/member/findPwd")
	public String findPwd( Model model) {	
		model.addAttribute("view", "member/findPwd.jsp");
		return "main";
	}
	
	//비번 리셋, 안내 이메일 전송 후 
	@PostMapping("/member/findPwd")
	public String resetPwd(@NonNull String memId, @NonNull String memEmail, Model model, HttpSession session) throws MessagingException  {
		String msg = service.resetPwd(memId, memEmail);
		session.setAttribute("msg", "임시 비밀번호가 " + msg + "로 발급되었습니다");
		return "findMsg";
	}

	//로그인 페이지
	@GetMapping("/member/login")
	public String login(Model model, HttpSession session) {
		model.addAttribute("view", "member/login.jsp");
		return "main";
	}
	

	//myPage이동
	@Secured("ROLE_USER")
	@GetMapping("/member/myPage")
	public String myPage(Model model) {
		model.addAttribute("view", "member/myPage.jsp");
		return "main";
	}
	
    //내정보보기
	@Secured("ROLE_USER")
	@GetMapping("/member/info")
	public String info(Principal principal, Model model) {
		model.addAttribute("member", gson.toJson(service.findById(principal.getName())));
		model.addAttribute("view", "member/info.jsp");
		return "member/info";
	}
	
	//내정보에서 비밀번호변경
	@Secured({"ROLE_USER","ROLE_ACCOM","ROLE_SHIP"})
	@PatchMapping("/member/memPwd")
	public ResponseEntity<?> changePwd
	(@NonNull String memPwd, @NonNull String memNewPwd, Principal principal) {
		return ResponseEntity.ok(service.changePwd(memPwd, memNewPwd, principal.getName()));
	}
    
	//회원 탈퇴
	@Secured({"ROLE_USER","ROLE_ACCOM","ROLE_SHIP"})
	@PutMapping("/member/exit")
	public ResponseEntity<?> exit(SecurityContextLogoutHandler handler, HttpServletRequest req, HttpServletResponse res, Authentication auth) {
		Boolean result = service.delete(auth.getName(), null);
		if(result)
			handler.logout(req, res, auth);
		return ResponseEntity.ok(result);
	}
	
	//결제정보
	@Secured("ROLE_USER")
	@GetMapping("/member/payList")
	public String payList(Principal principal,Model model) {
		String memId = principal.getName();
		model.addAttribute("info", service.payList(memId));
		model.addAttribute("view", "member/payList.jsp");
		return "main";
	}
	
	//내 글 목록
	@Secured({"ROLE_USER","ROLE_ACCOM","ROLE_SHIP"})
	@GetMapping("/member/myWriteList")
	public String myWriteList(Principal principal,Model model) {
		String memId=principal.getName();
		model.addAttribute("review",service.myWriteList1(memId));	
		model.addAttribute("qna",service.myWriteList2(memId));
		model.addAttribute("view","member/myWriteList.jsp");
		return "main";	
	}
	
	//내 댓글 목록
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/myReplyList")
	public String myReplyList(Principal principal,Model model) {
		String memId = principal.getName();
		model.addAttribute("reply", service.myReplyList(memId));
		model.addAttribute("view", "member/myReplyList.jsp");
		return "main";
	}
	
	//즐겨찾기 목록
	@Secured("ROLE_USER")
	@GetMapping("/member/favoriteList")
	public String favoriteList(Principal principal,Model model) {
		
	   model.addAttribute("favorite", service.favoriteList(principal));
		model.addAttribute("view", "member/favoriteList.jsp");
		return "main";
	}
	

}
