package com.icia.blueballoon.service;

import java.time.*;
import java.time.format.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.data.dto.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.util.paging.*;

@Service
public class QnaBoardService {
	@Autowired
	private QnaBoardDao dao;
	@Autowired
	private ModelMapper modelMapper;
	
	public Map<String, Object> list(Integer page) {
		int count = dao.count();
		Pagination p = PagingUtil.getPagination(page, count);
		List<QnaBoard> result = dao.list(p.getStartRow(), p.getEndRow());
		List<QnaBoardDto.DtoForRead> list = new ArrayList<>();
		for(QnaBoard q: result) {
			QnaBoardDto.DtoForRead dto = modelMapper.map(q, QnaBoardDto.DtoForRead.class);
			LocalDateTime writeDate = q.getQnaWriteDate();
			if(LocalDate.from(writeDate).compareTo(LocalDate.now())==0) {
				dto.setQnaWriteDateStr(writeDate.format(
						DateTimeFormatter.ofPattern("HH:mm")));
			} else {
				dto.setQnaWriteDateStr(writeDate.format(
						DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}
			list.add(dto);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("pagination", p);
		map.put("list", list);
		return map;
	}
	
	public QnaBoardDto.DtoForRead detail(Integer qnaNum) {
		QnaBoard result = dao.detail(qnaNum);
		QnaBoardDto.DtoForRead detail = modelMapper.map(result, QnaBoardDto.DtoForRead.class);
		LocalDateTime writeDate = result.getQnaWriteDate();
		if(LocalDate.from(writeDate).compareTo(LocalDate.now())==0) {
			detail.setQnaWriteDateStr(
					writeDate.format(DateTimeFormatter.ofPattern("HH:mm")));
		} else {
			detail.setQnaWriteDateStr(
					writeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		}
		return detail;
	}
	
	public int write(QnaBoard qna) {
		return dao.write(qna);
	}
	
	public int update(QnaBoard qna) {
		return dao.update(qna);
	}
	
	public Integer delete(Integer qnaNum) {
		return dao.delete(qnaNum);
	}

	public int insert(String qnaTitle, String qnaContent, String memId) {
		return dao.insert(qnaTitle, qnaContent, memId);
	}

	
}
