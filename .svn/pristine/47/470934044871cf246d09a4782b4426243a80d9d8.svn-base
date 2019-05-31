package com.icia.blueballoon;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

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




@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/**/*-context.xml")
public class islandDaotest {
	@Autowired
	private IslandDao dao; 
	@Autowired
	private SqlSessionTemplate tpl;
	
	
	
	//@Test
	public void initTest() {
		assertThat(tpl, is(notNullValue()));
		System.out.println(tpl);
		assertThat(dao, is(notNullValue()));

	}
	
	// 글 쓰기 테스트
	/*@Test
	public void test() {
		// 섬번호(PK) , 섬이름 , 별점 , 숙박번호 , 명소번호 , 배번호 , 섬정보  
		Island island = new Island(123, "섬이름" ,1 , 1 ,1, 1 , "섬정보", 1);
		Integer result = dao.insert(island);
		System.out.println(result);
		log.info("걀과:{}", result);
	}*/
	// 글 읽기 테스트
	@Test
	public void readTest() {
		Island result = dao.detail(5);
		log.info("걀과:{}", result);
		System.out.println(result);
		
	}
	// 글 리스트 
	//@Test
	public void findAllTest() {
		List<Island> result = dao.findAll(1, 5);
		System.out.println(result);
	}

}
