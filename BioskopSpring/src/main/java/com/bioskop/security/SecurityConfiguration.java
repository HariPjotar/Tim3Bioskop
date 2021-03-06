package com.bioskop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	UserService service;

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(service);
	}

	@Override
	public void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests()
		.antMatchers("/", "/Logovanje.jsp", "/Registracija.jsp", "/PregledRepertoara,jsp","/PretragaFilmova.jsp","/InfoOFilmu.jsp", "/NajboljeOcenjeniFilmovi.jsp").permitAll()
		.antMatchers("/pocetna.jsp").hasAnyRole("ADMIN", "KORISNIK", "RADNIK")
		.antMatchers("/ProjekcijeFilmova.jsp", "/SlobodnaMestaUSali.jsp", "/InfoORezervaciji.jsp").hasAnyRole("KORISNIK", "RADNIK")
		.antMatchers("/PregledRezervacija.jsp").hasRole("RADNIK")
		.antMatchers("/UnosFilma.jsp", "/UnosProjekcije.jsp", "/PregledProfita.jsp").hasRole("ADMIN")
		.and()
		.formLogin()
		.loginPage("/Logovanje.jsp")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/pocetna.jsp")
		.failureForwardUrl("/login_error.jsp")
		.and()
		.logout()
		.invalidateHttpSession(true)
		.logoutSuccessUrl("/")
		.and().exceptionHandling().accessDeniedPage("/NisiKorisnik.jsp")
		.and().csrf().disable();

	}
}