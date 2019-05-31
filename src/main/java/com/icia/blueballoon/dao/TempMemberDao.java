package com.icia.blueballoon.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.entity.*;

@Repository
public class TempMemberDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public String findTempEmailById(String member) {
		return tpl.selectOne("TempMemberDao.findTempEmailById", member);
	}
	
	public int insert(TempMember tempMember) {
		return tpl.insert("TempMemberDao.insert", tempMember);
	}
	
	// Id 로 임시 회원 정보 읽어오기  테스트 완
	public TempMember findById(String tempId) {
		return tpl.selectOne("TempMemberDao.findById" , tempId);
	}
	// 임시 회원 정보 리스트 출력 테스트 완 
	public List<TempMember> findByList(){
		return tpl.selectList("TempMemberDao.findByList");
		
	}
	// 임시 회원 삭제
	public void deleteTempUser() {
		 tpl.selectOne("TempMemberDao.delete");
	}
	// 아이디로 찾아 임시 회원 삭제 
	public int deleteById(String tempId) {
		return tpl.delete("TempMemberDao.deleteById" , tempId);
	}
	
	public String findIdById(String tempId) {
		return tpl.selectOne("TempMemberDao.findIdById", tempId);
				
	}
	
	public String findEmailByEmail(String tempEmail) {
		return tpl.selectOne("TempMemberDao.findEmailByEmail",tempEmail);
	}
	
	public String findLicenceByLicence(String tempLicence) {
		return tpl.selectOne("TempMemberDao.findLicenceByLicence",tempLicence);
	}	
	
}
