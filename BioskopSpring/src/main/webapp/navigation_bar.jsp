<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/navigationBar.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<br><br><br>
	<div class="topnav">
  		<a href="/BioskopSpring/pocetna.jsp">Pocetna</a>
  		<a href="/BioskopSpring/filmController/nedeljniRepertoar">Repertoar</a>
  		<a href="/BioskopSpring/filmController/getNajboljeOcenjeniFilmovi">TOP Filmovi</a>
  		<s:authorize access="hasRole('ADMIN')">
			<a href="/BioskopSpring/UnosFilma.jsp">Unos novog filma</a>
			<a href="/BioskopSpring/filmController/getFilmoviSalaSifarnik">Unos nove projekcije</a></li>
		</s:authorize>
			<a href="/BioskopSpring/logout">LOG OUT</a>
	</div>
	<br><br><br>
</body>
</html>