package com.bioskop.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	public String getFilmSalaSif(HttpServletRequest reques) {

		List<Film> filmovi = fr.findAll();
		List<Sala> sale = sr.findAll();
		List<Sifarnik> sifarnici = sifR.findAll();

		if (filmovi != null && sale != null && sifarnici != null) {
			reques.getSession().setAttribute("filmovi", filmovi);
			reques.getSession().setAttribute("sale", sale);
			reques.getSession().setAttribute("sifarnici", sifarnici);
		}
		return "UnosProjekcije";
	}

	@RequestMapping(value = "/saveProjekcija", method = RequestMethod.POST)
	public String sacuvajPredstavu(Integer film, Integer sala, Integer sifarnik, HttpServletRequest request) {

		Film f = fr.findById(film).get();
		Sala s = sr.findById(sala).get();
		Sifarnik sif = sifR.findById(sifarnik).get();

		Projekcija p = new Projekcija();
		p.setFilm(f);
		p.setSala(s);
		p.setSifarnik(sif);

		Projekcija projekcija = pr.save(p);
		request.getSession().setAttribute("projekcija", projekcija);

		return "UnosProjekcije";
	}

	@RequestMapping(value = "/nedeljniRepertoar", method = RequestMethod.GET)
	public String vratiNedeljniRepertoar(String startDate, String endDate, HttpServletRequest request)
			throws ParseException {

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date stDate = format.parse(startDate);
		Date eDate = format.parse(endDate);

		List<Projekcija> projekcije = pr.vratiNedeljniRepertoar(stDate, eDate);

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

}