<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS.css">
<meta charset="ISO-8859-1">
<title>Unos projekcije</title>
</head>
<body>
	<form action = "/BioskopSpring/filmController/saveProjekcija" method ="POST">
	
	<select name = "film">
		<c:forEach var = "f" items = "${filmovi}">
			<option value = "${f.filmID}"> ${f.naslov}
		</c:forEach>
	</select><br>
	
	Unesite datum projekcije: <input type="date" name = "datum"> <br>
	
	Unesite vreme projekcije: <input type = "text" name = "vreme"> <br>
	
	<select name = "sala">
		<c:forEach var = "s" items = "${sale}">
			<option value = "${s.salaID}"> ${s.ime}
		</c:forEach>
	</select><br>
	
	<select name = "sifarnik">
		<c:forEach var = "sif" items = "${sifarnici}">
			<option value = "${sif.sifarnikID}"> ${sif.tip}
		</c:forEach>
	</select><br>
	
	<input type="submit" value = "Unesi projekciju">
	
	<c:if test="${!empty projekcija}">
		Uspesno je dodata projekcija.
	</c:if>
	</form>
</body>
</html>