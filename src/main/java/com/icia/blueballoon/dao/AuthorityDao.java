package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class AuthorityDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	// 권한추가, 서비스에서 넘어온 값 2개 이상 -> Map
	public void insert(String memId, String authName) {
		Map<String, String> map = new HashMap<>();
		map.put("memId", memId);
		map.put("authName", authName);
		tpl.insert("AuthorityDao.insert", map);
	}
	
	// 권한삭제.
	public void delete(String memId,String authName) {
		Map<String, String> map = new HashMap<>();
		map.put("memId", memId);
		map.put("authName", authName);
		tpl.insert("AuthorityDao.delete", map);
	}
	
}
