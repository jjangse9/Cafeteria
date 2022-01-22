<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" href="resources/css/common.css" type="text/css">
	
</head>

<body>

<form action="pwupdate"  method="post">

 	<div>
 		<label for="mem_id">아이디(이메일)</label>
 		<input type="text" name=mem_id value="${userId}" readonly/>
 	</div>
 	
 	<div>
 		<label for="mem_pw">새 비밀번호</label>
 		<input type="text" name="mem_pw"  value="${info.mem_pw}"/>
 	</div>
 	
 	<div>
 	
 		<button type="submit">회원정보 수정</button>
 		
 	</div>
 	
</form>

	<div>
		<input type="button" value="메인으로" class="btn" onclick="location.href='main'">
	</div>
</body>
</html>