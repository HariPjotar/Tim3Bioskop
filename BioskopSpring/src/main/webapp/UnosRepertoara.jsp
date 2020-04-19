<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="CSS.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form action = "/BioskopSpring/filmController/nedeljniRepertoar">
	
	Odaberite prvi dan<input type="date" name="startDate">
	Odaberite poslednji dan<input type="date" name="endDate">
	<input type="submit" value = "Odaberi">
	
	</form>
</body>
</html>