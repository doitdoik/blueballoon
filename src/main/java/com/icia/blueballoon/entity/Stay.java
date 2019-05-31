package com.icia.blueballoon.entity;

import java.sql.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Stay {
	private Integer stayNum;
	private Integer accomNum;
	private Date stayDate;
	private Integer stayCanCap;
	private String memId;
}
