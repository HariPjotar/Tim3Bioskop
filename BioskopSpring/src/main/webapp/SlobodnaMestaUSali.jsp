<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
<%@include file ="css/mestaSala.css"%>
</style>
<meta charset="ISO-8859-1">
<title>Slobodna mesta u sali</title>
</head>
<body class="background">

	<div class="header">
		<h1>Pregled Mesta</h1>
	</div>
	<%@ include file="navigation_bar.jsp"%>
	<div class="center">
		<form action="/BioskopSpring/mestaController/potvrdiMesta" method="POST">
			<table>
				<c:forEach var="i" begin="1" end="${brojRedova}">
					<tr>
						<th>Red ${i}</th>
						<c:forEach var="j" begin="1" end="${brojKolona}">
							<c:set var="slobodno" value="${true}"/>
							<td>
							<c:forEach var="entry" items="${mapa}">
								<c:if test="${entry.key.red == i && entry.key.kolona== j && entry.value == 1}">
									X
									<c:set var="slobodno" value="${false}"/>
								</c:if>
							</c:forEach>
							<c:if test="${slobodno}">
								<input type="checkbox" name="mesto" value="${i},${j}">
							</c:if>
							</td>								
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<br> 
			<input type="submit" value="Pogledaj rezervaciju">
		</form>
	</div>
</body>
</html>