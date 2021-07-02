<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ASE Project</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<header>
		<a href="index.do">
			<img src="">
		</a>
		<div class="logo_name">
			<h1><a href="index.do">키.사.모</a></h1>
			<p>키위를 사랑하는 모임</p>
		</div>
		<p class="member_info">
			<c:if test="${login == null}">
				<a href="loginPage.do">로그인</a>
				<a href="joinPage.do">회원가입</a>
			</c:if>
			<c:if test="${login != null}">
				<p>${loginDTO.name}님 반갑습니다</p>
				<a href="logout.do">로그아웃</a>
				<a href="myPage.do">마이페이지</a>	
			</c:if>
		</p>
	<nav>
		<ul>
			<li><a href="galaryPage.do">갤러리</a></li>
			<li><a href="freePage.do">자유게시판</a></li>
		</ul>
	</nav>
	</header>
	<section>