package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class TransportDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Integer write(Transport trans) {
		return tpl.insert("transDao.write", trans);
	}
	
	public Transport detail(String transNum) {
		return tpl.selectOne("transDao.detail", transNum);
	}
	
	public List<Transport> list() {
		return tpl.selectList("transDao.list");
	}
	
	public Integer updateTransCanCap(Transport trans) {
		return tpl.update("transDao.updateTransCanCap", trans);
	}
	
	public Integer writeForPackage(Transport trans) {
		return tpl.insert("transDao.writeForPackage", trans);
	}
	
	public Integer writeForMyPackage(Transport trans) {
		return tpl.insert("transDao.writeForMyPackage", trans);
	}
	
	public Integer updateTransCanCapAndDate(Transport trans) {
		return tpl.update("transDao.updateTransCanCapAndDate", trans);
	}

}
