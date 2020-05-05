<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
<%@include file ="css/pocetna.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Cinema Unvierse</title>
</head>
<body class="background">	
	<div class="header">
		<h1>Cinema Universe</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div class = "center">
		<div class="buttons">
			<a href="/BioskopSpring/filmController/nedeljniRepertoar">Nedeljni repertoar.</a><br><br><br><br>
	
			<a href="/BioskopSpring/filmController/getNajboljeOcenjeniFilmovi">Najbolje ocenjeni filmovi u prethodnih mesec dana.</a><br><br><br><br>
			
			<a href="/BioskopSpring/filmController/getFilmovi">Rezervacija</a><br><br><br>
		</div>
	</div> 
	
</body>
</html>