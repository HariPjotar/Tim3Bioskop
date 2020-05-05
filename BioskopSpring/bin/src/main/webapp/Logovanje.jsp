<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<html>
<style>
<%@ include file="css/Repertoar.css"%>
</style>
<body class = "background2">
	<div class ="center2">
	<c:url var="loginUrl" value="/login" />
	<form action="${loginUrl}" method="post">
		<table class= "table">
			<tr>
				<td>Username:</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /></td>
				<td><input class = "button" type="submit" value="Log in"></td>
			</tr>
		</table>
		<p class = "p1" >Nemate nalog? <a href="/BioskopSpring/userController/registerUser">Registrujte se</a></p>
	</form>
	</div>
</body>
</html>