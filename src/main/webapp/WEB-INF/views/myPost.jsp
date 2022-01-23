<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   
</head>
    <style>
    body{
    text-align: center;
    margin: 5% 20%;
    }
    
    table, th, td{
       border : 1px solid black;
       border-collapse:collapse;
       padding : 5px 10px;
    }
    </style>

    <body>
        <h2>내 글 확인</h2>
        <hr/>
      
      <table class="table table-hover">
          <thead>
            <tr>
               <th>작성일</th>
               <th>글번호</th>
               <th>제목</th>
               <th>좋아요</th>
               <th>조회수</th>
            </tr>
          </thead>
          <tbody>
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
           
          </tbody>
        </table>
      
      
        <!-- <tr>
            <td colspan="3" id="paging">
                   <div class="container">                           
                           <nav aria-label="Page navigation" style="text-align:center">
                          <ul class="pagination" id="pagination"></ul>
               </nav>               
            </div>
            </td>
        </tr> -->
        <input type="button" value="메인으로" class="btn" onclick="location.href='./'">
        </body>



</html>