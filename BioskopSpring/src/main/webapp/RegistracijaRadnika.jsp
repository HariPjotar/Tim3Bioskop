<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<style>
<%@ include file="css/Repertoar.css"%>
</style>
<head>
<title>Registracija</title>
</head>
<%@ include file="navigation_bar.jsp"%>
<body class = "background2">
<div class = "center2">
	<sf:form modelAttribute="korisnik" action="/BioskopSpring/userController/registerR" method="post">
		<table class = "table">
			<tr>
				<td>Ime:</td>
				<td><sf:input path="ime" /></td>
			</tr>
			<tr>
				<td>Prezime:</td>
				<td><sf:input path="prezime" /></td>
			</tr>
			<tr>
				<td>e-mail:</td>
				<td>
					<sf:input path="email" />
				 	<sf:errors path="email"></sf:errors></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td>
					<sf:input path="username" />
					<sf:errors path="username"></sf:errors></td>
			</tr>
			<tr>
				<td>Sifra:</td>
				<td>
					<sf:password path="password" />
					<sf:errors path="password"></sf:errors></td>
			</tr>
			<tr>
				<td />
				<td><input class = "button" type="submit" value="Registracija">
			</tr>
		</table>
	</sf:form></div>

</body>
</html>