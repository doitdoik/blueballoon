package com.icia.blueballoon.service;

import java.security.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.http.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;
import com.icia.blueballoon.util.paging.*;

@Service
public class AccommodationService {
	@Autowired
	private AccommodationDao dao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private StayDao sDao;
	
	public List<Accommodation> noPagingList(){
		return dao.noPagingList();
	}
	
	public Map<String, Object> accomList(Integer pageNo, Integer isNum) {
		// 글개수 읽기
		Pagination pagination = AccomPagingUtil.getPagination(pageNo, dao.count());
		// 페이징 
		List<Accommodation> list = dao.accomList(pagination.getStartRow(), pagination.getEndRow() , isNum);
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", pagination);
		map.put("list", list);
		System.out.println("paging=" + pageNo+ "service");
		return map;

	}
	
	public Accommodation detail(Integer accomNum) {
		return dao.detail(accomNum);
	}
	
	public Integer write(Accommodation accom, Principal principal) {
		String memId = principal.getName();
		accom.setMemId(memId);
		List<Integer> cnt = dao.findById(memId);
		if(cnt.size()>=1) {
			throw new AlreadyWriteException();
		}
		return dao.write(accom);
	}
	
	
	public AccomDto.AccomTest findByAccom(String memId){

		Member member = dao.findByAccom(memId);
		
		AccomDto.AccomTest dto = modelMapper.map(member, AccomDto.AccomTest.class);
		dto.setMemBrand(member.getMemBrand());
		dto.setMemTel(member.getMemTel());
		return dto;
	}
	
	public Integer delete(Integer accomnum) {
		return dao.delete(accomnum);
	}
	
	//구매자 목록
	public List<Payment1> consumerList(Integer accomNum){
		return dao.consumerList(accomNum);
	}	
	
	public Integer update(Accommodation accom) {
		return dao.update(accom);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public void insertForMyPackage(Integer cnt, HttpSession session,Stay stay
			, Principal principal,Integer accomNum, String stayDate,Integer isNum) {
		Date newStayDate = Date.valueOf(stayDate);
		stay.setMemId(principal.getName());
		stay.setAccomNum(accomNum);
		stay.setStayCanCap(cnt);
		stay.setStayDate(newStayDate);
		if(session.getAttribute("newUser")==null) {
			sDao.writeForMyPackage(stay);
		}else {
			Stay beforeStay = new Stay();
			beforeStay.setStayNum((Integer)session.getAttribute("stayNum"));
			beforeStay.setStayCanCap((Integer)session.getAttribute("cnt"));
			beforeStay.setAccomNum((Integer)session.getAttribute("accomNum"));
			sDao.returnStayCanCap(beforeStay);
			sDao.updateStayCanCap(beforeStay);
			stay.setStayNum((Integer)session.getAttribute("stayNum"));
			sDao.updateStayCanCap(stay);
			sDao.updateStay(stay);
		}
		session.setAttribute("cnt", cnt);
		session.setAttribute("departure", newStayDate);
		session.setAttribute("stayNum", stay.getStayNum());
		session.setAttribute("accomNum", stay.getAccomNum());
		session.setAttribute("newUser", "new");
		session.setAttribute("isNum", isNum);
	}
}
