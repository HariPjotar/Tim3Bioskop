package com.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Karta;

public interface KartaRepository extends JpaRepository<Karta, Integer> {
	

	@Query("SELECT k FROM Karta k WHERE k.datum BETWEEN :startDate AND :endDate ORDER BY k.datum")
	public List<Karta> vratiKarte(@Param("startDate") String startDate, @Param("endDate") String endDate);


}
