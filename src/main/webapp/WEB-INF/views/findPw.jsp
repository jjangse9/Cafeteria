
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	 <meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	
</head>

<body>

<h2 align="center">비밀번호 찾기</h2>
<div align="center">
<p >이메일 주소를 입력해 주세요.</p>

<form action="findpassword" name="findpassword" method="post" >
	<table border="1" >
		
		<tr>
		<!-- 	<td>아이디</td> -->
			<td>e-mail</td>
		</tr>
		<tr>
			<!-- <td><input type="text" name="id"/></td> -->
			<td><input type="email" name="mem_id" /></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="비밀번호 찾기 " /></td>
			<!-- <td colspan="2"><input type="button" value="비밀번호 찾기 " onclick="search()" /></td> -->
		</tr>
	</table>
	
</form>
</div> 
<p align="center">로그인 페이지로 가시려면 <a href="./">바로가기</a>를 클릭하세요.</p>
</body>


<script type="text">

	
	</script>
</html>
