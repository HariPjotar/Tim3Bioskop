<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
<%@ include file="Repertoar.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Unos Repertoara</title>
</head>
<body class = "background2">
	
	<form action = "/BioskopSpring/filmController/nedeljniRepertoar">
	<div class = "format">
	Odaberite prvi dan  <input type="date" name="startDate"><br>
	Odaberite poslednji dan  <input type="date" name="endDate">
	<input class = "button "type="submit" value = "Odaberi">
	</div>
	</form>
</body>
</html>