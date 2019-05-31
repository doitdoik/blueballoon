package com.icia.blueballoon.data.dto;

import lombok.*;

public class InformationDto {
	
	@Data
	public static class DtoForRead {
		private Integer infoNum;
		private String infoTitle;
		private String infoContent;
		private String infoWriteDateStr;
		private Integer imageNum;
	}
}
