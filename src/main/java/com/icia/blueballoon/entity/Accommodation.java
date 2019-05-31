package com.icia.blueballoon.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Accommodation {
	private Integer accomNum;
	private Integer accomMaxCap;
	private String accomAddr;
	private String memBrand;
	private Integer isNum;
	private Integer imageNum;
	private Integer accomWeekPrice;
	private Integer accomWkndPrice;
	private String accomContent;
	private String memId;
	private Member member;
	private Image image;
	private Island island;
	private Star star;
	private Stay stay;
	private Package1 package1;
	private Payment1 payment;
}
