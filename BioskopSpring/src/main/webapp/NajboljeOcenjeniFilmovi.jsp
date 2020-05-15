<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
<%@ include file="css/Repertoar.css"%>
</style>

<head>
<meta charset="ISO-8859-1">
<title>Najbolje ocenjeni filmovi</title>
</head>
<body class = "background">
	<%@ include file="navigation_bar.jsp"%>
	<div class = "center"> 	
	<div class="header">
		<h1>Repertoar</h1>
	</div>
	<c:forEach items="${ocenjeniFilmovi}" var="p" varStatus="in">
		<form action="/BioskopSpring/filmController/vratiInfoFilm">
		<br>
			<table class = "table">
				<tr>
					<th><img src='${p.plakat}' height="350" width="250"></th>
				</tr>
				<tr>
					<td>${p.naslov} </td>
				</tr>
				<tr>
					<td>Prosecna ocena:${konacneOcene[in.index]}</td>
				</tr>
				<tr>
					<td><input class ="button" type="submit" value="Vise informacija"></td>
				</tr>
			</table>
			<input type="hidden" name="filmid" value = "${p.filmID }">
		</form>
	</c:forEach>
	</div>
</body>
</html>