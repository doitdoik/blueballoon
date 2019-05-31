package com.icia.blueballoon.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;
import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.userdetails.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import com.icia.blueballoon.entity.*;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public String findIdById(String memId) {
		return tpl.selectOne("MemberDao.findIdById", memId);
	}

	public String findEmailByEmail(String memEmail) {
		return tpl.selectOne("MemberDao.findEmailByEmail", memEmail);
	}

	public String findLicenceByLicence(String memLicence) {
		return tpl.selectOne("MemberDao.findLicenceByLicence", memLicence);
	}

	public int insert(Member memId) {
		return tpl.insert("MemberDao.insert", memId);
	}

	// 아이디찾기
	public String findIdByNameAndEmail(String memName, String memEmail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memName", memName);
		map.put("memEmail", memEmail);
		return tpl.selectOne("MemberDao.findIdByNameAndEmail", map);
	}

	// 비밀번호 리셋
	public String findIdByIdAndEmail(String memId, String memEmail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("memEmail", memEmail);
		return tpl.selectOne("MemberDao.findIdByIdAndEmail", map);
	}

	// 내 정보 보기
	public Member findById(String memId) {
		return tpl.selectOne("MemberDao.findById", memId);
	}

	// 회원 정보
	public List<Member> findByMemberList() {
		return tpl.selectList("MemberDao.findByList");
	}

	// 회원 정보 페이징
	public List<Member> findByMemberList(Integer startRowNum, Integer endRowNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);

		return tpl.selectList("MemberDao.findByList", map);

	}

	// 회원수
	public Integer count() {
		return tpl.selectOne("MemberDao.count");
	}

	// 회원 블락
	public Integer userBlock(String memId) {
		return tpl.update("MemberDao.userBlock", memId);

	}
	// 회원 블락 해제

	public Integer userCancel(String memId) {
		return tpl.update("MemberDao.userCancel", memId);
	}

	// 비밀번호 가져오기
	public String findPwdById(String memId) {
		return tpl.selectOne("MemberDao.findPwdById", memId);
	}

	// 비밀번호 변경
	public int updatePwd(String memId, String memPwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("memPwd", memPwd);
		return tpl.update("MemberDao.updatePwd", map);
	}

	// 회원 삭제
	public int delete(String memId) {
		return tpl.delete("MemberDao.delete", memId);
	}

	// 결제 리스트
	public List<Payment1> payList(String memId) {
		return tpl.selectList("MemberDao.payList", memId);
	}

	// 내가 review에 쓴 글 리스트
	public List<Review> myWriteList1(String memId) {
		return tpl.selectList("MemberDao.myWriteList1", memId);
	}

	// 내가 qna에 쓴 글 리스트
	public List<QnaBoard> myWriteList2(String memId) {
		return tpl.selectList("MemberDao.myWriteList2", memId);
	}

	// 내가 쓴 댓글 리스트
	public List<Reply> myReplyList(String memId) {
		return tpl.selectList("MemberDao.myReplyList", memId);
	}

	// 업체정보 보기
	public Member findCInfoById(String memId) {
		System.out.println(memId);
		return tpl.selectOne("MemberDao.findCInfoById", memId);
	}

	// 내가 즐겨찾기한 글 리스트
	
	public List<Favorite> favoriteList(String memId) {
		return tpl.selectList("MemberDao.favoriteList", memId);
	}
	public Member findByIdForConsumerList(String memId) {
		return tpl.selectOne("MemberDao.findByIdForConsumerList", memId);
	}
}
