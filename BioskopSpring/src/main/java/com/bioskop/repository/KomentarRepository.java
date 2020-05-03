package com.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Film;
import model.Komentar;

public interface KomentarRepository extends JpaRepository<Komentar, Integer>{
	public List<Komentar> findByFilm(Film film);
}
