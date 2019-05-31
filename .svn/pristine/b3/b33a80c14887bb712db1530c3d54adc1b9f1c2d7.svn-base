package com.icia.blueballoon;

import java.time.*;
import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

import lombok.extern.slf4j.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/*-context.xml")
@Slf4j
public class InfoTest {
	@Autowired
	private InformationDao dao;
	
	@Test
	public void writeTest() {
		Information info = new Information(1,"Title","Content",LocalDateTime.now(), 0);
		int result = dao.write(info);
		log.info("WRITE : {} ", result);
	}
	
	// @Test
	/*public void listTest() {
		List<Information> info = dao.list();
		log.info("LIST : {} ", info);
	}*/
	
	// @Test
	public void updateTest() {
		Information info = new Information(1,"Title1","Content1",LocalDateTime.now(), 0);
		int result = dao.update(info);
		log.info("UPDATE : {} ", info);
	}
	
	// @Test
	public void detail() {
		Information info = dao.detail(1);
		log.info("DETAIL : {} ", info);
	}
	
	// @Test
	public void deleteTest() {
		Integer result = dao.delete(1);
		log.info("DELETE : {} ", result);
	}
}
