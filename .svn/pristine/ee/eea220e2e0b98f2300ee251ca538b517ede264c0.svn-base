package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class AttrDao {
	@Autowired
	private SqlSessionTemplate tpl; 
	// 명소 등록 
	public Integer insert(Attraction attraction) {
		System.out.println(attraction+"DAO!@#$!@#$!@$!@#$!@#$!@#!@$");
		return tpl.insert("attrDao.insert",attraction);	
	}
	// 회원수 
	public Integer count() {
		return tpl.selectOne("attrDao.count");
	}
	// 명소 리스트 
	public List<Attraction> findByList(Integer startRow, Integer endRow , Integer isNum){
		Map<String , Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("isNum", isNum);
		return tpl.selectList("attrDao.findByList", map);
	}
	//업데이트
	public Integer update(Attraction attraction) {
		return tpl.update("attrDao.update" , attraction);
		
	
	}
	// 삭제
	public Integer delete(Integer attrNum) {
		return tpl.delete("attrDao.delete", attrNum);
	
	}
	// 명소 조회 
	public Attraction detail(Integer attrNum) {
		return tpl.selectOne("attrDao.detail" , attrNum);
	}
	// 조회수 증가
	public Integer readCnt(Integer attrNum) {
		return tpl.selectOne("attrDao.readCnt", attrNum);
	}
	public Member findByAttr(String memId) {
		
		return tpl.selectOne("attrDao.findByAttr" , memId);
	}
	
	// 즐겨찾기 추가
	public Integer favoUpdate(Integer attrNum) {
		return tpl.update("attrDao.favoUpdate" , attrNum);
	}
	
	// 즐겨찾기 해제 
	public Integer favoDelete(Integer attrNum) {
		return  tpl.update("attrDao.favoDelete" , attrNum);
	}
	public Integer updateReadCnt(Integer attrNum) {
		return tpl.update("attrDao.updateReadCnt", attrNum);
		
	}
	

}
