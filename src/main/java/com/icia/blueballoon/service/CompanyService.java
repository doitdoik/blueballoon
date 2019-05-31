package com.icia.blueballoon.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.google.gson.*;
import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;

@Service
public class CompanyService {
	 @Autowired
	    private MemberDao mDao;
	    @Autowired
	    private TempMemberDao tDao;
	    @Autowired
	    private PasswordEncoder pwdEncoder;
		
	    @Transactional(rollbackFor=Exception.class)
		public void insertTempMember(TempMember tempMember) {
	    	tempMember.setTempPwd(pwdEncoder.encode(tempMember.getTempPwd()));
			tDao.insert(tempMember);
		}
		
		public boolean tempIdAvailable(String memId) {
			String tempId = tDao.findIdById(memId);
			if(tempId!=null)
				throw new AlreadyJoinException();
			return mDao.findIdById(memId)==null;
		}

		public Object tempEmailAvailable(String memEmail) {
			String tempEmail = tDao.findEmailByEmail(memEmail);
			if(tempEmail!=null)
				throw new AlreadyJoinException();
			return mDao.findEmailByEmail(memEmail)==null;
		}
		
		public Object tempLicenceAvailable(String memLicence) {
			String tempLicence = tDao.findLicenceByLicence(memLicence);
			if(tempLicence!=null)
				throw new AlreadyJoinException();
			return mDao.findLicenceByLicence(memLicence)==null;
		}

		//업체정보 보기(DTO없이 만들었음)
				public Member findCInfoById(String memId) {
					Member member = mDao.findCInfoById(memId);
					member.setMemId(member.getMemId());
					member.setMemName(member.getMemName());
					member.setMemTel(member.getMemTel());
					member.setMemEmail(member.getMemEmail());
					System.out.println(member.getMemBrand());
					member.setMemBrand(member.getMemBrand());
					System.out.println(member.getMemBrand());
					return member;
				}
		
}
