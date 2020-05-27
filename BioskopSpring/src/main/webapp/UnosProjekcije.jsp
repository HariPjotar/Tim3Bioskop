<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
<%@include file ="css/pretraga.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Unos projekcije</title>
</head>
<body class="background">
	<div class="header">
		<h1>Unos projekcije</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div class = "centar">
		<div style="background-color: #919191">
		<form action="/BioskopSpring/filmController/saveProjekcija"
			method="POST">
			<p>
			Film: 
			<select name="film">
				<c:forEach var="f" items="${filmovi}">
					<option value="${f.filmID}">${f.naslov}
				</c:forEach>
			</select>
			<br>
			<br> Unesite datum projekcije: <input type="date" name="datum">
			<br>
			<br> Unesite vreme projekcije: <input type="text" name="vreme">
			<br>
			<br> 
			Sala: <select name="sala">
				<c:forEach var="s" items="${sale}">
					<option value="${s.salaID}">${s.ime}
				</c:forEach>
			</select>
			<br>
			<br>
			Tip projekcije: <select name="sifarnik">
				<c:forEach var="sif" items="${sifarnici}">
					<option value="${sif.sifarnikID}">${sif.tip}
				</c:forEach>
			</select>
			<br>
			<br>
			<input type="submit" value="Unesi projekciju">
			</p>
		</form>
		</div>
	</div>
	<br>
	<c:if test="${!empty projekcija}">
		Uspesno je dodata projekcija.
	</c:if>
</body>
	
	
</html>