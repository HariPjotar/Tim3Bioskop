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
<title>Projekcije filma</title>
</head>
<body class ="background">
	<div class="header">
		<h1>Cinema Universe</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div style="background-color: #919191">
	<form action ="/BioskopSpring/mestaController/getProjekcije" method = "GET">
		<select name = "filmID">
		<c:forEach var = "f" items = "${filmovi}">
			<option value = "${f.filmID}"> ${f.naslov}</option>
		</c:forEach>
	</select><br>
		<input type = "submit" value = "Prikazi projekcije filma">
	</form>
	

	<c:if test="${!empty projekcije}">
		<table border = "1">
			<tr>
				<th>Film</th>
				<th>Datum projekcije</th>
				<th>Vreme projekcije</th>
				<th>Sala</th>
				<th>Slobodna mesta</th>
				<th>Cena</th>
				<th>Rezervacija</th>
				
				<!-- Ivana -->
				<th>Korisnik ima rezervaciju</th>
			</tr>
			<c:forEach var="i" items="${projekcije}">
				<tr>
					<td>${i.film.naslov}</td>
					<td>${i.datum}</td>
					<td>${i.vreme}</td>
					<td>${i.sala.ime}</td>
					<td>${i.slobodnaMesta}</td>
					<td>${i.sifarnik.cena}</td>
					<td><a href = "getMestaUSali?projekcijaID=${i.projekcijaID}">Rezervisi</a></td>
					
					<!-- Ivana -->
					<td><a href = "getRezervacije?projekcijaID=${i.projekcijaID}">Prikazi rezervacije</a></td>
				</tr>
			</c:forEach>
		</table>

	</c:if>
	</div>
</body>
</html>