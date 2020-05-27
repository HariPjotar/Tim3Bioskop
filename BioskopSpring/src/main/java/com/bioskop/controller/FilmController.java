package com.bioskop.controller;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.FilmRepository;
import com.bioskop.repository.KomentarRepository;
import com.bioskop.repository.ProjekcijaRepository;
import com.bioskop.repository.SalaRepository;
import com.bioskop.repository.SifarnikRepository;
import com.bioskop.security.UserService;

import model.Film;
import model.Komentar;
import model.Projekcija;
import model.Rezervacija;
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
	
	@Autowired
	KomentarRepository komR;
	
	@Autowired
	UserService us;
	
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
		List<Rezervacija> rezervacijas = new ArrayList<Rezervacija>();
		p.setRezervacijas(rezervacijas);
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
		List<Komentar> komentari = komR.findByFilm(film);
		request.getSession().setAttribute("film", film);
		request.getSession().setAttribute("komentari", komentari);
		
		int brojOcena = 0;
		double prosek = 0.0;
		
		for(Komentar k : komentari) {
			if(k.getOcena() > 0) {
				prosek += k.getOcena();
				brojOcena += 1;
			}
		}
		
		String temp = "Film jos nema ocena.";
		
		if(brojOcena > 0) {
			prosek = prosek/brojOcena;
			double factor = Math.pow(10, 2);
            prosek = Math.round(prosek * factor) / factor;
			request.getSession().setAttribute("prosek", prosek);
		}else {
			request.getSession().setAttribute("prosek", temp);
		}
		
		return "InfoOFilmu";
	}
	
	@RequestMapping(value = "/getNajboljeOcenjeniFilmovi", method = RequestMethod.GET)
	public String getNajboljeOcenjeniFilmovi(HttpServletRequest request) {
		
		LocalDate datum1 = LocalDate.now();
		String datum2 = datum1.toString();
		LocalDate datum3 = datum1.minusDays(30);
		String datum4 = datum3.toString();
		
		List<Film> filmovi = fr.vratiFilmoveMesecDana(datum2, datum4);
		List<Film> filmoviFinal = new ArrayList<Film>();
		
		double[] konacneOcene = new double[10];
		int rbrOcene = 0;
		
		int brOcena = 0;
		double prosecnaOcena = 0.0;
		
		for(Film f : filmovi) {
			for(Komentar k : f.getKomentars()) {
				if(k.getOcena() > 0) {
					prosecnaOcena += k.getOcena();
					brOcena += 1;
				}
			}
			double factor = Math.pow(10, 2);
			prosecnaOcena = prosecnaOcena/brOcena;
            prosecnaOcena = Math.round(prosecnaOcena * factor) / factor;
            prosecnaOcena = (double) prosecnaOcena;
            
            if(prosecnaOcena >= 4.5) {  //Ako treba da se promeni kriterijum za sta e podrazumeva pod "dobro ocenjen film", samo promeniti ovo 4.5
            	filmoviFinal.add(f);
            	konacneOcene[rbrOcene] = prosecnaOcena;
            	rbrOcene++;
            }
			prosecnaOcena = 0.0;
			brOcena = 0;
		}
		
		
		request.getSession().setAttribute("konacneOcene", konacneOcene);
		request.getSession().setAttribute("ocenjeniFilmovi", filmoviFinal);
		
		return "NajboljeOcenjeniFilmovi";
	}

	@RequestMapping(value = "/getZanrFilma", method = RequestMethod.GET)
	public String getZanrFilma(HttpServletRequest request) {
		
		List<Film> sviFilmovi = fr.findAll();
		List<String> zanrovi = new ArrayList<String>();
		
		for(Film f : sviFilmovi) {
			String[] niz = f.getZanr().split(", ");
			for(String s : niz) {
				s.trim();
				if(!zanrovi.contains(s)) {
					zanrovi.add(s);
				}
			}
		}
		
		request.getSession().setAttribute("zanrovi", zanrovi);
		return "PretragaFilmova";
	}
	
	@RequestMapping(value = "/getFilmoviSaZanrom", method = RequestMethod.GET)
	public String getFilmoviSaZanrom(String zanr, HttpServletRequest request) {
		List<Film> filmovi = fr.vratiFilmoveSaZanrom(zanr);
		request.getSession().setAttribute("filmoviSaZanrom", filmovi);
		
		return "PretragaFilmova";
	}
	
	@RequestMapping(value = "/getFilmoviSaGodinom", method = RequestMethod.GET)
	public String getFilmoviSaGodinom(Integer godina, HttpServletRequest request) {
		List<Film> filmovi = fr.vratiFilmoveSaGodinom(godina);
		request.getSession().setAttribute("filmoviSaGodinom", filmovi);
		
		return "PretragaFilmova";
	}
	
	@RequestMapping(value = "/getFilmoviSaNaslovom", method = RequestMethod.GET)
	public String getFilmoviSaNaslovom(String naslov, HttpServletRequest request) {
		List<Film> filmovi = fr.vratiFilmoveSaNaslovom(naslov);
		request.getSession().setAttribute("filmoviSaNaslovom", filmovi);
		
		return "PretragaFilmova";
	}
}