<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" href="resources/css/common.css" type="text/css">
	<style></style>
</head>



	<body>
        <h1>회원가입</h1>
        <hr>
       	<jsp:include page="loginBox.jsp"/>
       
       <a href="./mydetail?mem_id=${loginId}">상세보기 </a>
       <!--  ./detail-->
       
  		<a href="./myList?mem_id=${loginId}">내 글 보기 </a>
  		
  		
  		<a href="./testlist?mem_id=${loginId}">임시리스트</a>

    </body>


