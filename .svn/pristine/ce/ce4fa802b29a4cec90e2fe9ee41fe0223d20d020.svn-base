package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.data.dto.ReviewDto.*;
import com.icia.blueballoon.entity.*;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Integer write(Review review) {
		return tpl.insert("ReviewDao.write", review);
	}
	
	public Integer count() {
		return tpl.selectOne("ReviewDao.count");
	}
	
	public List<Review> list(Integer startRow, Integer endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return tpl.selectList("ReviewDao.list", map);
	}
	
	public int update(Review review) {
		return tpl.update("ReviewDao.update", review);
	}
	
	//글 읽기
	public Review detail(Integer revNum) {
		System.out.println("dao= "+revNum);
		return tpl.selectOne("ReviewDao.detail", revNum);
	}
	
	public Integer delete(Integer revNum) {
		return tpl.delete("ReviewDao.delete", revNum);
	}

	
	//글쓴이 
	public int insert(String revTitle, String revContent, String memId) {
		   Map<String, String> map = new HashMap<>();
		      map.put("revTitle", revTitle);
		      map.put("revContent", revContent);
		      map.put("memId", memId);
		      return tpl.insert("ReviewDao.insert",map);

	}
    //조회수증가
	public Integer updateRevReadCnt(Integer revNum) {
		return tpl.update("ReviewDao.updateRevReadCnt",revNum);
	}
    
	//글쓴 사람
	public String findMemIdById(Integer revNum) {
		return tpl.selectOne("ReviewDao.findMemIdById",revNum);
	}
	
     //글 추천하기
	public Integer updateRevGoodCnt(Integer revNum) {
		return tpl.update("ReviewDao.updateRevGoodCnt", revNum);
		
	}

	public int findRevGoodCntById(Integer revNum) {
		
		return tpl.update("ReviewDao.findRevGoodCntById", revNum);
	}

	public String alreadyExist(Integer revNum, String memId) {
		Map<String, Object> map = new HashMap<>();
		map.put("revNum", revNum);
		map.put("memId", memId);
		return tpl.selectOne("ReviewDao.alreadyExist", map);
	}
     
	public Integer readRevReadCnt(Integer revNum) {
		return tpl.selectOne("ReviewDao.readRevReadCnt", revNum);
	}

}