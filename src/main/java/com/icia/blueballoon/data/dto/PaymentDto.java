package com.icia.blueballoon.data.dto;

import com.icia.blueballoon.entity.*;

import lombok.*;

public class PaymentDto {
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DtoForRead{
		private Integer payNum;
		private Integer pkgNum;
		private String memId;
		private Integer payTotal;
		private String payDateStr;
		private Boolean payState;
		private Integer payPeopleCnt;
		private Package1 package1;
		private Accommodation accommodation;
		private Ship ship;
		private Transport transport;
		private Stay stay;
	}
}
