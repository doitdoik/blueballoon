package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

import lombok.extern.slf4j.*;

@Repository
@Slf4j
public class PackageDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public List<Package1> list(Integer startRow, Integer endRow){
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return tpl.selectList("pkgDao.list", map);
	}
	
	public Package1 detail(Integer pkgNum,Integer accomNum, Integer shipNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("pkgNum", pkgNum);
		map.put("accomNum", accomNum);
		map.put("shipNum", shipNum);
		return tpl.selectOne("pkgDao.detail", map);
	}
	
	public Integer write(Package1 package1) {
		return tpl.insert("pkgDao.write", package1);
	}
	
	public Integer update(Package1 package1) {
		return tpl.update("pkgDao.update", package1);
	}
	
	public Integer delete(Integer pkgNum) {
		return tpl.delete("pkgDao.delete", pkgNum);
	}
	
	public int count() {
		return tpl.selectOne("pkgDao.count");
	}
	
	public Package1 myPackageStayList(String memId){
		return tpl.selectOne("pkgDao.myPackageStayList", memId);
	}
	
	public Package1 myPackageTransList(String memId){
		return tpl.selectOne("pkgDao.myPackageTransList", memId);
	}
	
	public Integer writeForMyPackage(Package1 package1) {
		return tpl.insert("pkgDao.writeForMyPackage", package1);
	}
	
	public Package1 myPackageInfo(String memId,Integer pkgNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("pkgNum", pkgNum);
		return tpl.selectOne("pkgDao.myPackageInfo", map);
	}
	
}
