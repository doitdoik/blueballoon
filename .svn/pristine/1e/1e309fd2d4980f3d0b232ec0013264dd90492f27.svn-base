package com.icia.blueballoon.service;

import java.security.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;
import com.icia.blueballoon.util.paging.*;

@Service
public class ShipService {
	@Autowired
	private ShipDao dao;
	@Autowired
	private ModelMapper modelMapper;
	
	public List<Ship> noPagingList(){
		return dao.noPagingList();
	}
	
	public Map<String, Object> shipList(Integer pageNo , Integer isNum){
		
		Pagination pagination = ShipPagingUtil.getPagination(pageNo, dao.count());
		
		List<Ship> list = dao.shipList(pagination.getStartRow(), pagination.getEndRow() , isNum);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;
	}
	
	public Ship detail(Integer shipNum) {
		return dao.detail(shipNum);
	}
	
	public Integer write(Ship ship, Principal principal) {
		String memId = principal.getName();
		ship.setMemId(memId);
		List<Integer> cnt = dao.findById(memId);
		if(cnt.size()>=1) {
			throw new AlreadyWriteException();
		}
		return dao.write(ship);
	}
	
	public ShipDto.ShipTest findByShip(String memId){
		
		Member member = dao.findByShip(memId);
		
		ShipDto.ShipTest dto = modelMapper.map(member, ShipDto.ShipTest.class);
		dto.setMemBrand(member.getMemBrand());
		dto.setMemTel(member.getMemTel());
		return dto;
	}
	
	public List<Ship> consumerList(Integer shipNum){
		return dao.consumerList(shipNum);
	}
	
	public Integer update(Ship ship) {
		return dao.update(ship);
	}

	public Integer delete(Integer shipnum) {
		return dao.delete(shipnum);
	}
}
