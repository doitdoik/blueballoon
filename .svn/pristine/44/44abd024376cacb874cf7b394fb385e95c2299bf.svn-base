package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class IslandDao {
	@Autowired
	private SqlSessionTemplate tpl;
	// 섬 리스트
	public List<Island> findAll(Integer startRow , Integer endRow){
		Map<String  , Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return tpl.selectList("islandDao.findAll" , map);
	}
	// 글 수 
	public int count() {
		return tpl.selectOne("islandDao.count");
	}
	
	// 글 읽기
	public Island detail(Integer isNum) {
		return tpl.selectOne("islandDao.detail", isNum);
	}
	
	// 글쓰기
	public Integer insert(Island island) {
		return tpl.insert("islandDao.insert", island);
	}
	
	// 갱신
	public int update(Island island) {
		return tpl.update("islandDao.update", island);
	}
	
	// 별점하기
	public void updateStar(String isNum) {
		tpl.update("islandDao.updateStar", isNum);
	}

	

	// 삭제
	public Integer delete(Integer isNum) {
		return tpl.delete("islandDao.delete", isNum);
	}
	
	// 숙박, 선박작성에서 보일 섬리스트
		public List<Island> noPagingList() {
			return tpl.selectList("islandDao.noPagingList");
		}

	
}
