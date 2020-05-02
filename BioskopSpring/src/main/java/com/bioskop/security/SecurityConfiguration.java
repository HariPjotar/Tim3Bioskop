package com.bioskop.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
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

	//naknadno dodati radnika
	@Override
	public void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests()
		//.antMatchers("/", "/Logovanje.jsp", "/Registracija.jsp", "/PregledRepertoara,jsp", "/InfoOFilmu.jsp").permitAll()
		//.antMatchers("/UnosFilma.jsp", "/UnosProjekcije.jsp", "/UnosRepertoara.jsp").hasRole("ADMIN")
		//.antMatchers("/InfoOFilmu.jsp", "/PregledRepertoara.jsp").hasRole("KORISNIK") //dodati dozvole za rezervacije i komentare kad se naprave
		//.antMatchers(HttpMethod.POST,"/InfoOFilmu.jsp").hasRole("KORISNIK") //dozvoljava samo korisniku da postuje na infoofilmu
		.and()
		.formLogin()
		.loginPage("/Logovanje.jsp")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/filmController/nedeljniRepertoar")
		.failureForwardUrl("/login_error.jsp")
		.and().csrf().disable();

	}
}