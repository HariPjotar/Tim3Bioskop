package com.bioskop.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Film;
import model.Projekcija;

public interface ProjekcijaRepository extends JpaRepository<Projekcija, Integer> {
	
	@Query("SELECT p FROM Projekcija p WHERE p.datum BETWEEN :startDate AND :endDate ORDER BY p.datum")
	public List<Projekcija> vratiNedeljniRepertoar(@Param("startDate") String startDate, @Param("endDate") String endDate);

	//@Query("SELECT p FROM Projekcija p, Film f WHERE p.film.filmID=f.filmID AND f.naslov=:nazFilma")
	public List<Projekcija> findByFilm(Film film);
}
