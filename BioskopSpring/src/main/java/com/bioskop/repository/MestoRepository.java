package com.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Mesta;
import model.Projekcija;

public interface MestoRepository extends JpaRepository<Mesta, Integer>{
	//public List<Mesta> findByProjekcija(Projekcija projekcija);
}
