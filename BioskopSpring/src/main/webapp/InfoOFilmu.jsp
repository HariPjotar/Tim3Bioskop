<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
<%@include file ="css/filmInfo.css"%>
h3 {
	text-align: center
}
</style>

<head>
<meta charset="ISO-8859-1">
<title>${film.naslov }</title>
</head>
<body class="background">
	<div class="header">
		<h1>${film.naslov }</h1>
	</div>

	<table class="table">

		<tr>
			<td>REDITELJ:</td>
			<td>${film.reditelj }</td>
			<td rowspan="6"><img src='${film.plakat }'></td>
		</tr>
		<tr>
			<td>ULOGE:</td>
			<td>${film.uloge }</td>
		</tr>
		<tr>
			<td>ZANR:</td>
			<td>${film.zanr }</td>
		</tr>
		<tr>
			<td>GODINA:</td>
			<td>${film.godina }</td>
		</tr>
		<tr>
			<td>TRAJANJE:</td>
			<td>${film.trajanje }</td>
		</tr>
		<tr>
			<td>OPIS:</td>
			<td>${film.opis }</td>
		</tr>
	</table>

	<div class="imageB">
		<object class="video" type="mp4" controls>
			<iframe src='${film.trailer}'></iframe>
		</object>

	</div>

	<br>
	<br>

	<form action = "/BioskopSpring/UserController/saveKomentar" method ="POST">
		<div class="komentarDiv1">
			<div class="header">
				<h4>KOMENTARI I OCENE:</h4>
			</div>
			<div class="komentarDiv2">
				<fieldset>
					<legend style="color: white">Postavite komentar i ocenite
						projekciju</legend>
					<div style="color: white">Ostavite komentar:</div>
					<br>
					<textarea rows="7" cols="50" name = "komentar">Vas komentar...</textarea>
					<br>
					<div style="color: white">Ocenite projekciju:</div>
					<br>
					<table border="1" class="center">
						<tr>
							<td></td>
							<td style="color: white">1</td>
							<td style="color: white">2</td>
							<td style="color: white">3</td>
							<td style="color: white">4</td>
							<td style="color: white">5</td>
						</tr>
						<tr>
							<td style="color: white">Ocena:</td>
							<td><input type="radio" name="ocena" value = "1"></td>
							<td><input type="radio" name="ocena" value = "2"></td>
							<td><input type="radio" name="ocena" value = "3"></td>
							<td><input type="radio" name="ocena" value = "4"></td>
							<td><input type="radio" name="ocena" value = "5"></td>
						</tr>
					</table>
					<input type="submit" value="Postavi komentar i ocenu"> <br>
					<br>
				</fieldset>
			</div>
			<br>
			<div class="komentarDiv2">
				<fieldset>
					<legend style="color: white">Recenzije</legend>
				</fieldset>
			</div>
		</div>
		<input type="hidden" name="filmid" value = "${film.filmID }">
	</form>
	
	<c:if test="${!empty komentar}">
		Uspesno je dodat komentar.
	</c:if>
	
</body>
</html>