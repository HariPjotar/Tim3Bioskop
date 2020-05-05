<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slobodna mesta u sali</title>
</head>
<body>
	<form action="/BioskopSpring/filmController/potvrdiMesta" method="POST">
		<table border="1" style="text-align: center">
		<c:forEach var = "mesto" begin ="0" end = "1">
			
		</c:forEach>
			<c:forEach var="i" begin="1" end="${brojRedova}">
				<tr>
					<th>Red ${i}</th>
				
					<c:forEach var="j" begin="1" end="${brojKolona}">
						<!--<c:forEach var = "k" items="">
							<c:if test="${k[i] = i}"></c:if>
							</c:forEach>-->
						<td><input type="checkbox" name ="mesto" value ="${i},${j}"></td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		<br>
		<input type="submit" value="Pogledaj rezervaciju">
	</form>
</body>
</html>