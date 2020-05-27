<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/pocetna.css"%>
</style>
<head>
<link rel="stylesheet" type="text/css" href="CSS.css">
<meta charset="ISO-8859-1">
<title>Bioskop</title>
</head>
<body class="background">	
	<div class="header">
		<h1>Cinema Universe</h1>
	</div>
	<div class = "center">
		<div class="buttons">
			<a href="/BioskopSpring/filmController/nedeljniRepertoar">Nedeljni repertoar</a><br><br><br><br>
	
			<a href="/BioskopSpring/filmController/getNajboljeOcenjeniFilmovi">Najbolje ocenjeni filmovi u prethodnih mesec dana</a><br><br><br><br>
			
			<a href="/BioskopSpring/filmController/getZanrFilma">Pretraga filmova</a><br><br><br><br>
			
			<a href="/BioskopSpring/userController/loginPage">Login</a><br><br><br><br>
			
			<a href="/BioskopSpring/userController/registerUser">Registracija</a><br><br><br><br>
			
		</div>
	</div>	
</body>
</html>