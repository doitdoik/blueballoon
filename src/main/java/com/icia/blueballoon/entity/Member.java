package com.icia.blueballoon.entity;

import java.time.*;

import org.springframework.format.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String memId;
	private String memEmail;
	private String memPwd;
	private Integer memGender;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate memBirthDate;
	private String memTel;
	private Boolean memEnabled;
	private String memName;
	private String memBrand;
	private String memLicence;
	private Accommodation accom;
	private Ship ship;
}
