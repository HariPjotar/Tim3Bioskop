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
import com.bioskop.repository.KartaRepository;
import com.bioskop.repository.MestoRepository;
import com.bioskop.repository.ProjekcijaRepository;
import com.bioskop.repository.RezervacijaRepository;
import com.bioskop.security.UserService;

import model.Film;
import model.Karta;
import model.Korisnik;
import model.Mesta;
import model.Projekcija;
import model.Rezervacija;

@Controller
@RequestMapping(value = "/mestaController")
public class MestaContoller {
	
	@Autowired
	FilmRepository fr;
	
	@Autowired
	ProjekcijaRepository pr;
	
	@Autowired
	KartaRepository kr;
	
	@Autowired
	UserService us;
	
	@Autowired
	RezervacijaRepository rr;
	
	@Autowired
	MestoRepository mr;
	
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
	
	private String[] tempNiz = new String[20];
	
	@RequestMapping(value = "/potvrdiMesta", method = RequestMethod.POST)
	public String potvrdiMesta(String[] mesto, HttpServletRequest request) {
		
		List<Integer> listaKolona = new ArrayList<>();
		List<Integer> listaRedova = new ArrayList<>();
		
		int tmp = 0;
		System.out.println("NIZ MESTA2: ");
		for(String s : mesto) {
			System.out.println(s);
			tempNiz[tmp] = s;
			tmp++;
			String[] pom = s.split(",");
			listaKolona.add(Integer.parseInt(pom[1]));
			listaRedova.add(Integer.parseInt(pom[0]));
		}
		
		System.out.println("KOLONE KOJE TREBA REZERVISATI(I-OVI): ");
		for(Integer i : listaKolona) {
			System.out.println(i);
		}
		
		System.out.println("REDOVI KOJE TREBA REZERVISATI(J-OVI): ");
		for(Integer i : listaRedova) {
			System.out.println(i);
		}
		
		System.out.println("MESTO.LENGTH: " + mesto.length);
		int brojUlaznica = mesto.length;
		
		Projekcija proj = (Projekcija) request.getSession().getAttribute("projekcija");
		
		double cena = brojUlaznica * proj.getSifarnik().getCena();
		
		request.getSession().setAttribute("listaKolona", listaKolona);
		request.getSession().setAttribute("listaRedova", listaRedova);
		request.getSession().setAttribute("mesta", mesto);
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
		
		//List<Rezervacija> temp2 = p.getRezervacijas();
		//temp2.add(r);
		request.getSession().setAttribute("rezervacija", rez);
		dodajMestaISmanjiSlobodna(rez, p, request);
		
		return "InfoORezervaciji";
	}
	
	private void dodajMestaISmanjiSlobodna(Rezervacija rez, Projekcija p, HttpServletRequest request) {

		String[] mesta = (String[]) request.getSession().getAttribute("mesta");
		List<Mesta> temp = new ArrayList<Mesta>();
		
		for (int l = 0; l < mesta.length; l++) {
			String[] niz = mesta[l].split(",");
			//Kad udje u metodu, split polovi string i onda se poveca string.LENGTH - popravi ovo sutra
			System.out.println("NIZ MESTA: ");
			for(String s : niz) {
				System.out.println(s);
			}
			
			int i = 0;
			int j = 0;
			
			
			try {
				i = Integer.parseInt(niz[0]);
				j = Integer.parseInt(niz[1]);
			}catch(Exception e) {
				i = Integer.parseInt(tempNiz[0]);
				j = Integer.parseInt(tempNiz[1]);
			}
			
			Mesta m = new Mesta();
			m.setRedMesta(i);
			m.setBrojMesta(j);
			m.setRezervacija(rez);
			p.setSlobodnaMesta(p.getSlobodnaMesta() - 1);
			mr.save(m);
			temp.add(m);
			pr.updateMesta(p.getSlobodnaMesta(), p.getProjekcijaID());
		}
		rez.setMestas(temp);
		
	}
	
	@RequestMapping(value = "/getRezervacije", method = RequestMethod.GET)
	public String getRezervacije(String projekcijaID, HttpServletRequest request) {		
		Integer projID = Integer.parseInt(projekcijaID);
		Projekcija p = pr.findById(projID).get();
		List<Rezervacija> rezervacije = rr.findByProjekcija(p);	
		request.getSession().setAttribute("proj", p);
		request.getSession().setAttribute("rezervacije", rezervacije);
		return "PregledRezervacija";		
	}
	
	@RequestMapping(value = "/sacuvajKarte", method = RequestMethod.GET)
	public String sacuvajKarte(String brUlaznica, HttpServletRequest request) {
		LocalDate datum1 = LocalDate.now();
		String datum = datum1.toString();
		Korisnik korisnik = us.getUserFromSession();
		Projekcija projekcija = (Projekcija) request.getSession().getAttribute("proj");
		double cena = projekcija.getSifarnik().getCena();
		Integer brUl = Integer.parseInt(brUlaznica);
		
		for (int i = 0; i < brUl; i++) {
			Karta k = new Karta();
			k.setDatum(datum);
			k.setKorisnik(korisnik);
			k.setProjekcija(projekcija);
			k.setCena(cena);
			kr.save(k);
		}
		
		return "PregledRezervacija";
	}
	
	@RequestMapping(value = "/vratiKarte", method = RequestMethod.GET)
	public String vratiKarte(String startDate, String endDate, HttpServletRequest request) throws ParseException {

		List<Karta> karte = kr.vratiKarte(startDate, endDate);

		request.getSession().setAttribute("karte", karte);

		return "PregledProfita";
	}
	
}
