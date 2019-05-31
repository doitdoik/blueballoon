package com.icia.blueballoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.util.paging.*;

import lombok.extern.slf4j.*;

@Service
@Slf4j
public class PackageService {
	@Autowired
	private PackageDao dao;
	
	public Map<String,Object> list(Integer pageNo){
		int count = dao.count();
		Pagination p = PackagePagingUtil.getPagination(pageNo, count);
		List<Package1> list = dao.list(p.getStartRow(), p.getEndRow());
		Map<String,Object> map = new HashMap<>();
		map.put("pagination", p);
		map.put("list", list);
		return map;
	}
	
	public Package1 detail(Integer pkgNum, Integer accomNum, Integer shipNum) {
		return dao.detail(pkgNum,accomNum,shipNum);
	}
	
	public Integer write(Package1 package1) {
		return dao.write(package1);
	}
	
	public Integer update(Package1 package1) {
		return dao.update(package1);
	}
	
	public Integer delete(Integer pkgNum) {
		return dao.delete(pkgNum);
	}
	
	public int count() {
		return dao.count();
	}
	
	public Package1 myPackageStayList(String memId){
		return dao.myPackageStayList(memId);
	}
	
	public Package1 myPackageTransList(String memId){
		return dao.myPackageTransList(memId);
	}
	
	public Integer writeForMyPackage(Package1 package1) {
		return dao.writeForMyPackage(package1);
	}
	
	public Package1 myPackageInfo(String memId,Integer pkgNum) {
		return dao.myPackageInfo(memId, pkgNum);
	}
}
