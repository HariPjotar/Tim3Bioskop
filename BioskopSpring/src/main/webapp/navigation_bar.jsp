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
  		<li><a href="/BioskopSpring/pocetna.jsp">Pocetna</a></li>
  		<li><a href="/BioskopSpring/filmController/nedeljniRepertoar">Repertoar</a></li>
  		<li><a href="/BioskopSpring/filmController/getNajboljeOcenjeniFilmovi">TOP Filmovi</a></li>
  		<s:authorize access="hasRole('ADMIN')">
			<li><a href="/BioskopSpring/UnosFilma.jsp">Unos novog filma</a></li>
			<li><a href="/BioskopSpring/filmController/getFilmoviSalaSifarnik">Unos nove projekcije</a></li>
		</s:authorize>
		<s:authorize access="hasAnyRole('ADMIN', 'KORISNIK')">
			<li style="float:right"><a href="/BioskopSpring/logout">LOG OUT</a></li>
		</s:authorize>
	</ul>
	</div>
	<br><br><br>
</body>
</html>