package com.icia.blueballoon.data.dto;

import lombok.*;

@Data
@Builder
public class Mail {
	private String sender;
	private String receiver;
	private String title;
	private String content;
}
