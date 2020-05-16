<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
<%@ include file="css/Repertoar.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Unos Repertoara</title>
</head>
<body class = "background2">
	
	<form action = "/BioskopSpring/filmController/vratiKarte">
	<div class = "format">
	Odaberite prvi dan  <input type="date" name="startDate"><br>
	Odaberite zakljucni dan  <input type="date" name="endDate">
	<input class = "button "type="submit" value = "Odaberi">
	</div>
	<c:if test="${!empty karte}">
		<button class = "button" type="submit" formaction="/BioskopSpring/izvestajController/profit.pdf">Izgenerisi izvestaj</button>
	</c:if>
	</form>
</body>
</html>