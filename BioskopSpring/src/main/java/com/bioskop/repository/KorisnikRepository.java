package com.bioskop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Korisnik;

public interface KorisnikRepository  extends JpaRepository<Korisnik, Integer>{

	Korisnik findByUsername(String username);
	
	Korisnik findByEmail(String email);
	
	Korisnik findByUsernameAndPassword(String username, String password);

}
