package com.icia.blueballoon.entity;

import lombok.*;

@Data
public class Favorite {
	  private String memId;
	  private Integer attrNum;
	  private Attraction attraction;
	  private Member member;
	}