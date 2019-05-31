package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class StayDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Integer write(Stay stay) {
		return tpl.insert("stayDao.write", stay);
	}
	
	public Stay detail(String stayNum) {
		return tpl.selectOne("stayDao.detail", stayNum);
	}
	
	public List<Stay> list() {
		return tpl.selectList("stayDao.list");
	}
	
	public int updateStayCanCap(Stay stay) {
		return tpl.update("stayDao.updateStayCanCap", stay);
		
	}
	
	public Integer writeForPackage(Stay stay) {
		return tpl.insert("stayDao.writeForPackage", stay);
	}
	
	public Integer writeForMyPackage(Stay stay) {
		return tpl.insert("stayDao.writeForMyPackage", stay);
	}
	
	public int updateStay(Stay stay) {
		return tpl.update("stayDao.updateStay", stay);	
	}
	
	public int updateStayCanCapAndDate(Stay stay) {
		return tpl.update("stayDao.updateStayCanCapAndDate", stay);	
	}
	
	public int returnStayCanCap(Stay stay) {
		return tpl.update("stayDao.returnStayCanCap", stay);
		
	}
}
