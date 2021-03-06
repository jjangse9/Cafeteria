<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" href="resources/css/common.css" type="text/css">
	
</head>
<body>
	<div >
		<div >
			<div>
				<h3>비밀번호 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					비밀번호  : ${pw}
					<!--  스트링으로 받았을 떄에는 중간에 . 을 써주지 않는다. .을 쓰는 이유는 해쉬맵(배열)으로 받아올 경우**-->
				</h5>
				<p >
					<button type="button" id=loginBtn>로그인</button>
					<button type="button" id=mainBtn>메인으로</button>
					
				</p>
			</div>
		</div>
	</div>
</body>
    
    <script>
    
    
        $(function(){
            $("#loginBtn").click(function(){
                location.href='./loginPage';
            })
        });
        
        
        $(function(){
            $("#mainBtn").click(function(){
                location.href='./main';
                
            	// 20220122 => 그냥 main으로 때리면 안되고, 부모창의 정보가 있어야 한다.
				// 부모창(원래 보던 창) 새로고침
				opener.document.location.reload();
				
				// 자식창(현재 로그인 창)을 끄기
				window.close();
				// 20220122 => 그냥 main으로 때리면 안되고, 부모창의 정보가 있어야 한다.
            })
        });
        
    </script>
</html>