<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS.css">
<meta charset="ISO-8859-1">
<title>${film.naslov }</title>
</head>
<body>

	<table>
		<tr>
			<th><img src='${film.plakat}' height="200" width="150"></th>
		</tr>
		<tr>
			<td>Naslov: ${film.naslov}</td>
		</tr>
		<tr>
			<td>Reditelj: ${film.reditelj}</td>
		</tr>
		<tr>
			<td>Godina: ${film.godina}</td>
		</tr>
		<tr>
			<td>Opis: ${film.opis}</td>
		</tr>
		<tr>
			<td>Trajanje: ${film.trajanje}</td>
		</tr>
		<tr>
			<td>Uloge: ${film.uloge}</td>
		</tr>
		<tr>
			<td>Zanr: ${film.zanr}</td>
		</tr>
		<tr>
			<td><a href="${film.trailer}">Trailer</a></td>
		</tr>

	</table>


</body>
</html>