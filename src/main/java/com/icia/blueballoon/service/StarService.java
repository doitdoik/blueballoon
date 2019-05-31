package com.icia.blueballoon.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

@Service
public class StarService {
	@Autowired
	private StarDao dao;
	
	public Integer insert(Star star) {
		return dao.insert(star);
	}
	
	public Star detail(Integer accomNum) {
		return dao.detail(accomNum);
	}
	
	public Integer insertForRead(Integer accomNum) {
		return dao.insertForRead(accomNum);
	}
	
	public Integer delete() {
		return dao.delete();
	}
}
