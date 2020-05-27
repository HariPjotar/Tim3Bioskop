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
<title>Unos Filma</title>
</head>
<body class="background">
	<div class="header">
		<h1>Unos novog filma</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div class="centar">
		<div style = "background-color: #919191;">
			<form action = "/BioskopSpring/filmController/saveFilm" method ="POST">
				<p>Unesite naslov filma: 			   <input type = text name="naslov"><br><br>
				Unesite glavne uloge u filmu: 	   <input type = text name="uloge"><br><br>
				Unesite zanr filma: 			   <input type = text name="zanr"><br><br>
				Unesite reditelja filma: 		   <input type = text name="reditelj"><br><br>
				Unesite godinu filma: 			   <input type = text name="godina"><br><br>
				Unesite trajanje filma: 		   <input type = text name="trajanje"><br><br>
				Unesite opis filma: 			   <input type = text name="opis"><br><br>
				Unesite putanju do plakata filma:  <input type = text name="plakat"><br><br>
				Unesite putanju do trailera filma: <input type = text name="trailer"><br><br></p>
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