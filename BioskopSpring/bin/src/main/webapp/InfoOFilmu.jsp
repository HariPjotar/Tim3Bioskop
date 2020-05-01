<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
<%@ include file="css/filmInfo.css"%>
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
			<td rowspan="6"><img src='${film.plakat }'>
			</td>
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
</body>
</html>