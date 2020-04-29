package com.bioskop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.KorisnikRepository;
import com.bioskop.repository.UlogaRepository;
import com.bioskop.security.UserValidator;

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
	
	 @RequestMapping(value = "registerUser", method = RequestMethod.GET)
		public String newUser(Model model) {
		Korisnik k = new Korisnik();
		model.addAttribute("korisnik", k);
		return "Registracija";
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String sacuvajKorisnika(@ModelAttribute("korisnik") Korisnik k, BindingResult bindingResult) {
		
		uv.validate(k, bindingResult);
		
		
		System.out.println("Stigao sam dovde");
		
		if (bindingResult.hasErrors()) {
            return "Registracija";
        }
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		k.setPassword(passwordEncoder.encode(k.getPassword()));

		Uloga u = ur.findById(1).get();

		k.setUloga(u);
		u.addKorisnik(k);
		
		System.out.println("I dovde");
		
		kr.save(k);
		
		return "Logovanje";
	}

}
