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

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class PaymentTest {
	@Autowired
	private PaymentDao dao;
	
	@Test
	public void listTest() {
		List<Payment1> list = dao.list("package");
		log.info("LIST: {}",list);
	}
}
