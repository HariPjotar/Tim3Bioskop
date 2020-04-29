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
		// TODO Auto-generated method stub
		auth.userDetailsService(service);
	}

	@Override
	public void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests()
		.antMatchers("/", "/Logovanje.jsp", "/Registracija.jsp").permitAll()
		.antMatchers("/admin/**", "/UnosFilma.jsp", "/UnosProjekcije.jsp", "/UnosRepertoara.jsp")
		.hasRole("ADMIN")
		.antMatchers("/users/**")
		.hasAnyRole("ADMIN", "KORISNIK")
		.and()
		.formLogin()
		.loginPage("/Logovanje.jsp")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/UnosRepertoara.jsp")
		//.and()
		//.exceptionHandling()
		//.accessDeniedPage("")
		.and()
		.rememberMe()
		.and().csrf().disable();

	}
}