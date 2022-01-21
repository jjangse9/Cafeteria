<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<style>
	tabel,th,td{
		border : 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}

	table{
		width: 700px;
	}
	</style>
</head>
<body>
<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="cb">
		<tr>
			<td>${cb.cafe_idx}</td>
			<td><a href="/detail?idx=${cb.cafe_idx}">${cb.cafe_title} | (별점 : ${cb.cafe_ratestaravg})</a></td>
			<td>${cb.mem_id}</td>
			<td>${cb.cafe_posttime}</td>
			<td>${cb.cafe_hit}</td>
		</tr>
		</c:forEach>
</table>
</body>
<script></script>
</html>