package com.icia.blueballoon;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

import lombok.extern.slf4j.*;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class TransportTest {
	@Autowired
	private TransportDao dao;
	
	@Test
	public void updateTransCanCapTest() {
		Transport trans = new Transport();
		trans.setShipNum(47);
		trans.setTransCanCap(10);
		trans.setTransNum(143);
		log.info("{}",dao.updateTransCanCap(trans));
	}
	
}
