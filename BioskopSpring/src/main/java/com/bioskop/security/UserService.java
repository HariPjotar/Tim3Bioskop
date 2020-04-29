package com.bioskop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bioskop.repository.KorisnikRepository;

import model.Korisnik;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	KorisnikRepository kr;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Korisnik kor = kr.findByUsername(username);
		if (kor == null) 
			throw new UsernameNotFoundException(username);
		UserDetails userDetails = new MyUserDetails(kor);
		
		return userDetails;
	}
	
	 public Korisnik getUserFromSession() {
	      SecurityContext context = SecurityContextHolder.getContext();
	      Authentication authentication = context.getAuthentication();
	      Object principal = authentication.getPrincipal();
	      if (principal instanceof MyUserDetails) {
	    	  MyUserDetails userDetails = (MyUserDetails) principal;
	          return userDetails.getKorisnik();
	      }
	      return null;
	  }

}
