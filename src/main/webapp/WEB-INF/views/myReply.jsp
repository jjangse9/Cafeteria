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
      <h2>내 댓글 확인 내역</h2>
      <hr/>

      <h3>작성한 댓글</h3>
      <table class="table table-hover">
      <thead>
            <tr>
                <th scope="col">작성일</th>
                <th scope="col">수정일</th>
                <th scope="col">내용</th>
                <th scope="col">좋아요</th>
                <th scope="col">별점</th>
                <th scope="col">대댓글 수</th>
            </tr>
      </thead>
      <tbody>
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
      </tbody>
        </table>
        
        <hr/>
        
        <h3>작성한 대댓글</h3>
        <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">작성일</th>
                <th scope="col">수정일</th>
                <th scope="col">내용</th>
                <th scope="col">좋아요</th>
            </tr>
        </thead>
        <c:forEach var="rec" items="${myRecomment}">
        <tbody>
           <%-- ${myList}  --%>
          <tr>
          <td>${rec.recomment_posttime}</td>
          <td>${rec.recomment_modtime}</td>
          <td style="width:40%;">${rec.recomment_content}</td>
          <td>${rec.recomment_likecnt}</td>
          </tr>
          </c:forEach>
          </tbody>
        </table>
        
        <input type="button" value="메인으로" class="btn" onclick="location.href='./'">
        </body>

</html>
<script>
function formatDate(date){
        var d = new Date(date);
        
        // 출력 모양 변경( yyyy-mm-dd )
        month = '' + (d.getMonth() + 1), 
        day = '' + d.getDate(), 
        year = d.getFullYear(); 
        
        if (month.length < 2) {
            month = '0' + month;            
        }
        if (day.length < 2) {
            day = '0' + day;            
        }
        
        return [year, month, day].join('-');

    }


</script>