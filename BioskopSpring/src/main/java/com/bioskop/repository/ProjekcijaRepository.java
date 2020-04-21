package com.bioskop.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Projekcija;

public interface ProjekcijaRepository extends JpaRepository<Projekcija, Integer> {
	
	@Query("SELECT p FROM Projekcija p WHERE p.datum BETWEEN :startDate AND :endDate ORDER BY p.datum")
	public List<Projekcija> vratiNedeljniRepertoar(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

}
