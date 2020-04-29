package com.bioskop.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import model.Korisnik;

public class MyUserDetails implements UserDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Korisnik k;
	
	public MyUserDetails(Korisnik k) {
		super();
		this.k = k;
	}
	
	public Korisnik getKorisnik() {
		return k;
	}

	public void setKorisnik(Korisnik k) {
		this.k = k;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		Collection<SimpleGrantedAuthority> auth = new ArrayList<SimpleGrantedAuthority>();
		auth.add(new SimpleGrantedAuthority("ROLE_" + k.getUloga().getImeUloge()));
		return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return k.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return k.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
