<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Informacije o rezervaciji</title>
</head>
<body>

	<form action="/BioskopSpring/filmController/saveRezervacija" method = "POST">
	
		${projekcija.film.naslov}<br>
		${projekcija.datum}<br>
		${projekcija.vreme}<br>
		${brUlaznica}<br>
		${projekcija.sala.ime}<br>
		${cena}
		
		<input type="submit" name = "Sacuvaj" value = "Sacuvaj rezervaciju">
		<a href="/BioskopSpring/filmController/nedeljniRepertoar"> Odustani od rezervacije </a>
	</form>
	
	<c:if test="${!empty rezervacija}">
		Rezervacija je sacuvana.
	</c:if>
</body>
</html>