package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class ShipDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	
	public List<Ship> noPagingList(){
		return tpl.selectList("shipDao.noPagingList");
	}
	
	public Ship detail(String shipNum) {
		return tpl.selectOne("shipDao.detail", shipNum);
	}
	
	public Integer write(Ship ship) {
		return tpl.insert("shipDao.write", ship);
	}
	
	public List<Ship> shipList(Integer startRow, Integer endRow ,Integer isNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("isNum", isNum);
		return tpl.selectList("shipDao.list", map);
	}
	
	public Ship detail(Integer shipNum) {
		return tpl.selectOne("shipDao.detail", shipNum);
	}
	
	public int count() {
		return tpl.selectOne("shipDao.count");
	}
	
	public Member findByShip(String memId) {
		return tpl.selectOne("shipDao.findByShip", memId);
	}
	
	public List<Ship> consumerList(Integer shipNum){
		return tpl.selectList("shipDao.consumerList", shipNum);
	}
	

	public Integer update(Ship ship) {
		return tpl.update("shipDao.update", ship);
	}

	public Integer delete(Integer shipNum) {
		return tpl.delete("shipDao.delete", shipNum);
	}
	
	public List<Integer> findById(String memId) {
		return tpl.selectList("shipDao.findById", memId);
	}
}
