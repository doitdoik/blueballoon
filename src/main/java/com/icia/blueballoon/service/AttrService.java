package com.icia.blueballoon.service;

import java.security.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.util.paging.*;

@Service
public class AttrService {

	@Autowired
	private AttrDao dao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private FavoriteDao faDao;

	

	// 명소 리스트
	public Map<String, Object> findByList(Integer pageNo, Integer isNum) {
		// 글개수 읽기
		Pagination pagination = PagingUtilAttr.getPagination(pageNo, dao.count());

		List<Attraction> list = null;
		// 페이징
		list = dao.findByList(pagination.getStartRow(), pagination.getEndRow(), isNum);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;

	}

	public Integer write(Attraction attraction, Principal principal) {
		attraction.setMemId(principal.getName());
		System.out.println(attraction + "서비스@!@!@!@!#!@#!@#!@#!@#!@#");
		System.out.println(principal + "서비스@!@!@!@!#!@#!@#!@#!@#!@#");
		return dao.insert(attraction);
		
		

	}

	public Attraction detail(Integer attrNum) {
		dao.updateReadCnt(attrNum);
		dao.readCnt(attrNum);
		
		
		return dao.detail(attrNum);
	}

	public Integer delete(Integer attrNum) {
		return dao.delete(attrNum);
	}

	public int update(Attraction attraction) {
		return dao.update(attraction);
	}

	public AttractionDto.findByMemId findByAttr(String memId) {
		Member member = dao.findByAttr(memId);

		AttractionDto.findByMemId dto = modelMapper.map(member, AttractionDto.findByMemId.class);
		dto.setMemId(memId);
		return dto;

	}

	public Integer favoUpdate(Integer attrNum , Principal principal) {
		String memId = principal.getName();
		
		faDao.insert(attrNum, memId);
		
		return dao.favoUpdate(attrNum);
	}

	public Integer favoDelete(Integer attrNum) {
		System.out.println(attrNum+ "service attrNum@@@@@");
		System.out.println(attrNum+ "service attrNum@@@@@");
		System.out.println(attrNum+ "service attrNum@@@@@");
		System.out.println(attrNum+ "service attrNum@@@@@");
		System.out.println(attrNum+ "service attrNum@@@@@");
		faDao.delete(attrNum);
		System.out.println(attrNum+ "service attrNum@@@@@");
		
		
		
		return dao.favoDelete(attrNum);
		
	}





}
