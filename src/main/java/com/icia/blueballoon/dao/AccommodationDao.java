package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class AccommodationDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Integer write(Accommodation accom) {
		return tpl.insert("accomDao.write", accom);
	}
	
	public List<Accommodation> noPagingList(){
		return tpl.selectList("accomDao.noPagingList");
	}
	
	public List<Accommodation> accomList(Integer startRow, Integer endRow ,Integer isNum){
		Map<String , Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("isNum", isNum);
		System.out.println("paging=" + startRow + " : " + endRow + "dao");
		System.out.println("map dao : "+map);
		return tpl.selectList("accomDao.list", map);
	}
	
	public Accommodation detail(Integer accomNum) {
		return tpl.selectOne("accomDao.detail", accomNum);
	}
	
	public Member findByAccom(String memId) {
		return tpl.selectOne("accomDao.findByAccom", memId);
	}
	
	public int count() {
		return tpl.selectOne("accomDao.count");
	}

	public int updateCnt(Accommodation accom) {
		return tpl.update("accomDao.updateCnt", accom);
	}
	
	public Accommodation findAccomNum(Integer accomNum) {
		return tpl.selectOne("accomDao.findAccomNum", accomNum);
	}

	public Integer delete(Integer accomNum) {
		System.out.println(accomNum+"DAO");

		return tpl.delete("accomDao.delete", accomNum);
	}
	
	//구매자 리스트
	public List<Payment1> consumerList(Integer accomNum){
		System.out.println(accomNum+"DAOㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		return tpl.selectList("accomDao.consumerList", accomNum);
	}
	
	public int update(Accommodation accom) {
		return tpl.update("accomDao.update", accom);
	}
	
	public List<Integer> findById(String memId) {
		return tpl.selectList("accomDao.findById", memId);
	}
}
