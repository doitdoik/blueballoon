package com.icia.blueballoon.controller;

import java.security.*;
import java.time.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.service.*;

@Controller
public class ReplyController {
 @Autowired
 private ReviewService service;
 
	//댓글 작성
	@PostMapping("/review/reply")
	public ResponseEntity<?> insertReply(@Valid Reply reply, BindingResult results, Principal principal) {
		return ResponseEntity.ok(service.insertReply(reply, principal));
	}
	
	//댓글 삭제
	@DeleteMapping("/review/reply2")
	public ResponseEntity<?> deleteReplyByReplyNum(@NonNull Integer replyNum) {
		return ResponseEntity.ok(service.deleteReplyByReplyNum(replyNum));
	}
}
