package com.icia.blueballoon;

import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.blueballoon.dao.*;
import lombok.extern.slf4j.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/**/*-context.xml")
@Slf4j
public class PackageTest {
	@Autowired
	private PackageDao dao;
	
	//@Test
	/*public void writeTest() {
		Package1 pkg = new Package1("1","1","1","test");
		Integer result = dao.write(pkg);
		log.info("WRITE : {}",result);
	}*/
	//@Test
	/*public void listTest() {
		List<Package1> pkg = dao.list();
		log.info("LIST: {}",pkg);
	}*/
	//@Test
	/*public void detailTest() {
		Package1 pkg = dao.detail(1);
		log.info("DETAIL: {}",pkg);
	}*/
	//@Test
	/*public void updateTest() {
		Package1 pkg = new Package1("1","1","1","변경");
		Integer result = dao.update(pkg);
		log.info("UPDATE: {}",pkg);
	}*/
	//@Test
	public void deleteTest() {
		Integer result = dao.delete(1);
		log.info("DELETE: {}",result);
	}
}
