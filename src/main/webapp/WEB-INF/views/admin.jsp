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
		margin: 10%;
		}
	   
       .adnavi{
       		
            }
            ul, li{
                list-style: none;
            }

            .adnavi{
                float: left;

                width: 100%;

                height: 700px;
            }
            .boardFrame{
                float: right;
                width: 1300px;
                margin-right: 15%;

            }

            table,tr,td,th{
                border: solid black 1px;
                border-collapse: collapse;
                width: 800px;
            }
            
   </style>
</head>
<body>
      <h1>관리자페이지</h1>
        <hr>
    <div class="adnavi">
		<br>
		<div class="row">
		  <div class="col-2" style="height:600px; background-color:purple;">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" 
		      href="#list-home" role="tab" aria-controls="home">회원 등급 수정</a>
		      
		      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" 
		      href="#list-profile" role="tab" aria-controls="profile">회원 관리</a>
		      
		      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" 
		      href="#list-messages" role="tab" aria-controls="messages">글 관리</a>
		      
		      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
		      href="#list-settings" role="tab" aria-controls="settings">문의/신고 처리</a>
		    </div>
		  </div>
		  <div class="col-10" style="width:100%; height:auto;">
		    <div class="tab-content" id="nav-tabContent">
		      
		      <!-- 회원 등급 수정 -->
		      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
						<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">회원 아이디</th>
						      <th scope="col">닉네임</th>
						      <th scope="col">회원등급</th>
						      <th scope="col">업주 회원으로</th>
						      <th scope="col">업주코드</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${memResult}" var="admin">
						  
							    <tr>
							      <th scope="row">${admin.mem_id }</th>
							      <td>${admin.mem_nick }</td>
							      <td>${admin.mem_grade }</td>
							      <td style="width:15%; padding-top:17px;">
							      	<input type="checkbox" class="checkinfo" value="grade" >
							      </td>
							      <td id="bcode"></td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>

		      </div>
		      <!-- 회원 관리 -->
		      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
					<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">회원 아이디</th>
						      <th scope="col">닉네임</th>
						      <th scope="col">회원등급</th>
						      <th scope="col">업주 회원으로</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${memResult}" var="admin">
						  
							    <tr>
							      <th scope="row">${admin.mem_id }</th>
							      <td>${admin.mem_nick }</td>
							      <td>${admin.mem_grade }</td>
							      <td style="width:15%"></td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>
					
					
			 	</div>
			 	
			 	<!-- 글 관리 -->
		      <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
					<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">글제목(식당)</th>
						      <th scope="col">글내용</th>
						      <th scope="col">별점</th>
						      <th scope="col">가격</th>
						      <th scope="col">작성자 아이디</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${cafeResult}" var="cafe">
						  
							    <tr>
							      <th scope="row">${cafe.cafe_title }</th>
							      <td>${cafe.cafe_content }</td>
							      <td>${cafe.cafe_ratestaravg }</td>
							      <td>${cafe.cafe_diet_price }</td>
							      <td>${cafe.mem_id }</td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>
				</div>
				
				<!-- 문의/신고 처리 -->
		      <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
					문의/신고 처리
				</div>
		    </div>
		  </div>
		</div>
       

    </div>


      
</body>
</html>
<script>
	$('.checkinfo').click(function(){
		console.log(this);
		
		console.log($(this).next().next());
	});
</script>

















