l<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/filmInfo.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Pretraga Filmova</title>
</head>
<body>
	<div style="text-align: center">
		Pretraga filmova po zanru:<br>
		<form action="/BioskopSpring/filmController/getFilmoviSaZanrom" method="GET">
			<select name="zanr">
				<c:forEach var="z" items="${zanrovi}">
					<option value="${z}">${z}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Pretraga">
		</form>
	<br>
	</div>
	
	<div style ="text-align: center">
		Pretraga filmova po godini:<br>
		<form action="/BioskopSpring/filmController/getFilmoviSaGodinom" method="GET">
			<input type="number" name = "godina">
			<input type="submit" value="Pretraga">
		</form>
	<br>
	</div>
	
	<div style="text-align: center">
		Pretraga filmova po naslovu:<br>
		<form action="/BioskopSpring/filmController/getFilmoviSaNaslovom" method="GET">
			<input type = "text" name = "naslov">
			<input type="submit" value="Pretraga">
		</form>
	<br>
	</div>
	<br>
	<br>
	<div style="text-align: center">
		<c:if test="${!empty filmoviSaZanrom}">
		<div>Filmovi trazenog zanra:</div>
		<table border="1" class="center">
			<tr>
				<th>Film</th>
			</tr>
			<c:forEach var="i" items="${filmoviSaZanrom}">
				<tr>
					<td>${i.naslov}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	<c:if test="${!empty filmoviSaGodinom}">
		<div>Filmovi trazene godine:</div>
		<table border="1" class="center">
			<tr>
				<th>Film</th>
			</tr>
			<c:forEach var="i" items="${filmoviSaGodinom}">
				<tr>
					<td>${i.naslov}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	<c:if test="${!empty filmoviSaNaslovom}">
		<div>Filmovi sa trazenim naslovom:</div>
		<table border="1" class="center">
			<tr>
				<th>Film</th>
			</tr>
			<c:forEach var="i" items="${filmoviSaNaslovom}">
				<tr>
					<td>${i.naslov}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>

</body>
</html>