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
   <style>
      body{
         margin: 10% 20%;
         text-align: center;
      }
      .table{
         width: 100%;
         height: auto;
         text-align: center;
      }
     /*  th, td{
         width: 10%;
      } */
   </style>
</head>
<body>
      <h2>내 문의 내역</h2>
      <hr/>
		<br><br>
		
		
		
		
<!-- 20220122 - 문의 리스트 보기 -->		
		<span style="float:left; width:100%; text-align:left;"> 처리 중인 문의</span> <br><hr><br>
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">문의일</th>
		      <th scope="col">작성자</th>
		      <th scope="col">문의 제목</th>
		      <th scope="col">간단한 내용</th>
		    </tr>
		  </thead>
		  <c:forEach items="${qstInfo}" var="qst">
		  <c:if test="${qst.qst_stat eq 1 }">
			  <tbody>
			    <tr>
			      <th scope="row">${qst.qst_posttime }</th>
			      <td>${qst.mem_id }</td>
			      <td>${qst.qst_title }</td>
			      <td style="width:40%;">${qst.qst_content }</td>
			    </tr>
			  </tbody>
		  </c:if>
		  </c:forEach>
		</table>
		
		<hr><br><span style="float:left; width:100%; text-align:left;"> 처리된 문의 </span> <br><hr><br>
		
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">문의일</th>
		      <th scope="col">문의 제목</th>
		      <th scope="col">간단한 내용</th>
		      <th scope="col">답변 내용</th>
		    </tr>
		  </thead>
		  <c:forEach items="${qstInfo}" var="qst">
		  <!-- 문의 상태가 2일때 => 답변 완료일때 -->
		  <c:if test="${qst.qst_stat eq 2 }">
			  <tbody>
			    <tr>
			      <th scope="row">${qst.qst_posttime }</th>
			      <td>${qst.qst_title }</td>
			      <td>${qst.qst_content }</td>
			      <td style="width:40%;">${qst.qst_answer }</td>
			    </tr>
			  </tbody>
		  </c:if>
		  </c:forEach>
		</table>
		
		<br/><br/>
		 <button type="button" class="btn btn-outline-dark" onclick="location.href='./myStat'">돌아가기</button>
			

</body>
</html>