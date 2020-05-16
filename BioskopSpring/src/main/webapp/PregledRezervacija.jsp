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
<title>Prodaja karata</title>
</head>
<body class="background2">	
	<!-- ispisati podatke o projekciji -->
	<p>${proj.film.naslov } ${proj.vreme } ${proj.datum } ${proj.sala.ime } ${proj.sifarnik.cena } </p>
	<c:if test="${!empty rezervacije}">
			<table>
			<tr>
				<th>Ime</th>
				<th>Prezime</th>
				<th>Broj ulaznica</th>
				<th>Mesta</th>
				
			</tr>
			<c:forEach var="r" items="${rezervacije}">
				<tr>
					<td>${r.korisnik.ime}</td>
					<td>${r.korisnik.prezime}</td>
					<td>${r.brUlaznica}</td>
					<td>${r.stampajMesta()}</td>
					
					<td><a href = "sacuvajKarte?brUlaznica=${r.brUlaznica}">Stampaj karte</a></td>
					
					
				</tr>
			</c:forEach>
		</table>
		
	</c:if>
	
</body>
</html>
