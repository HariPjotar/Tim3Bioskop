package com.bioskop.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.FilmRepository;
import com.bioskop.repository.KomentarRepository;
import com.bioskop.repository.KorisnikRepository;
import com.bioskop.repository.UlogaRepository;
import com.bioskop.security.UserValidator;

import model.Film;
import model.Komentar;
import model.Korisnik;
import model.Uloga;

@Controller
@RequestMapping(value = "/userController")
public class UserController {
	
	@Autowired
	UlogaRepository ur;
	
	@Autowired
	KorisnikRepository kr;
	
	@Autowired
	UserValidator uv;
	
	@Autowired
	KomentarRepository komr;
	
	@Autowired
	FilmRepository fr;
	
	@RequestMapping(value="loginPage", method=RequestMethod.GET) 
	public String loginPage() {
		return "Logovanje";
	}
	
	 @RequestMapping(value = "registerUser", method = RequestMethod.GET)
		public String newUser(Model model) {
		Korisnik k = new Korisnik();
		model.addAttribute("korisnik", k);
		return "Registracija";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String sacuvajKorisnika(@ModelAttribute("korisnik") Korisnik k, BindingResult bindingResult) {
		
		uv.validate(k, bindingResult);
		
		
		if (bindingResult.hasErrors()) {
            return "Registracija";
        }
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		k.setPassword(passwordEncoder.encode(k.getPassword()));

		Uloga u = ur.findById(3).get();

		k.setUloga(u);
		u.addKorisnik(k);
		
		kr.save(k);
		
		return "Logovanje";
	}
	
	
	/*
	 * Dovrsiti kad se ubaci korisnik

	@RequestMapping(value = "/saveKomentar", method = RequestMethod.POST)
	public String sacuvajKomentar(Integer filmID, Integer korisnik, String komentar, HttpServletRequest request) throws ParseException {
		
		Film f = fr.findById(filmID).get();
		Korisnik k = kr.findById(korisnik).get();
		
		String ocena = request.getParameter("ocena");
		int ocenaInt = Integer.parseInt(ocena);
		
		String datumKom = new Date().toString();
		String datumOc = new Date().toString();
		
		Komentar kom = new Komentar();
		kom.setDatumKom(datumKom);
		kom.setDatumOc(datumOc);
		kom.setFilm(f);
		kom.setKomentar(komentar);
		kom.setKorisnik(k);
		kom.setOcena(ocenaInt);
		
		Komentar komm = komr.save(kom);
		request.getSession().setAttribute("komentar", komm);
		
		System.out.println("Uspesno je dodat komentar.");
		
		return "InfoOFilmu";
	}*/
}
