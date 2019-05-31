package com.icia.blueballoon.service;

import java.security.*;
import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;


import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;
import com.icia.blueballoon.util.paging.*;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private ReplyMapper rDao;

	
	public Map<String, Object> list(Integer page) {
		int count = dao.count();
		Pagination p = PagingUtil.getPagination(page, count);
		List<Review> result = dao.list(p.getStartRow(), p.getEndRow());
		List<ReviewDto.DtoForRead> list = new ArrayList<>();
		for(Review q: result) {
			ReviewDto.DtoForRead dto = modelMapper.map(q, ReviewDto.DtoForRead.class);
			LocalDateTime writeDate = q.getRevWriteDate();
			if(LocalDate.from(writeDate).compareTo(LocalDate.now())==0) {
				dto.setRevWriteDateStr(writeDate.format(
						DateTimeFormatter.ofPattern("HH:mm")));
			} else {
				dto.setRevWriteDateStr(writeDate.format(
						DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}
			list.add(dto);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", p);
		map.put("list", list);
		return map;
	}
	
	//글 읽기
	public ReviewDto.DtoForRead detail(Integer revNum,String memId) {
		
		Review result = dao.detail(revNum);
		System.out.println("service1= "+result);
		ReviewDto.DtoForRead detail = modelMapper.map(result, ReviewDto.DtoForRead.class);
		LocalDateTime writeDate = result.getRevWriteDate();
		String writer=dao.findMemIdById(revNum);
		dao.updateRevReadCnt(revNum);
		detail.setRevReadCnt(detail.getRevReadCnt()+1);	
		// 결과가 0이면 같은 날짜
		if(LocalDate.from(writeDate).compareTo(LocalDate.now())==0) {
			detail.setRevWriteDateStr(
					writeDate.format(DateTimeFormatter.ofPattern("HH:mm")));
		} else {
			detail.setRevWriteDateStr(
					writeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		}
		return detail;
	}
	
	public int write(Review review) {
		return dao.write(review);
	}
	
	public int update(Review review) {
		return dao.update(review);
	}
	
	public Integer delete(Integer revNum) {
		return dao.delete(revNum);
	}
	
	//작성자 출력
	 public int insert(String revTitle, String revContent, String memId) {
	      return dao.insert(revTitle, revContent, memId);
	 }
    
	 //글 추천
	public int revGoodReview(Review review, String memId) {
		String writer=dao.findMemIdById(review.getRevNum());
		//자신의 글 추천 막기
		if(writer.equals(memId)) {
			new IllegalAuthorizationException();
		}
		//이미 추천 review 테이블에서 조회
		if(dao.alreadyExist(review.getRevNum(),memId) != null)
			return dao.findRevGoodCntById(review.getRevNum());
		// 글 추천
		dao.updateRevGoodCnt(review.getRevNum());
		return dao.findRevGoodCntById(review.getRevNum());
		
	}
    //댓글 추가
	public List<Reply> insertReply(Reply reply, Principal principal) {
		String memId = principal.getName();
		reply.setReplyDate(LocalDateTime.now());
		reply.setMemId(memId);
	   rDao.insert(reply);
	   //댓글 목록 읽기
	   return rDao.findAllByRevNum(reply.getRevNum());
	}
    
	//댓글 삭제
	public Integer deleteReplyByReplyNum(Integer replyNum) {
		//삭제할 글이 자기 글인지 확인
		//if(!username.equals(cDao.findWriterByCno(cno)))
		//	new IllegalAccessException();
	
		return rDao.deleteByReplyNum(replyNum);
	}
	

}