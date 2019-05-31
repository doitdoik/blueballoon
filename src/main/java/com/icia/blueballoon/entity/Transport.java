package com.icia.blueballoon.entity;

import java.sql.*;
import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Transport {
	private Integer transNum;
	private Integer shipNum;
	private Date transDate;
	private Integer transCanCap;
	private String memId;
}
