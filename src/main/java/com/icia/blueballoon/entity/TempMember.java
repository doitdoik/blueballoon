package com.icia.blueballoon.entity;

import java.time.*;

import org.springframework.format.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TempMember {
	private String tempId;
	private String tempEmail;
	private String tempPwd;
	private Integer tempGender;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate tempBirthDate;
	private String tempTel;
	private String tempName;
	private String tempBrand;
	private String tempLicence;
}
