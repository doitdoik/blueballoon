package com.icia.blueballoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

@Service
public class TransportService {
	@Autowired
	private TransportDao dao;
	
	public Integer write(Transport trans) {
		return dao.write(trans);
	}
	
	public Transport detail(String transNum) {
		return dao.detail(transNum);
	}
	
	public List<Transport> list() {
		return dao.list();
	}
	
	public Integer writeForPackage(Transport trans) {
		return dao.writeForPackage(trans);
	}
	
	public Integer writeForMyPackage(Transport trans) {
		return dao.writeForMyPackage(trans);
	}
	
	public Integer updateTransCanCapAndDate(Transport trans) {
		return dao.updateTransCanCapAndDate(trans);
	}
}
