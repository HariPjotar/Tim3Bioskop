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
	<form action="/BioskopSpring/mestaController/potvrdiMesta"
		method="POST">
		<table border="1" style="text-align: center">
			<c:forEach var="i" begin="1" end="${brojRedova}">
				<tr>
					<th>Red ${i}</th>
					<c:forEach var="j" begin="1" end="${brojKolona}">
						<td><c:forEach var="entry" items="${mapa}">
								key is ${entry.key }
								${entry.key.red }
								${entry.key.kolona }
								${entry.value}
							<c:choose>
									<c:when test="${entry.value == 1}">
									X
								</c:when>
									<c:otherwise>
										<input type="checkbox" name="mesto" value="${i},${j}">
									</c:otherwise>
								</c:choose>
							</c:forEach></td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		<br> <input type="submit" value="Pogledaj rezervaciju">
	</form>
</body>
</html>