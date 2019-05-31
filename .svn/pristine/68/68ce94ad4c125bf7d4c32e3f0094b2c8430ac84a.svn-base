package com.icia.blueballoon.entity;

import java.util.*;

import org.springframework.security.core.*;
import org.springframework.security.core.userdetails.*;

import lombok.*;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@ToString
public class Account implements UserDetails{
	private String memId;
	private String memPwd;
	private Boolean memEnabled;
	@Getter
	private Collection<GrantedAuthority> authorities;
	@Override
	public String getPassword() {
		return memPwd;
	}
	@Override
	public String getUsername() {
		return memId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return memEnabled;
	}
	
	
}
