package com.bioskop.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.FilmRepository;
import com.bioskop.repository.ProjekcijaRepository;
import com.bioskop.repository.SalaRepository;
import com.bioskop.repository.SifarnikRepository;

import model.Film;
import model.Projekcija;
import model.Sala;
import model.Sifarnik;

@Controller
@RequestMapping(value = "/filmController")
public class FilmController {

	@Autowired
	FilmRepository fr;
	
	@Autowired
	ProjekcijaRepository pr;

	@Autowired
	SalaRepository sr;

	@Autowired
	SifarnikRepository sifR;

	@RequestMapping(value = "/saveFilm", method = RequestMethod.POST)
	public String sacuvajFilm(String naslov, String uloge, String zanr, String reditelj, String godina, String trajanje,
			String opis, String plakat, String trailer, HttpServletRequest request) {

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

		return "UnosFilma";
	}

	@RequestMapping(value = "/getFilmoviSalaSifarnik", method = RequestMethod.GET)
	public String getFilmSalaSif(HttpServletRequest request) {

		List<Film> filmovi = fr.findAll();
		List<Sala> sale = sr.findAll();
		List<Sifarnik> sifarnici = sifR.findAll();

		if (filmovi != null && sale != null && sifarnici != null) {
			request.getSession().setAttribute("filmovi", filmovi);
			request.getSession().setAttribute("sale", sale);
			request.getSession().setAttribute("sifarnici", sifarnici);
		}
		return "UnosProjekcije";
	}

	@RequestMapping(value = "/saveProjekcija", method = RequestMethod.POST)
	public String sacuvajProjekciju(Integer film, String datum, String vreme, Integer sala, Integer sifarnik, HttpServletRequest request) 
			throws ParseException {
		
		Film f = fr.findById(film).get();
		Sala s = sr.findById(sala).get();
		Sifarnik sif = sifR.findById(sifarnik).get();
		
		Projekcija p = new Projekcija();
		p.setFilm(f);
		p.setDatum(datum);
		p.setVreme(vreme);
		p.setSlobodnaMesta(s.getBrMesta());
		p.setSala(s);
		p.setSifarnik(sif);

		Projekcija projekcija = pr.save(p);
		request.getSession().setAttribute("projekcija", projekcija);

		return "UnosProjekcije";
	}

	@RequestMapping(value = "/nedeljniRepertoar", method = RequestMethod.GET)
	public String vratiNedeljniRepertoar(HttpServletRequest request)
			throws ParseException {
		
		LocalDate stDate =LocalDate.now();
		String startDate=stDate.toString();
		LocalDate eDate=stDate.plusDays(7);
		String endDate=eDate.toString();
		
		List<Projekcija> projekcije = pr.vratiNedeljniRepertoar(startDate, endDate);

		request.getSession().setAttribute("proj", projekcije);

		return "PregledRepertoara";
	}

	@RequestMapping(value = "/vratiInfoFilm", method = RequestMethod.GET)
	public String vratiInfoOFilmu(String filmid, HttpServletRequest request) {
		
		Integer id = Integer.parseInt(filmid);		
		Film film = fr.findById(id).get();	
		request.getSession().setAttribute("film", film);

		return "InfoOFilmu";
	}
	
	@RequestMapping(value = "/getFilmovi", method = RequestMethod.GET) 
	public String getFilmovi(HttpServletRequest request) {
		List<Film> filmovi = fr.findAll();
		request.getSession().setAttribute("filmovi", filmovi);
		return "ProjekcijeFilmova";
	}
	
	@RequestMapping(value = "/getProjekcije", method = RequestMethod.GET)
	public String getProjekcije(Integer filmID, HttpServletRequest request) {
		Film f = fr.findById(filmID).get();
		List<Projekcija> projekcije = pr.findByFilm(f);
		request.getSession().setAttribute("projekcije", projekcije);
		return "ProjekcijeFilmova";
	}
	

	

}