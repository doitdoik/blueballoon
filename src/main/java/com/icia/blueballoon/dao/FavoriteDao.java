package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class FavoriteDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Integer attrNum, String memId) {
		Map<String,Object> map =new HashMap<>();
		map.put("attrNum", attrNum);
		map.put("memId", memId);
		return tpl.insert("favoriteDao.insert", map);
	}
	
	public int delete(Integer attrNum) {
		return tpl.delete("favoriteDao.delete" , attrNum);
		
	}
	
	public List<Favorite> findByFavo(){
		return tpl.selectList("favoriteDao.findByFavo");
	}
	
	
	
	

}
