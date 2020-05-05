<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/pocetna.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Niste ulogovani!</title>
</head>
<body class = "background">
	<div class="header">Niste ulogovani!</div>
	<br><br><br>
	<div class="center">
		<div class = "buttons">
			<p>Morate biti ulogovani da bi pristupili ovoj stranici!</p>
			<br><br><br>
			<a href="/BioskopSpring/userController/loginPage">Login</a>
			<br><br><br>	
			<p>Nemate nalog? <a href="/BioskopSpring/userController/registerUser">Registrujte se</a></p>
			<br><br><br>
			<a href="/BioskopSpring">Povratak na glavnu stranicu.</a>
			<br><br><br>
			<p>Ukoliko ste ulogovani, a vidite ovu poruku, nemate pravo pristupa ovoj stanici!</p>
		</div>
	</div>
</body>
</html>