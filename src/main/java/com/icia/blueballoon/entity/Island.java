package com.icia.blueballoon.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Island {
	private Integer isNum; 
	private String isName;
	private Integer isStar;
	private Integer accomNum;
	private Integer attrNum;
	private Integer transNum;
	private String isInfo;
	private Integer imageNum;
	private Accommodation accommodation;
	private Attraction attraction;
	private Transport transport;
	private Image image;
	
}

