<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<style>
<%@ include file="CSS.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Unos Filma</title>
</head>
<body>
	Ovo je neki tekst na stranici za unos filma.
	
	<form action = "/BioskopSpring/filmController/saveFilm" method ="POST">
		
		Unesite naslov filma: 			  <input type = text name="naslov"><br>
		Unesite glavne uloge u filmu: 	  <input type = text name="uloge"><br>
		Unesite zanr filma: 			  <input type = text name="zanr"><br>
		Unesite reditelja filma: 		  <input type = text name="reditelj"><br>
		Unesite godinu filma: 			  <input type = text name="godina"><br>
		Unesite trajanje filma: 		  <input type = text name="trajanje"><br>
		Unesite opis filma: 			  <input type = text name="opis"><br>
		Unesite putanju do plakata filma: <input type = text name="plakat"><br>
		Unesite putanju do trailera filma:<input type = text name="trailer"><br>
		<input type = "submit" name="dugmeUnos" value = "Unesi film">
		
	</form>
	
	<c:if test="${!empty film}">
		Uspesno je dodat film.
	</c:if>
	
</body>
</html>