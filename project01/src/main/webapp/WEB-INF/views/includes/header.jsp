<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Flower Field</title>
<!-- google font - Montserrat -->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500&display=swap"
	rel="stylesheet" />
<!-- bootstrap 5.0 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/resources/css/app.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<nav id="mainNavbar"
		class="navbar navbar-light navbar-expand-md fixed-top p-3 py-0">
		<a class="navbar-brand" href="/">FLOWER FIELD</a>
		<button class="navbar-toggler" data-bs-toggle="collapse"
			data-bs-target="#navbarLinks" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarLinks">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="/" class="nav-link">HOME</a></li>
				<li class="nav-item"><a href="#" class="nav-link">ABOUT</a></li>
				<li class="nav-item"><a href="/board/list" class="nav-link">CONTACT</a>
				</li>
			</ul>
		</div>
	</nav>
	<main>