<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
<%@include file ="css/pocetna.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Unos projekcije</title>
</head>
<body class="background">
	<div class="header">
		<h1>Unos projekcije</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div class = "center">
		<div style="background-color: #919191">
		<form action="/BioskopSpring/filmController/saveProjekcija"
			method="POST">

			<select name="film">
				<c:forEach var="f" items="${filmovi}">
					<option value="${f.filmID}">${f.naslov}
				</c:forEach>
			</select><br> Unesite datum projekcije: <input type="date" name="datum">
			<br> Unesite vreme projekcije: <input type="text" name="vreme">
			<br> <select name="sala">
				<c:forEach var="s" items="${sale}">
					<option value="${s.salaID}">${s.ime}
				</c:forEach>
			</select><br> <select name="sifarnik">
				<c:forEach var="sif" items="${sifarnici}">
					<option value="${sif.sifarnikID}">${sif.tip}
				</c:forEach>
			</select><br> <input type="submit" value="Unesi projekciju">


		</form>
		</div>
	</div>
	<br>
	<c:if test="${!empty projekcija}">
		Uspesno je dodata projekcija.
	</c:if>
</body>
	
	
</html>