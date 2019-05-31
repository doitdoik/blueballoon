package com.icia.blueballoon.dao;



import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class StarDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Star detail(Integer accomNum) {
		return tpl.selectOne("starDao.detail", accomNum);
	}
	
	public Integer insert(Star star) {
		return tpl.insert("starDao.insert",star);
	}
	
	public Integer insertForRead(Integer accomNum) {
		return tpl.insert("starDao.insertForRead", accomNum);
	}

	public Integer delete() {
		return tpl.delete("starDao.delete");
	}
}
