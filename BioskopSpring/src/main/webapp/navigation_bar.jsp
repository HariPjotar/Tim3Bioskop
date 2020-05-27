<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/navigationBar.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<br><br><br>
	<div class="topnav">
	<ul>
		<s:authorize access="hasAnyRole('ADMIN', 'KORISNIK', 'RADNIK')">
  			<li><a href="/BioskopSpring/pocetna.jsp">Pocetna</a></li>
  		</s:authorize>
  		<s:authorize access="!isAuthenticated()">
  			<li><a href="/BioskopSpring/index.jsp">Pocetna</a></li>
  		</s:authorize>
  		<li><a href="/BioskopSpring/filmController/nedeljniRepertoar">Repertoar</a></li>
  		<li><a href="/BioskopSpring/filmController/getNajboljeOcenjeniFilmovi">TOP Filmovi</a></li>
  		<li><a href="/BioskopSpring/filmController/getZanrFilma">Pretraga filmova</a></li>
  		<s:authorize access="!isAuthenticated()">
  			<li style="float:right"><a href="/BioskopSpring/userController/registerUser">Registracija</a></li>
			<li style="float:right"><a href="/BioskopSpring/userController/loginPage">LOG IN</a></li>
		</s:authorize>
  		<s:authorize access="hasRole('KORISNIK')">
  			<li><a href="/BioskopSpring/mestaController/getFilmovi">Rezervacija</a></li>
  		</s:authorize>
  		<s:authorize access="hasRole('ADMIN')">
			<li><a href="/BioskopSpring/UnosFilma.jsp">Unos filma</a></li>
			<li><a href="/BioskopSpring/filmController/getFilmoviSalaSifarnik">Unos projekcije</a></li>
			<li><a href="/BioskopSpring/userController/registerUser">Registracija Radnika</a></li>
			<li><a href="/BioskopSpring/PregledProfita.jsp">Pregled profita</a></li>
		</s:authorize>
		<s:authorize access="hasRole('RADNIK')">
  			<li><a href="/BioskopSpring/mestaController/getFilmovi">Prodaja karata</a></li>
  		</s:authorize>
		<s:authorize access="hasAnyRole('ADMIN', 'KORISNIK', 'RADNIK')">
			<li style="float:right"><a href="/BioskopSpring/logout">LOG OUT</a></li>
		</s:authorize>
	</ul>
	</div>
	<br><br><br>
</body>
</html>