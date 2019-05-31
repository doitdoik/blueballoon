package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class InformationDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int write(Information info) {
		return tpl.insert("InfoDao.write", info);
	}	
	
	public Integer count() {
		return tpl.selectOne("InfoDao.count");
	}
	
	public List<Information> list(Integer startRow, Integer endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return tpl.selectList("InfoDao.list",map);
	}
	
	public int update(Information info) {
		return tpl.update("InfoDao.update", info);
	}
	
	public int findReadCnt(Integer infoNum) {
		return tpl.selectOne("InfoDao.findReadCnt", infoNum);
	}
	
	public int updateReadCnt(Integer infoNum) {
		return tpl.selectOne("InfoDao.updateReadCnt", infoNum);
	}
	
	public Information detail(Integer infoNum) {
		return tpl.selectOne("InfoDao.detail", infoNum);
	}
	
	public Integer delete(Integer infoNum) {
		return tpl.delete("InfoDao.delete", infoNum);
	}
	
}
