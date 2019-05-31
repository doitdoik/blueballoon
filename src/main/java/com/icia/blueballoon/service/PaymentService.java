package com.icia.blueballoon.service;

import java.security.*;
import java.time.*;
import java.time.format.*;
import java.util.*;
import java.util.stream.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;

@Service
public class PaymentService {
	@Autowired
	private PaymentDao dao;
	@Autowired
	private ModelMapper modelMapper;
	
	public Integer write(Payment1 payment, Principal principal) {
		payment.setMemId(principal.getName());
		return dao.write(payment);
	}
	
	public List<Payment1> list(String memId){
		return dao.list(memId);
	}
	
	public PaymentDto.DtoForRead newPayInfo(String memId) {
		Payment1 result = dao.newPayInfo(memId);
		LocalDateTime date = LocalDateTime.now();
		PaymentDto.DtoForRead info = modelMapper.map(result, PaymentDto.DtoForRead.class);
		// yyyy-MM-dd T hh:mm:ss형식을 -> yyyy-MM-dd hh:mm:ss 으로 바꿔서 출력
		info.setPayDateStr(date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")));
		return info;
	}
	
}
