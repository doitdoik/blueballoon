package com.icia.blueballoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.util.paging.*;

@Service
public class AdminService {
	@Autowired
	private TempMemberDao tempDao;
	@Autowired
	private InformationDao inDao;
	@Autowired
	private MemberDao memDao;
	@Autowired
	private AttrDao attrDao;
	@Autowired
	private PackageDao packageDao;
	
	// 임시 회원 리스트 
	public Map<String, Object> findpermitCompanyList() {
		List<TempMember> list = tempDao.findByList();
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		return map;
		
	}

	
	// 일반 유저 리스트 
	public Map<String, Object> userList(Integer pageNo) {
		// 글개수 읽기
		Pagination pagination = PagingUtil.getPagination(pageNo, memDao.count());
		List<Member> list = null;
		// 페이징 
		list = memDao.findByMemberList(pagination.getStartRow(), pagination.getEndRow());
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;

	}
	// 회원 블락
	public Integer userBlock(String memId) {
		return memDao.userBlock(memId);
	}
	// 회원 블락 해제 
	public Integer userCancel(String memId) {
		return memDao.userCancel(memId);
	}
	
	
	// 명소 리스트 
	
	public Map<String, Object> attrList(Integer pageNo ,Integer isNum) {
			// 글 개수 읽기
			Pagination pagination = PagingUtil.getPagination(pageNo , attrDao.count());
			List<Attraction> list = null;
			// 페이징
			list = attrDao.findByList(pagination.getStartRow(), pagination.getEndRow() , isNum);
			Map<String, Object> map = new HashMap<>();
			map.put("pagination" , pagination);
			map.put("list", list);
			return map;
			
		}
	// 명소 글 삭제
	public Integer attrDeleteBoard(Integer attrNum) {
		
		return attrDao.delete(attrNum);
	}
	

	
	// 공지 리스트 
	
	public Map<String, Object> infoList(Integer pageNo) {
		// 글 개수 읽기
		Pagination pagination = PagingUtil.getPagination(pageNo , inDao.count());
		List<Information> list = null;
		
		list = inDao.list(pagination.getStartRow(), pagination.getEndRow());
		Map<String, Object> map = new HashMap<>();
		map.put("pagination" , pagination);
		map.put("list", list);
		return map;
		
	}
	
	// 공지 글 삭제 
	public Integer deleteBoard(Integer infoNum) {
		return inDao.delete(infoNum);
	}





}
