package com.icia.blueballoon;

import java.time.*;
import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

import lombok.extern.slf4j.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/*-context.xml")
@Slf4j
public class QnaBoardTest {
	@Autowired
	private QnaBoardDao dao;
	
//	// @Test
//	public void writeTest() {
//		QnaBoard qna = new QnaBoard(1,"Title", "Content", LocalDateTime.now(), 0, "null");
//		int result = dao.write(qna);
//		log.info("WRITE : {} ", result);
//	}
	
	// @Test
	/*public void listTest() {
		List<QnaBoard> qna = dao.list();
		log.info("LIST : {} ", qna);
	}*/
	
//	// @Test
//	public void updateTest() {
//		QnaBoard qna = new QnaBoard(1,"Title1", "Content1", LocalDateTime.now(), 0, "null1");
//		int result = dao.update(qna);
//		log.info("UPDATE : {} ", result);
//	}
	
	// @Test
	public void detailTest() {
		QnaBoard qna = dao.detail(1);
		log.info("DETAIL : {} ", qna);
	}
	
	@Test
	public void deleteTest() {
		Integer result = dao.delete(1);
		log.info("DELETE : {} ", result);
	}
}