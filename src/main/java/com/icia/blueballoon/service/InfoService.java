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
public class InfoService {
	@Autowired
	private InformationDao dao;
	@Autowired
	private ModelMapper modelMapper;
	
	public Map<String, Object> list(Integer page) {
		int count = dao.count();
		Pagination p = PagingUtil.getPagination(page, count);
		List<Information> result = dao.list(p.getStartRow(), p.getEndRow());
		List<InformationDto.DtoForRead> list = new ArrayList<>();
		for(Information i: result){
			InformationDto.DtoForRead dto = modelMapper.map(i, InformationDto.DtoForRead.class);
			LocalDateTime writeDate = i.getInfoWriteDate();
			// 결과가 0이면 같은 날짜
			if(LocalDate.from(writeDate).compareTo(LocalDate.now())==0) {
				dto.setInfoWriteDateStr(
						writeDate.format(DateTimeFormatter.ofPattern("HH:mm")));
			} else {
				dto.setInfoWriteDateStr(
						writeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}
			list.add(dto);
		}
		Map<String,Object> map = new HashMap<>();
		map.put("pagination", p);
		map.put("list", list);
		return map;
	}

	public InformationDto.DtoForRead detail(Integer infoNum) {
		Information result = dao.detail(infoNum);
		InformationDto.DtoForRead detail = modelMapper.map(result, InformationDto.DtoForRead.class);
		LocalDateTime writeDate = result.getInfoWriteDate();
		// 결과가 0이면 같은 날짜
		if(LocalDate.from(writeDate).compareTo(LocalDate.now())==0) {
			detail.setInfoWriteDateStr(
					writeDate.format(DateTimeFormatter.ofPattern("HH:mm:ss")));
		} else {
			detail.setInfoWriteDateStr(
					writeDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		}
		return detail;
	}

	public int write(Information info) {
		return dao.write(info);
		
	}

	public int update(Information info) {
		return dao.update(info);
	}

	public Integer delete(Integer infoNum) {
		return dao.delete(infoNum);
	}
}
