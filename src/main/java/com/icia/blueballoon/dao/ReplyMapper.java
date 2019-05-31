package com.icia.blueballoon.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;
import com.icia.blueballoon.entity.*;


@Mapper
public interface ReplyMapper {
	@Delete("delete from reply where rev_num=#{revNum}")
	public void deleteByRevNum(Integer revNum);
	
	
	@Insert("insert into reply(reply_number,reply_date,reply_content,reply_mem_id,mem_brand,qna_num,rev_num) values (reply_seq.nextval, sysdate, #{replyContent}, #{memId}, #{memBrand}, #{qnaNum},#{revNum})")
	public Integer insert(Reply reply);
	
	@Select("select reply_number replyNum,reply_date replyDate,reply_content replyContent,reply_mem_id memId,mem_brand memBrand,qna_num qnaNum,rev_num revNum from reply where rev_num=#{revNum}")
	public List<Reply> findAllByRevNum(Integer revNum);
	
	@Select("select reply_mem_id memId from reply where reply_number=#{replyNum} and rownum=1")
	public String findWriterByReplyNum(Integer replyNum);
	
	@Delete("delete from reply where reply_number=#{replyNum} and rownum=1")
	public Integer deleteByReplyNum(Integer replyNum);
}
