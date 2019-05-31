package com.icia.blueballoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;

import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.util.paging.*;
@Service
public class IslandService {
	// 메인페이지에 보일 섬 리스트 
	@Autowired
	private IslandDao dao;
	public Map<String, Object> findAll(Integer pageNo) {
		// 글개수 읽기 
		Pagination pagination = IslandPagingUtil.getPagination(pageNo, dao.count());
		List<Island> list = dao.findAll(pagination.getStartRow() , pagination.getEndRow());
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;

	}
	
	// 글 읽기
	public Island detail(Integer isNum) {
		
		
		return dao.detail(isNum);
	}
	// 글작성 
	public Integer write(Island island) {
		return dao.insert(island);
	}

	// 숙박, 선박작성에서 보일 섬리스트
	public List<Island> noPagingList(){
		return dao.noPagingList();
	}

	public int update(Island island) {
		return dao.update(island);
	}

	public Integer delete(Integer isNum) {
		return dao.delete(isNum);
	}

}
