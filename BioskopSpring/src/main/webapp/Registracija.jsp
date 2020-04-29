<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registracija</title>
</head>
<body>
	<sf:form modelAttribute="korisnik" action="/BioskopSpring/userController/register" method="post">
		<table>
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
				<td><input type="submit" value="Registracija">
			</tr>
		</table>
	</sf:form>

</body>
</html>