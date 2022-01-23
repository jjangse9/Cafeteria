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

			table{
			width: 800px;
			}

            table, tr, td, th{
                border: solid black 1px;
                border-collapse: collapse;
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
						      <th scope="col">확정</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${memResult}" var="admin">
						  
							    <tr>
							      <th scope="row">${admin.mem_id }</th>
							      <td>${admin.mem_nick }</td>
							      <td>${admin.mem_grade }</td>
							      <td>
								      	<input type="button" class="checkinfo" value="발급/취소" >
							      	
							      </td>
							      
							      <c:if test="${admin.mem_bcode ne null }">
							      <td id="bcode">${admin.mem_bcode }</td>
							      	</c:if>
							      	<c:if test="${admin.mem_bcode eq null }">
							      	<td id="bcode"></td>
							      	</c:if>
							      <td><input class="agreeBtn" type="button" value="확정"></td>
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
// 업주코드가 모두 포함되어 있는 배열 생성
	var bcodeList = [];
// db 테이블에 저장하기 전에 여기 이미 있는 값인지 확인하고 보낼거에요


	function rand(min, max) {
		  return Math.floor(Math.random() * (max - min)) + min;
	}

// 체크박스 선택시 업주코드가 비어있지 않다면 업주코드 발급( 5글자 난수 )
	$('.checkinfo').click(function(){
		console.log(this);
		console.log($(this).parent().next().html());
				
		if($(this).parent().next().html() == ''){
			// 5글자 난수 생성
			var bcode = rand(9999, 100000);

			
			// 중복을 막기 위해 10번정도 실행
			for(var i=0; i<10; i++){
				// 업주코드 배열에 방금 생성한 난수가 없다면
				if(bcodeList.includes(bcode)){
					bcode = rand(9999, 100000);
				}
			}	
				$(this).parent().next().html(bcode);
		
		}else{
			$(this).parent().next().html('');
		}
		
		console.log(bcode);
		
		
	});
	
	$('.agreeBtn').click(function(){
		//console.log($(this).parent().prev().prev().prev().prev().prev().html());
		
		var id = $(this).parent().prev().prev().prev().prev().prev().html();
		var bcode = $(this).parent().prev().html();
		
		console.log(id);
		console.log(bcode);
		
		
		// 업주코드 값 넣고 빼기
	  		$.ajax({
	        type:'POST',
	        url:'bcodeEdit',
	        data:{'mem_id':id,'bcode':bcode},
	        dateType:'JSON', //hashmap 으로 보내줘야 받아올 수 있어요
	        success:function(data){
	        console.log("안녕하세요"+data);
	        
	        },
	        error:function(e){
	        
	        	console.log(e);
	        }
	        
	        
	    });
		 
	});
	
	
	
</script>

















