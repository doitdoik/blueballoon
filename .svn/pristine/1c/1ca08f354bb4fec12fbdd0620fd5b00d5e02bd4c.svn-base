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
public class AttrTest {
	@Autowired
	private AttrDao dao; 
	@Autowired
	private SqlSessionTemplate tpl;
	@Autowired
	private FavoriteDao faDao;
	
	
	//@Test
	public void initTest() {
		//assertThat(tpl, is(notNullValue()));
		//System.out.println(tpl);
		assertThat(dao, is(notNullValue()));
		System.out.println(dao);
	}
	//글 쓰기 테스트
	//@Test
	/*public void test() {
		Attraction attraction = new Attraction(4,"spring",1,"명소제목","명소내용",1);
		Integer result = dao.insert(attraction);
		System.out.println(result);
		log.info("걀과:{}", result);
	}*/
	// 글 목록 페이징 완
	@Test
	public void findAllTest() {
	List<Attraction> result = dao.findByList(null, null, null);
		System.out.println(result);
		
	}
	// 업데이트 테스트
	///@Test
	public void delete() {
		Integer result = dao.delete(1);
		
		log.info("걀과:{}", result);
		
	}
	//@Test
	public void findByFavo() {
		List<Favorite> result = faDao.findByFavo();
		System.out.println(result);
	}
	

}
