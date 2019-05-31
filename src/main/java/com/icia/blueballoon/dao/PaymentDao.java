package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;

@Repository
public class PaymentDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Integer write(Payment1 payment) {
		return tpl.insert("payDao.write", payment);
	}
	
	public List<Payment1> list(String memId){
		return tpl.selectList("payDao.list", memId);
	}
	
	public Payment1 newPayInfo(String memId) {
		return tpl.selectOne("payDao.newPayInfo", memId);
	}
}
