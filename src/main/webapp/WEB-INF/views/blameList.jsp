<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<!-- 이 링크가 무엇을 뜻하는지 나중에 다시 알아보기! -->
	<!-- 리소시즈를 불러오도록 해주는 거야. 밑에있는 이 링크는. -->
	<link rel="styleSheet" type="text/css" href="resources/css/common.css">
	<style></style>
</head>
<body> <!-- 1.컨트롤러에서 받아오는지만 먼저 찍어보자.  -->
   <%--   ${list} --%>
   
   <button onclick="location.href='blameWriteForm'">글쓰기</button>
   &ensp;&ensp;&ensp;
   <button onclick="location.href='main'">목록으로</button>

   
   <table>
   <tr>
   <th>글번호</th>
   <th>제목</th>
   <th>작성자</th>
   <th>작성일</th>
   <th>조회수</th>
   </tr>




   <!-- 작성자가 하나도 없는 경우 에는 -> 아래의 경우로 해결한다.   -->
   <c:if test="${list eq null || size == 0}">
   <tr><td colspan="5">등록된 글이 없습니다.</td></tr>
   </c:if>

   
   
   
   <c:forEach items="${list}" var="blame">
   <tr>
   <td>${blame.blame_idx}</td>
   <td><a href="detail?idx=${blame.blame_idx}">${blame.blame_title}</a></td>
   <td>${blame.mem_id}</td>
   <td>${blame.blame_posttime}</td>
   <td>${blame.blame_cnt}</td>
   </tr>
   
   
   
   
   </c:forEach>
   </table>

</body>
<script></script>
</html>