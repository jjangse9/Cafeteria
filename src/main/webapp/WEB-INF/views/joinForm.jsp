<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<link rel="stylesheet"  type="text/css" href="resources/css/common.css">
	<style>
	
	 div.reg {
          font-size: 14px;
          width: 120px;
          float: left;
      }

      div{
          margin-bottom: 50;
      }
      .wrapper {
    margin-top: 99px;
    margin-left: 717px;
}


    .error{
    font-size: 1px;
    height: 20px;
    color:red;
    font-weight: 700;
}

.title {
    margin-top: 268px;
    margin-left: 764px;
    width: 200px;
    border: 3px solid red;
}

#captcha {
    border: solid greenyellow;
    margin-left: 767px;
    width: 307px;
}
	
	
	
	
	
	</style>
</head>






<body>


        <div class="title"><h1 style="font-size: 21px;">회원가입</h1></div>
        
        
        
        
        
    <div class="wrapper">
        
        <div class="mem_email">
          <!--   email<input id="mem_email" type="text" name="mem_email" placeholder="이메일을 입력해 주세요."> -->
                <div class="reg">email</div>
                
                <input id="mem_id" type="email" name="mem_id" placeholder="이메일을 입력해 주세요.">
                <input type="button" id="overlay" value="중복체크"/>
            <div id="emailError" class="error"></div>
        </div>
        
        
        <div class="mem_pw">
           <!--  mem_mem_pw<input id="mem_mem_mem_pw" type="password"  name="mem_mem_mem_pw" placeholder="비밀번호를 입력해 주세요."> -->
              <div class="reg">
              pw
              </div>
              
              <input  id="mem_pw" type="password"  name="mem_pw" placeholder="비밀번호를 입력해 주세요.">
            <div id="passwordError" class="error"></div>
        </div>
        <div class="mem_pwchk">
          <!--   mem_mem_pwchk<input id="mem_mem_mem_pwchk" type="password" name="mem_mem_mem_pwchk" placeholder="비밀번호를 다시 입력해 주세요."> -->
               <div class="reg">
               pwchk
               </div>
               <input id="mem_pwchk" type="password" name="mem_pwchk" placeholder="비밀번호를 다시 입력해 주세요.">
            <div id="passwordCheckError" class="error"></div>
        </div>
        
        <div class="name">
        <div class="reg">
          name
          </div>
          <input id="mem_nick"  type="text" name="mem_nick"  placeholder="이름을 입력해 주세요."> 
            <div id="nameError" class="error"></div>
        </div>
        <div class="mem_emailchk">
        <div class="reg">
            이메일 수신 동의
            </div>
            <input id="mem_emailchky" type="radio" name="mem_emailchk" value = '1' checked>동의  
            <input id="mem_emailchkn" type="radio" name="mem_emailchk" value = '0'>거부
            <div id="emailchkError" class="error"></div>
        </div>
        <div class="line">
            <hr>
        </div>
        <div class="signUp">
            <button id="regist" onclick="signUpCheck()">가입하기</button>
        </div>
       </div>
    

	<!-- 리캡챠 사용 방식 -->
	<div id="captcha">
	 <script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<div class="g-recaptcha" data-sitekey="6LfEqgkeAAAAAPyHmljpUwjDdIuEUDJKuPP8lPX9"></div>
	</div>



</body>
<script>
var check = false;

//회원가입
$("#regist").click(function(){
		console.log('click');
	
		 
	if(check){

		console.log('회원가입 시작');
		
		var $mem_id = $('input[name="mem_id"]');
		var $mem_pw = $('input[name="mem_pw"]');
		var $mem_pwchk = $('input[name="mem_pwchk"]');
		var $mem_nick = $('input[name="mem_nick"]');
		var $mem_emailchk = $('input[name="mem_emailchk"]:checked');
		
		console.log($mem_id);
		
		
		

	if($mem_id.val() == ''){
		alert('아이디를 입력 해 주세요');
		$mem_id.focus();
	}else if($mem_pw.val() == ''){
		alert('비밀 번호를 입력 하세요');
		$mem_pw.focus();
	}else if($mem_pwchk.val() == ''){
		alert('비밀번호를 확인해 주세요');
		$mem_pwchk.focus();
	}else if($mem_nick.val() == ''){
		alert('닉네임을 입력해 주세요');
		$mem_nick.focus();
	}else if($mem_emailchk.val() == ''){
			alert('이메일동의여부를 확인해 주세요');
			$mem_emailchk.focus();
	}else if($mem_pw.val() != $mem_pwchk.val()){
		alert('비밀번호가 틀립니다.');
		$mem_pwchk.focus();
	}else {// 모두 입력했을 경우...
		console.log('서버 전송 시작');
	
	
	
	
	var param = {'mem_id':$mem_id.val()};
	param.mem_pw = $mem_pw.val(); 
	param.mem_pwchk = $mem_pwchk.val();
	param['mem_nick'] = $mem_nick.val();
	param.mem_emailchk = $mem_emailchk.val();
	
	console.log(param);
	console.log(param.mem_emailchk);
	
	
	 	$.ajax({
			type:'POST',
			url:'join',
			data:param,
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.success == 1){
					alert('회원가입을 축하 드립니다.');
					location.href='./';
				}else{
					alert('회원가입에 실패 했습니다. 다시 시도해 주세요.');
				}
			},
			error:function(e){
				console.log(e);
					alert('서버에 문제가 발생했습니다. 고객센터에 문의해 주세요.')
				}
			});	
	}
		
	}else{	
		alert('아이디 중복 체크를 해주세요!');
		$('input[name="mem_id"]').focus();		
	}
});







//아이디 중복체크

$('#overlay').click(function(){
	
	
	console.log('중복체크시작!'); 
	
	

	var mem_id = $('input[name="mem_id"]').val(); 
	console.log('check mem_id:', mem_id); 
	

	
	$.ajax({
	
		type:'get',
		url:'overlay', 
		
		data:{'mem_id':mem_id},
		
		dataType:'json', 
		success:function(data){
			
			
			console.log(data); 
		
		if(mem_id==""){
			alert('이메일을 입력하세요.');
			}
		else if(data.overlay){
				alert('이미 사용중인 아이디 입니다.');
				$('input[name="mem_id"]').val('');
				}
		else { 
				alert('사용가능한 아이디 입니다.'); 
			 	check = true;
			}
			
				
				
		},
		error:function(e){
			console.log(e);
		}
	});

});







</script>
</html>