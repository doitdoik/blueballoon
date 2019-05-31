package com.icia.blueballoon.data.dto;


import java.time.*;

import org.springframework.format.annotation.*;

import lombok.*;

public class MemberDto {
	public static class DtoForUpdate {
		private String memId;
		private String memName;
		private String memPwd;
		private String memNewPwd;
		private String memTel;
		private String memEmail;
	}
	
	@Data
	public static class DtoForSelf {
		private String memId;
		private String memName;	
		private String memTel;
		private String memEmail;
	}
	
}
