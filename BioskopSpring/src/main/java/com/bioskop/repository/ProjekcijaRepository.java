package com.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import model.Film;
import model.Mesta;
import model.Projekcija;

public interface ProjekcijaRepository extends JpaRepository<Projekcija, Integer> {
	
	@Query("SELECT p FROM Projekcija p WHERE p.datum BETWEEN :startDate AND :endDate ORDER BY p.datum")
	public List<Projekcija> vratiNedeljniRepertoar(@Param("startDate") String startDate, @Param("endDate") String endDate);

	public List<Projekcija> findByFilm(Film film);
	
	@Transactional
	@Modifying
	@Query("UPDATE Projekcija  SET slobodnaMesta=:brMesta WHERE projekcijaID =:id")
	public void updateMesta(@Param("brMesta") Integer mesta, @Param("id") Integer id);
	
	/*@Query("SELECT m FROM Mesta m, Rezervacija r, Projekcija p WHERE r.mestoID = m.mestoID AND p.projekcijaID = r.projekcijaID AND p.projekcijaID =:id")
	public List<Mesta> vratiSvaMestaUProjekciji(@Param("id") Integer id);*/
}