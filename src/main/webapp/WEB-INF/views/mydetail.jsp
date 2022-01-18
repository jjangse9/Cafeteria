<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	
</head>


    <body>

        <h2>마이페이지</h2>
        <hr/>

		<form action="update" method="post"> 
        <table border="1">
            <tr>
                <td>아이디</td>
                <td>${info.mem_id}</td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td>${info.mem_nick}</td>
            </tr>
            <tr>
                <td>이메일 수신동의 여부</td>
                <td>${info.mem_emailchk}</td>
            </tr>
            
            
            
        </table>
      </form> 
        <input type="button" value="메인으로" class="btn" onclick="location.href='main'">
        </body>



</html>