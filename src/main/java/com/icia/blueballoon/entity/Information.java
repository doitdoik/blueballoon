package com.icia.blueballoon.entity;

import java.time.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Information {
	private Integer infoNum;
	private String infoTitle;
	private String infoContent;
	private LocalDateTime infoWriteDate;
	private Integer imageNum;
}
