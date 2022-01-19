<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="login"></div>

<script>

var loginId = "${sessionScope.loginId}";

// 세션 스코프를 쓰면 세션에 들어갈 수가 있다.
//만약에 로그인 아이디가 아무것도 없다면 얼랏을 보여줄거야.

if(loginId != ""){
	$("#login").html('안녕하세요'+loginId+'님, <a href="logout">[로그아웃]</a>');	
}



</script>
