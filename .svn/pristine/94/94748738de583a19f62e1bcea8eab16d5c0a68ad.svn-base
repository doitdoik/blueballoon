package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class QnaBoardDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Integer write(QnaBoard qna) {
		return tpl.insert("QnaBoardDao.write", qna);
	}
	
	public Integer count() {
		return tpl.selectOne("QnaBoardDao.count");
	}
	
	public List<QnaBoard> list(Integer startRow, Integer endRow) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return tpl.selectList("QnaBoardDao.list", map);
	}
	
	public int update(QnaBoard qna) {
		return tpl.update("QnaBoardDao.update", qna);
	}
	
	public QnaBoard detail(Integer qnaNum) {
		return tpl.selectOne("QnaBoardDao.detail", qnaNum);
	}
	
	public Integer delete(Integer qnaNum) {
		return tpl.delete("QnaBoardDao.delete", qnaNum);
	}

	public int insert(String qnaTitle, String qnaContent, String memId) {
		Map<String, String> map = new HashMap<>();
		map.put("qnaTitle", qnaTitle);
		map.put("qnaContent", qnaContent);
		map.put("memId", memId);
		return tpl.insert("QnaBoardDao.insert",map);
	}
}
