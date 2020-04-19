<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS.css">
<meta charset="ISO-8859-1">
<title>Repertoar</title>
</head>
<body>


	<c:forEach items="${proj}" var="p">
		<form action="/BioskopSpring/filmController/vratiInfoFilm">
			<table>
				<tr>
					<th><img src='${p.film.plakat}' height="200" width="150"></th>
				</tr>
				<tr>
					<td>${p.film.naslov} </td>
				</tr>
				<tr>
					<td>${p.vreme}</td>
				</tr>

			</table>
			<input type="hidden" name="filmid" value = "${p.film.filmID }">
			<input type="submit" value="info">
		</form>

	</c:forEach>

</body>
</html>