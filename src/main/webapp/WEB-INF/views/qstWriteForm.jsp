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
      th, td{
         width: 40%;
      }
   </style>
</head>
<body>
      <h2>일반 회원 문의하기</h2>
      <hr/>
		<br><br>
		 <!--업체명-->
		 <form action="qstWrite" method="post">
          <div class="form-group input-group">
              <div class="input-group-prepend">
                  <span class="input-group-text"> <a style="color: red;"></a>
                  <a>제    목  </a> 
                  </span>
              </div>
              <input name="qst_title" class="form-control" placeholder="제목을 입력해주세요" type="text"/>
          </div>
          
          <!-- 작성자 -->
          <div class="form-group input-group">
              <div class="input-group-prepend">
                  <span class="input-group-text"> <a style="color: red;"></a>
                  <a>작성자</a> 
                  </span>
              </div>
              <input name="mem_id" class="form-control" type="text" 
              placeholder="${mem_id }" value="${mem_id }" readonly>
          </div>
          
          
          
              <!--기타사항-->
          <div class="form-group input-group">
              <div class="input-group-prepend">
                  <span class="input-group-text"> <a>내    용  </a> </span>
              </div>
              <div class="form-control" style="height: auto;">
              <textarea name="qst_content" type="text" style="height: 190px;" 
              class="form-control" placeholder="요구사항 내용을 상세히 입력해주세요." 
              id="comment" name="comment" cols="45" rows="8" required=""></textarea>
             </div>
           </div>  
		
		<button type="submit" class="btn btn-success">문의하기</button>
		<button type="button" class="btn btn-outline-dark" onclick="location.href='./'">취소하기</button>
          </form>
			

</body>
</html>