<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS.css">
<meta charset="ISO-8859-1">
<title>Bioskop</title>
</head>
<body>
	<p>
		Ovo je neki tekst na glavnoj stranici.
	</p>
	
	<a href="/BioskopSpring/UnosFilma.jsp">Unesi novi film.</a> <br><br>
	
	<a href="/BioskopSpring/filmController/getFilmoviSalaSifarnik">Unesi novu projekciju.</a> <br><br>
	
	<a href="/BioskopSpring/UnosRepertoara.jsp">Odaberi datume projekcija.</a><br>
	
	<a href="/BioskopSpring/userController/registerUser">Registracija</a>
</body>
</html>