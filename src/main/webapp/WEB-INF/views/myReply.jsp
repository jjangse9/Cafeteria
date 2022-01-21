
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   
</head>
    <style>
table, th, td{
   border : 1px solid black;
   border-collapse:collapse;
   padding : 5px 10px;
}
    </style>

    <body>
      <h2>내 댓글 확인 내역</h2>
      <hr/>

      <h3>작성한 댓글</h3>
      <table>
            <tr>
                <th>작성일</th>
                <th>수정일</th>
                <th>내용</th>
                <th>좋아요</th>
                <th>별점</th>
                <th>대댓글 수</th>
            </tr>
        <c:forEach var="rep" items="${myReply}">
         <tr>
         <td>${rep.cafereply_posttime}</td>
         <td>${rep.cafereply_modtime}</td>
         <td>${rep.cafereply_content}</td>
         <td>${rep.cafereply_likecnt}</td>
         <td>${rep.cafereply_ratestar}</td>
         <td>${rep.cafereply_recommentcnt}</td>
         </tr>
      </c:forEach>
      
        </table>
        
        <hr/>
        
        <h3>작성한 대댓글</h3>
        <table>
            <tr>
                <th>작성일</th>
                <th>수정일</th>
                <th>내용</th>
                <th>좋아요</th>
            </tr>
        <c:forEach var="rec" items="${myRecomment}">

       <%-- ${myList}  --%>
      <tr>
      <td>${rec.recomment_posttime}</td>
      <td>${rec.recomment_modtime}</td>
      <td>${rec.recomment_content}</td>
      <td>${rec.recomment_likecnt}</td>
      </tr>
      </c:forEach>
      
        </table>
        
        <input type="button" value="메인으로" class="btn" onclick="location.href='main'">
        </body>



</html>