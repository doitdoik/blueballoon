package com.icia.blueballoon.entity;

import java.time.*;
import java.util.*;

import lombok.*;
import oracle.sql.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaBoard {
	private Integer qnaNum;
	private String qnaTitle;
	private String qnaContent;
	private LocalDateTime qnaWriteDate;
	private Integer replyNum;
	private String memId;
	private Integer replyCnt;
	private List<Reply> reply;
}
