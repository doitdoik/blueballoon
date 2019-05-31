package com.icia.blueballoon.service;

import java.security.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import javax.mail.*;

import org.apache.commons.lang3.*;
import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.scheduling.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;
import com.icia.blueballoon.util.*;

import lombok.extern.slf4j.*;

@Slf4j
@Service
public class MemberService {
	@Autowired
	private MemberDao mDao;
	@Autowired
	private TempMemberDao tDao;
	@Autowired
	private AuthorityDao aDao;
	@Autowired
	private PasswordEncoder pwdEncoder;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private MailUtil mailUtil;

	public boolean memIdAvailable(String memId) {
		String tempId = tDao.findIdById(memId);
		if (tempId != null)
			throw new AlreadyJoinException();
		return mDao.findIdById(memId) == null;
	}

	public boolean memEmailAvailable(String memEmail) {
		String tempEmail = tDao.findEmailByEmail(memEmail);
		if (tempEmail != null)
			throw new AlreadyJoinException();
		return mDao.findEmailByEmail(memEmail) == null;
	}

	@Transactional(rollbackFor = Exception.class)
	public void insertMember(Member member) {
		member.setMemPwd(pwdEncoder.encode(member.getMemPwd()));
		mDao.insert(member);
		aDao.insert(member.getMemId(), "ROLE_USER");
	}

	// 아이디찾기
	public String findId(String memName, String memEmail) {
		return mDao.findIdByNameAndEmail(memName, memEmail);
	}
	
	// 비밀번호 리셋+
	public String resetPwd(String memId, String memEmail) throws MessagingException {
		// 사용자 존재여부 검색
		mDao.findIdByIdAndEmail(memId, memEmail);
		// 그렇지 않다면 임시 비밀번호를 이메일로 발송
		String memNewPwd = RandomStringUtils.randomAlphanumeric(20);
		// 비밀번호 업데이트
		mDao.updatePwd(memId, pwdEncoder.encode(memNewPwd));
		String text = "<p>임시비밀번호가 발급되었습니다</p>";
		text += "<p>임시 비밀번호 : " + memNewPwd + "</p>";
		text += "<p>사용자 보안을 위해 로그인 후 바로 비밀번호를 변경해주시기 바랍니다</p>";
		text += "로그인 하기 : <a href='http://localhost:8081/blueballoon/member/login'>클릭하세요</a>";
		Mail mail = Mail.builder().sender("webmaster@icia.com").receiver(memEmail).title("비밀번호 재발급 메일입니다").content(text)
				.build();
		mailUtil.sendMail(mail);
		return memEmail;
	}


	// 비밀번호 확인 후 변경
	public int changePwd(String memPwd, String memNewPwd, String memId) {
		// 비밀번호 가져오기
		String encodedPwd = mDao.findPwdById(memId);
		// 비밀번호 업데이트
		return mDao.updatePwd(memId, pwdEncoder.encode(memNewPwd));
	}


	// 내 정보 비밀번호 확인
	public boolean checkPwd(String memId, String memPwd) {
		// 비밀번호 가져오기
		String encodedPwd = mDao.findPwdById(memId);
		return pwdEncoder.matches(memPwd, encodedPwd);
	}

	// 내 정보보기
	public MemberDto.DtoForSelf findById(String memId) {
		Member member = mDao.findById(memId);
		MemberDto.DtoForSelf dto = modelMapper.map(member, MemberDto.DtoForSelf.class);
		dto.setMemId(member.getMemId());
		dto.setMemName(member.getMemName());
		dto.setMemTel(member.getMemTel());
		dto.setMemEmail(member.getMemEmail());
		return dto;
	}

	public boolean memLicenceAvailable(String memLicence) {
		String tempLicence = tDao.findLicenceByLicence(memLicence);
		if (tempLicence != null)
			throw new AlreadyJoinException();
		return mDao.findLicenceByLicence(memLicence) == null;
	}

	// 매일 13시 45분에 모든 임시 유저 삭제
	@Scheduled(cron = "0 45 13 * * *")
	public void delete() {
		tDao.deleteTempUser();
	}

	// 임시 회원 회원가입 처리
	@Transactional(rollbackFor = Exception.class)
	public Member join(String tempId, String authName) {
		TempMember result = tDao.findById(tempId);

		Member member = modelMapper.map(result, Member.class);

		member.setMemId(result.getTempId());
		member.setMemEmail(result.getTempEmail());
		member.setMemPwd(result.getTempPwd());
		member.setMemGender(result.getTempGender());
		member.setMemBirthDate(result.getTempBirthDate());
		member.setMemTel(result.getTempTel());
		// Enabled 추가
		member.setMemEnabled(true);
		member.setMemName(result.getTempName());
		System.out.println(result.getTempName());
		member.setMemBrand(result.getTempBrand());
		System.out.println(result.getTempBrand());
		member.setMemLicence(result.getTempLicence());
		System.out.println(result.getTempLicence());

		// 멤버 추가
		mDao.insert(member);
		// 임시 회원 삭제
		tDao.deleteById(tempId);
		// 권한 추가
		aDao.insert(member.getMemId(), authName);
		return member;
	}

	// 회원 삭제
	public boolean delete(String memId, String authName) {
		// UDAO-12. 회원 삭제
		mDao.delete(memId);
		// AuDAO-2. 권한 삭제
		aDao.delete(memId, authName);
		return true;
	}

	// 결제 리스트
	public List<PaymentDto.DtoForRead> payList(String memId) {
		
		List<Payment1> result = mDao.payList(memId);
		List<PaymentDto.DtoForRead> list = new ArrayList<>();
		// yyyy-MM-dd T hh:mm:ss형식을 -> yyyy-MM-dd hh:mm:ss 으로 바꿔서 출력
		for(Payment1 p: result) {
			PaymentDto.DtoForRead dto =  modelMapper.map(p, PaymentDto.DtoForRead.class);
			LocalDateTime payDate = p.getPayDate();
			dto.setPayDateStr(payDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
			list.add(dto);
		}
		return list;
	}
    
	
	//내가 쓴 글 리스트
	public List<Review> myWriteList1(String memId) {
		return mDao.myWriteList1(memId);
	}
	
	//내가 쓴 글 리스트
	public List<QnaBoard> myWriteList2(String memId) {
		return mDao.myWriteList2(memId);
	}
     
	//내가 쓴 댓글 리스트
	public List<Reply> myReplyList(String memId) {
		return mDao.myReplyList(memId);
	}
	
	
	//내가 즐겨찾기한 명소 리스트
	public List<Favorite> favoriteList(Principal principal) {
		String memId = principal.getName();
		return mDao.favoriteList(memId);
	}
	public Member findByIdForConsumerList(Principal principal) {
		String memId = principal.getName();
		return mDao.findByIdForConsumerList(memId);
	}
}
