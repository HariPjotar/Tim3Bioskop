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
<title>Unos Filma</title>
</head>
<body class="background">
	<div class="header">
		<h1>Unos novog filma</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div class="center">
		<div style = "background-color: #919191;">
			<form action = "/BioskopSpring/filmController/saveFilm" method ="POST">
				<div class="center">Unesite naslov filma: 			   <input type = text name="naslov"><br></div>
				<div class="center">Unesite glavne uloge u filmu: 	   <input type = text name="uloge"><br></div>
				<div class="center">Unesite zanr filma: 			   <input type = text name="zanr"><br></div>
				<div class="center">Unesite reditelja filma: 		   <input type = text name="reditelj"><br></div>
				<div class="center">Unesite godinu filma: 			   <input type = text name="godina"><br></div>
				<div class="center">Unesite trajanje filma: 		   <input type = text name="trajanje"><br></div>
				<div class="center">Unesite opis filma: 			   <input type = text name="opis"><br></div>
				<div class="center">Unesite putanju do plakata filma:  <input type = text name="plakat"><br></div>
				<div class="center">Unesite putanju do trailera filma: <input type = text name="trailer"><br></div>
				<br>
				<input type = "submit" name="dugmeUnos" value = "Unesi film" class ="center">
				<br>
			</form>
		</div>
	</div>

	<c:if test="${!empty film}">
		Uspesno je dodat film.
	</c:if>
	
</body>
</html>