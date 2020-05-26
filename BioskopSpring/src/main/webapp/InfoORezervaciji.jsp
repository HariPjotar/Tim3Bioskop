<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@include file ="css/pocetna.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Informacije o rezervaciji</title>
</head>
<body class = "background">
	<div class="header">
		<h1>Unos projekcije</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div style="background-color: #919191">
		<form action="/BioskopSpring/mestaController/saveRezervacija"
			method="POST">

			${projekcija.film.naslov}<br> ${projekcija.datum}<br>
			${projekcija.vreme}<br> ${brUlaznica}<br>
			${projekcija.sala.ime}<br> ${cena} <br>
			<input type="submit" name="Sacuvaj" value="Sacuvaj"> <br>
			<a href="/BioskopSpring/filmController/nedeljniRepertoar"> Odustani od rezervacije </a>
		</form>
	</div>

	<c:if test="${!empty rezervacija}">
		Rezervacija je sacuvana.
	</c:if>
</body>
</html>