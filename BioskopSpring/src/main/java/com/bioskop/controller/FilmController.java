package com.bioskop.controller;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.FilmRepository;
import com.bioskop.repository.KomentarRepository;
import com.bioskop.repository.MestoRepository;
import com.bioskop.repository.ProjekcijaRepository;
import com.bioskop.repository.RezervacijaRepository;
import com.bioskop.repository.SalaRepository;
import com.bioskop.repository.SifarnikRepository;
import com.bioskop.security.UserService;

import model.Film;
import model.Komentar;
import model.Korisnik;
import model.Mesta;
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
	
	@Autowired
	RezervacijaRepository rr;
	
	@Autowired
	MestoRepository mr;

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
	
	@RequestMapping(value = "/getMestaUSali", method = RequestMethod.GET)
	public String getMestaZaSalu(String projekcijaID, HttpServletRequest request) {
		
		Integer projID = Integer.parseInt(projekcijaID);
		
		Projekcija proj = pr.findById(projID).get();
		request.getSession().setAttribute("projekcija", proj);
		int brojRedova = 0;
		int brojKolona = 10;
		
		if(proj.getSala().getBrMesta() > 160) { //Ako se u bazu doda slucajno sala sa brojem mesta koji nije deljiv sa 22, ovo ce da pukne!!!
			brojKolona = 22;
		}
		
		request.getSession().setAttribute("brojKolona", brojKolona);
		brojRedova = (proj.getSala().getBrMesta() / brojKolona);
		request.getSession().setAttribute("brojRedova", brojRedova);
		
		Mesta[][] mesta = new Mesta[brojRedova][brojKolona];
		request.getSession().setAttribute("mesta", mesta);
		
		return "SlobodnaMestaUSali";
	}
	
	@RequestMapping(value = "/potvrdiMesta", method = RequestMethod.POST)
	public String potvrdiMesta(String[] mesto, HttpServletRequest request) {
		
		int brojUlaznica = mesto.length;
		
		Projekcija proj = (Projekcija) request.getSession().getAttribute("projekcija");
		
		double cena = brojUlaznica * proj.getSifarnik().getCena();
		
		request.getSession().setAttribute("mesta",mesto);
		request.getSession().setAttribute("brojUlaznica", brojUlaznica);
		request.getSession().setAttribute("cena", cena);
		return "InfoORezervaciji";
	}
	
	@RequestMapping(value = "saveRezervacija", method = RequestMethod.POST)
	public String sacuvajRezervaciju(HttpServletRequest request) {
		
		Rezervacija r = new Rezervacija();
		Korisnik k = us.getUserFromSession();
		Projekcija p = (Projekcija) request.getSession().getAttribute("projekcija");
		int brojUlaznica = (int) request.getSession().getAttribute("brojUlaznica");
		r.setKorisnik(k);
		r.setProjekcija(p);
		r.setBrUlaznica(brojUlaznica);
		
		Rezervacija rez = rr.save(r);
		request.getSession().setAttribute("rezervacija", rez);
		dodajMestaISmanjiSlobodna(rez, p, request);
		
		return "InfoORezervaciji";
	}
	
	private void dodajMestaISmanjiSlobodna(Rezervacija rez, Projekcija p, HttpServletRequest request) {

		String[] mesta = (String[]) request.getSession().getAttribute("mesta");
		
		for (int l = 0; l < mesta.length; l++) {
			String[] niz = mesta[l].split(",");
			int i = Integer.parseInt(niz[0]);
			int j = Integer.parseInt(niz[1]);
			Mesta m = new Mesta();
			m.setRedMesta(i);
			m.setBrojMesta(j);
			m.setRezervacija(rez);
			mr.save(m);

			//rez.addMesta(m);
		}
		//int brojSlobodnihMesta = p.getSlobodnaMesta() - mesta.length;
	}

}