package com.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Projekcija;
import model.Rezervacija;

public interface RezervacijaRepository extends JpaRepository<Rezervacija, Integer> {

	public List<Rezervacija> findByProjekcija(Projekcija pr);
	
}
