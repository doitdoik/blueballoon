package com.icia.blueballoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

@Service
public class StayService {
	@Autowired
	private StayDao dao;
	
	public Integer write(Stay stay) {
		return dao.write(stay);
	}
	
	public Stay detail(String stayNum) {
		return dao.detail(stayNum);
	}
	
	public List<Stay> list() {
		return dao.list();
	}
	
	public int updateStayCanCap(Stay stay) {
		return dao.updateStayCanCap(stay);
	}
	
	public Integer writeForPackage(Stay stay) {
		return dao.writeForPackage(stay);
	}
	
	public Integer writeForMyPackage(Stay stay) {
		return dao.writeForMyPackage(stay);
	}
	
	public int updateStay(Stay stay) {
		return dao.updateStay(stay);
	}
	
	public int updateStayCanCapAndDate(Stay stay) {
		return dao.updateStayCanCapAndDate(stay);
	}
	
	public int returnStayCanCap(Stay stay) {
		return dao.returnStayCanCap(stay);
	}
	
}
