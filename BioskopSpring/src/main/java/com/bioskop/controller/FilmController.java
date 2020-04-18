package com.bioskop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.FilmRepository;

import model.Film;

@Controller
@RequestMapping(value = "/filmController")
public class FilmController {
	
	@Autowired
	FilmRepository fr;
	
	@RequestMapping(value = "/saveFilm", method = RequestMethod.POST)
	public String sacuvajFilm(String naslov, String uloge, String zanr, String reditelj, 
							String godina, String trajanje, String opis, String plakat, 
							String trailer, HttpServletRequest request) {
		
		Integer god = Integer.parseInt(godina);
		
		Film film = new Film();
		
		film.setNaslov(naslov);
		film.setUloge(uloge);
		film.setZanr(zanr);
		film.setReditelj(reditelj);
		film.setGodina(god);
		film.setTrajanje(trajanje);
		film.setOpis(opis);
		film.setPlakat(plakat);
		film.setTrailer(trailer);
		
		Film f = fr.save(film);
		
		request.getSession().setAttribute("film", f);
		request.getSession().setAttribute("message", "Uspesno ste dodali film.");
		
		return "unosFilma";
	}
}
