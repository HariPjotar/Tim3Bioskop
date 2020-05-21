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
		<!-- Sa prvim forEach-om prolazimo kroz redove -->
			 <c:forEach var="i" begin="1" end="${brojRedova}">
				<tr>
					<th>Red ${i}</th>
					<c:forEach var="j" begin="1" end="${brojKolona}">
					<!-- Sa drugim forEach-om prolazimo kroz kolone -->
						<c:forEach var="k" items="${listaRedova}">
								<c:forEach var="l" items="${listaKolona}">
								<!-- Ideja sa trecim i cetvrtim forEach-om je da prodju kroz liste kolona/redova(I-ova i J-ova) koje treba rezervisati,
								 i da se na kraju to mesto precrta X-om, tako da vise ne bi moglo da se rezervise. Problem je sto on pokupi prvi I, i sa
								 svakim J-om u listi napravi rezervaciju. Liste listaKolona i listaRedova ok rade, u smislu da stvarno vrate sve kombinacije,
								 odnosno sve I-ove i J-ove koje treba rezervisati, samo je u for-ovima problem.-->
									<c:if test="${(k == i) && (l == j)}">
									<input type = "hidden" value = "${trebaMesto = trebaMesto + 1}">
									</c:if>
								</c:forEach>
							</c:forEach>
							<td>
							<c:choose>
								<c:when test="${trebaMesto > 0}">
								<!-- Slucaj kada treba da rezervise mesto -->
									X
									<input type = "hidden" value = "${trebaMesto = 0}">
								</c:when>
								<c:otherwise>
								<!-- Slucaj kada ne treba da rezervise mesto. -->
									<input type="checkbox" name="mesto" value="${i},${j}">
								</c:otherwise>
							</c:choose>
							</td>
					</c:forEach>
				</tr>
			</c:forEach>
			<!-- Takodje, u nekoj iteraciji fajla izgubilo se precrtavanje prethodno rezervisanih mesta. 
			Na primer, rezervisemo mesto 1,1, sacuvamo rezervaciju, i sledeci put kad udjemo da rezervisemo mesto, 1,1 je precrtano kako treba. Neka
			drugi put rezervisemo mesto 2,2. Sad kada treci put udjemo da rezervisemo mesto, samo je mesto 2,2 precrtano, a 1,1 moze opet da se rezervise. -->
		</table>
		<br>
		<br> <input type="submit" value="Pogledaj rezervaciju">
	</form>
</body>
</html>