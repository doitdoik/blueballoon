package com.icia.blueballoon;

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
public class ShipTest {
	@Autowired
	private ShipDao dao;
	
	//@Test
	public void consumerListTest() {
		List<Ship> result = dao.consumerList(10);
		log.info("################### LIST: {}", result);
	}
	
	@Test
	public void findById() {
		List<Integer> result = dao.findById("shiptest");
		log.info("################### LIST: {}", result);
		log.info("################### LIST: {}", result.size());
	}
	
}
