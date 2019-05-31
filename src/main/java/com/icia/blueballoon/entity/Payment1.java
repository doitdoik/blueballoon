package com.icia.blueballoon.entity;

import java.time.*;

import org.springframework.format.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment1 {
	private Integer payNum;
	private Integer pkgNum;
	private String memId;
	private Integer payTotal;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDateTime payDate;
	private Boolean payState;
	private Integer payPeopleCnt;
	private Package1 package1;
	private Accommodation accommodation;
	private Ship ship;
	private Transport transport;
	private Stay stay;
}
