package com.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Mesta;
import model.Projekcija;
import model.Rezervacija;

public interface RezervacijaRepository extends JpaRepository<Rezervacija, Integer>{
	
	 
}
