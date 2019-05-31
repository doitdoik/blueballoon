package com.icia.blueballoon;

import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.util.paging.*;

import lombok.extern.slf4j.*;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class PageUtilTest {
	private PackageDao dao;
	//@Test
	public void deoTest() {
		int cnt = 134;
		for(int pageNo=1; pageNo<=21; pageNo++) {
			System.out.println(PagingUtil.getPagination(pageNo, cnt));
		}
	}
	
}
