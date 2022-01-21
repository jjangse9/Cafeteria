
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
        <h2>내글 확인 내역</h2>
        <hr/>
        
       <table>
            <tr>
               <th>작성일</th>
                <th>글번호</th>
                <th>제목</th>
                <th>좋아요</th>
                <th>조회수</th>
            </tr>
        <c:forEach var="mychk" items="${myPost}">

       <%-- ${myList}  --%>
      <tr>
      <td>${mychk.cafe_modtime }</td>
      <td>${mychk.cafe_idx}</td>
      <td>${mychk.cafe_title}</td>
      <td>${mychk.cafe_hit}</td>
      <td>${mychk.cafe_likecnt }</td>
      </tr>
      </c:forEach>
      
        <!-- <tr>
            <td colspan="3" id="paging">
                   <div class="container">                           
                           <nav aria-label="Page navigation" style="text-align:center">
                          <ul class="pagination" id="pagination"></ul>
               </nav>               
            </div>
            </td>
        </tr> -->
        </table>
        <input type="button" value="메인으로" class="btn" onclick="location.href='main'">
        </body>



</html>