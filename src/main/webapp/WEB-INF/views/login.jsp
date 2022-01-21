<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet" href="resources/css/common.css" type="text/css">
	<style>
	
	div{
    text-align: center;
}


    #login1{
        margin-top: 300px;
    }


    #zero{
        border: 1px solid rebeccapurple;
        width: 502px;
        height: 800px;
        margin-top: 130px;
        margin-left: 698px;
    }

    #login2{
        background-color: aquamarine;
        width: 500px;
        height: 90px;

    }

    #login3{
        background-color: cadetblue;
        width: 500px;
        height: 90px;
    }

    #login4{
        background-color: rebeccapurple;
        width: 500px;
        height: 90px;
    }


    a:link{
                    color: black;
                    text-decoration: none;
                    
                }
                a:visited{
                    color:lightgray;
                    text-decoration: none;
                }
                a:hover{
                    text-decoration: underline;
                }
                a:active{
                    color: crimson;
                }

                li{
                    list-style: none;
                }
	
	
	
	
	
	</style>
</head>
<body>

<div id="login1">
	<h3>로그인</h3>
	<hr/>
</div>


	
		<div id="zero">
		
		<div id="login2">
			<th>ID</th>
			<td><input type="email" id="mem_id"/></td>
			</div>
		
		
		<div id="login3">
			<th>pw</th>
			<td><input type="password" id="mem_pw"/></td>
			</div>
		
	
		<div id="login4">
			<th colspan="2">
			<input type="button" id="login" value="LOGIN"/>
			<input type="button" value="회원가입" onclick="location.href='joinForm'"/>
			</th>
			
		<li><a href="./findPw" target="_parent">
        비밀번호 찾기
    	</a></li>
			</div>
		
</div>
</body>
<script>




$('#login').click(function(){
	
	var mem_id = $('#mem_id').val();
	var mem_pw = $('#mem_pw').val();
	console.log(mem_id+'/'+mem_pw);
	
	
	$.ajax({
		type:'POST',
		url:'login',
		data:{'mem_id':mem_id,'mem_pw':mem_pw},
		dateType:'JSON', //hashmap 으로 보내줘야 받아올 수 있어요
		success:function(data){
			console.log("안녕하세요"+data.memInfo);
			if(data.memInfo != null){
				alert(data.memInfo.mem_nick+'님 반갑습니다.');
				location.href='./main';
			}else if(data.memInfo === null){
				alert('아이디 또는 패스워드를 확인하세요.')
			}
		},
		error:function(e){
			
			console.log(e);
		}
		
		
	});
	
});




</script>
</html>