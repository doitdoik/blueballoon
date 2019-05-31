package com.icia.blueballoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.core.authority.*;
import org.springframework.security.core.userdetails.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;

public class AccountDetailsService implements UserDetailsService{
	@Autowired
	private AccountMapper dao;
	
	@Override
	public UserDetails loadUserByUsername(String memId) throws UsernameNotFoundException {
		Account account = dao.findById(memId);
		account.setAuthorities(getAuthorities(memId));
		return account;
	}

	private Collection<GrantedAuthority> getAuthorities(String memId) {
		List<String> string_authorities = dao.findAuthorityById(memId);
		List<GrantedAuthority> authorities = new ArrayList<>();
		for(String authority:string_authorities)
			authorities.add(new SimpleGrantedAuthority(authority));
		return authorities;
	}
}
