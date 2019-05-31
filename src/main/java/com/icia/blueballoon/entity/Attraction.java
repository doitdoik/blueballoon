package com.icia.blueballoon.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Attraction {
	private Integer attrNum;
	private String memId;
	private Integer attrReadCnt;
	private String attrTitle;
	private String attrContent;
	private Integer imageNum; 
	private Integer attrIsFavorite;
	private Integer isNum;
	private Member member;
	private Image image;
	private Island island;
	private Favorite favorite;
}
