<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

        <link rel="stylesheet" href="resources/css/common.css" type="text/css">
        <style>


        .error{
            font-size: 1px;
            height: 20px;
            color:red;
            font-weight: 700;
        }

        #captcha {
            border: solid greenyellow;
            width: 307px;
        }
	
	
	
	
	
        </style>

    </head>

    <body>
        


        <div style="margin-left: 5px; border: 1px solid transparent; border-radius: 10px 10px 10px 10px; width: 785px; height: 645px;">
            <div style="height: 5%; width: 100%; background-color: rgb(80, 80, 80);"></div>
            <div style="height: 5%; width: 100%; "></div>
            <form style="display: flex; width: 100%; height: 370px;">
                <div style="width: 5%; height: 100%;"></div>
                <div style="width: 90%; height: 100%;">

                    <div class="title" style="width: 100%;height: auto; text-align: center;"><h1 style="font-size: 21px;">회원가입</h1></div>
        
    <!--이메일-->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <a>e-mail</a> </span>
                        </div>
                        <input id="mem_id" type="email" name="mem_id" name="" class="form-control" placeholder="이메일을 입력해주세요"/>
                        <input type="button" class="btn btn-secondary" id="overlay" value="중복체크"/>
                        <div id="emailError" class="error"></div>
                    </div>
    <!--비밀번호-->                
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <a>pw</a> </span>
                        </div>
                        <input id="mem_pw" type="password"  name="mem_pw" class="form-control" placeholder="비밀번호를 입력해주세요"/>
                        <div id="passwordError" class="error"></div>
                    </div>
    <!--비밀번호확인-->                
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <a>pwchk</a> </span>
                        </div>
                        <input id="mem_pwchk" type="password" name="mem_pwchk" class="form-control" placeholder="비밀번호를 다시 입력해주세요"/>
                        <div id="passwordCheckError" class="error"></div>
                    </div>
    <!--name--> 
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <a>name</a> </span>
                        </div>
                        <input id="mem_nick"  type="text" name="mem_nick" class="form-control" placeholder="이름을 입력해주세요"/>
                        <div id="nameError" class="error"></div>
                    </div>
    <!--emailchk--> 
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <a>이메일 수신 동의</a> </span>
                        </div>
                        <div class="form-control" style="display: flex; align-items: center;">
                            <div style="display: flex; align-items: center;">
                                <input id="mem_emailchky" type="radio" name="mem_emailchk" value = '1' checked/>동의
                                <div style="width: 30px;"></div>
                                <input id="mem_emailchkn" type="radio" name="mem_emailchk" value = '2'/>거부
                            </div>
                            <div id="emailchkError" class="error"></div>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <button id="regist" type="submit" class="btn btn-primary btn-block"> 가입하기  </button>
                    </div>    
                </div>
                <div style="width: 5%; height: 100%;"></div>
            </form>

<!-- 리캡챠 사용 방식 -->
            <div style="display: flex; justify-content: center; align-items: center; width: 100%; height: 10%;">

                <div id="captcha">
                    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
                    <div class="g-recaptcha" data-sitekey="6LfEqgkeAAAAAPyHmljpUwjDdIuEUDJKuPP8lPX9"></div>
                </div>

            </div>
            <div style="height: 5%; width: 100%; "></div>
            <div style="height: 5%; width: 100%; background-color: rgb(80, 80, 80);"></div>
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
					confirm('회원가입을 축하 드립니다.');
					
					location.href='./loginPage';
					
					
// 20220122 => 그냥 main으로 때리면 안되고, 부모창의 정보가 있어야 한다.
					// 부모창(원래 보던 창) 새로고침
					opener.document.location.reload();
					// 자식창(현재 로그인 창)을 끄기
					window.close();
// 20220122 => 그냥 main으로 때리면 안되고, 부모창의 정보가 있어야 한다.
										
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
