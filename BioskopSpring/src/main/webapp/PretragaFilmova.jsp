<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/pretraga.css"%>
</style>
<head>
<meta charset="ISO-8859-1">
<title>Pretraga Filmova</title>
</head>
<%@ include file="navigation_bar.jsp"%>
<body class="background">
	<div style="text-align: center">
		<p>Pretraga filmova po zanru:</p><br>
		<form action="/BioskopSpring/filmController/getFilmoviSaZanrom" method="GET">
			<select name="zanr">
				<c:forEach var="z" items="${zanrovi}">
					<option value="${z}">${z}</option>
				</c:forEach>
			</select><br><br>
			<input type="submit" value="Pretraga">
		</form>
	<br>
	</div>
	
	<div style ="text-align: center">
		<p>Pretraga filmova po godini:</p><br>
		<form action="/BioskopSpring/filmController/getFilmoviSaGodinom" method="GET">
			<input type="number" name="godina"><br><br>
			<input type="submit" value="Pretraga">
		</form>
	<br>
	</div>
	
	<div style="text-align: center">
		<p>Pretraga filmova po naslovu:</p><br>
		<form action="/BioskopSpring/filmController/getFilmoviSaNaslovom" method="GET">
			<input type="text" name="naslov"><br><br>
			<input type="submit" value="Pretraga">
		</form>
	<br>
	</div>
	<br>
	<br>
	<div style="text-align: center">
		<c:if test="${!empty filmoviSaZanrom}">
		<p>Filmovi trazenog zanra:<p>
		<table>
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
		<p>Filmovi trazene godine:</p>
		<table>
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
		<p>Filmovi sa trazenim naslovom:<p>
		<table>
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