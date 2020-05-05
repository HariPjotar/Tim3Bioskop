<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
<%@ include file="css/Repertoar.css"%>
</style>

<head>
<meta charset="ISO-8859-1">
<title>Repertoar</title>
</head>
<%@ include file="navigation_bar.jsp"%>
<body class = "background">
	<div class = "center"> 	
	<div class="header">
		<h1>Repertoar</h1>
	</div>	
	<c:forEach items="${proj}" var="p">
		<form action="/BioskopSpring/filmController/vratiInfoFilm">
		<br>
			<table class = "table">
				<tr>
					<th><img src='${p.film.plakat}' height="350" width="250"></th>
				</tr>
				<tr>
					<td>${p.film.naslov} </td>
				</tr>
				<tr>
					<td>Vreme: ${p.vreme}</td>
				</tr>
				<tr>
					<td>Datum: ${p.datum}</td>
				</tr>
				<tr>
					<td>Sala: ${p.sala.ime}</td>
				</tr>
				<tr>
					<td>Cena: ${p.sifarnik.cena}din</td>
				</tr>
				<tr>
					<td><input class ="button" type="submit" value="Vise informacija"></td>
					<!--<td> <button type="submit" formaction="/BioskopSpring/filmController/getMestaUSali?id=${p.projekcijaID}">Rezervisi</button></td>-->
				</tr>

			</table>
			<input type="hidden" name="filmid" value = "${p.film.filmID }">
		</form>

	</c:forEach>
	</div>	
</body>
</html>