package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class ImageDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public Integer insert(Image image) {
		return tpl.insert("imageDao.insert", image);
	}

	public int update(Image image) {
		return tpl.update("imageDao.update" , image);
		
	}

}
