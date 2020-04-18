package com.bioskop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Film;

public interface FilmRepository extends JpaRepository<Film, Integer> {

}
