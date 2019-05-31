package com.icia.blueballoon.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Ship {
	private Integer shipNum;
	private String memBrand;
	private String shipName;
	private Integer shipMaxCap;
	private Integer isNum;
	private String memId;
	private Integer shipWeekPrice;
	private Integer shipWkndPrice;
	private String shipContent;
	private String shipDeparture;
	private Integer imageNum;
	private String shipAddr;
	private Member member;
	private Image image;
	private Island island;
	private Transport transport;
	private Package1 package1;
	private Payment1 payment;
	
}
