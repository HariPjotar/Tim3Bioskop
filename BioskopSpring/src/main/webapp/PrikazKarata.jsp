<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@include file ="css/karte.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Pregled karata</title>
</head>
<body>
	<c:if test="${!empty karte}">
		<c:forEach var="k" items="${karte}">
		<table>
			<tr>
				<th colspan="2">CINEMA UNIVERSE</th>
			</tr>
			<tr>
				<td>${k.projekcija.film.naslov}</td>
				<td rowspan="4"><img src='${k.projekcija.film.plakat}'></td>
			</tr>
			<tr>
				<td>${k.projekcija.datum}  ${k.projekcija.vreme}</td>
			</tr>
			<tr>
				<td>Sala: ${k.projekcija.sala}</td>
			</tr>
			<tr>
				<td>Cena: ${k.cena}din</td>
			</tr>
		</table>
		</c:forEach>
	</c:if>
	<button onclick="window.print()">Stampaj</button>
</body>
</html>