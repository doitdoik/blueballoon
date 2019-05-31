package com.icia.blueballoon;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class TempMemberTest {
	@Autowired
	private TempMemberDao dao;
	@Autowired
	private MemberDao mdao;
	
	//@Test
	public void findTempEmailByIdTest() {
		assertThat(dao.findTempEmailById("spring"), is(nullValue()));
	}
	//@Test
	public void find() {
		TempMember result = dao.findById("2");
		System.out.println(result);
	}
	// 임시회원 리스트
	//@Test
	public void findByListTest() {
		List<TempMember> result = dao.findByList();
		System.out.println(result);
	}
	// 일반 회원 리스트 테스트
	@Test
	public void findByListMemberTest() {
		List<Member> result =  mdao.findByMemberList();
		System.out.println(result);
	}
	
	
}
