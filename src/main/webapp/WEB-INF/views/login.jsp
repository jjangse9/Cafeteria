
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>문의 하기</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

        <link rel="stylesheet" href="resources/css/common.css" type="text/css">
        <style>
    
            div{
            text-align: center;
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
        
        <div style="margin-left: 5px; border: 1px solid transparent; border-radius: 10px 10px 10px 10px; width: 485px; height: 485px;">
            <div style="width: 100%; height: 7%; background-color: rgb(80, 80, 80);"></div>
            <div style="width: 100%; height: 7%;"></div>
            <div style="display: flex; justify-content: center; align-items: center; width: 100%; height: 7%;">
                <div><h2>LOGIN</h2></div>
            </div>
            
            <div style="width: 100%; height: 70%;">
                <div style="width: 100%; height: 10%;"></div>
<!--id-->
                <div style="display: flex; width: 100%; height: 20%;">
                    <div style="width: 10%; height: 100%;"></div>
                    <div style="width: 80%; height: 100%;">
                        <div style="display: flex; width: 100%; height: 60px; border: 1px solid transparent; border-radius: 20px 20px 20px 20px;">
                            <div style="display: flex; justify-content: center; align-items: center; width: 30%; height: 100%; border: 1px solid transparent; border-radius: 20px 5px 5px 20px; background-color: rgb(185, 185, 185);">
                                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
                                </svg>
                            </div>
                            <div style="width: 1%; height: 100%;"></div>
                            <div style="width: 69%; height: 100%; border: 1px solid transparent;">
                                <input type="email" id="mem_id" style="width: 100%; height: 100%; border: 1px solid rgb(175, 175, 175); border-radius: 5px 5px 5px 5px;" placeholder="이메일 확인"/>
                            </div>
                        </div> 
                    </div>
                    <div style="width: 10%; height: 100%;"></div>
                </div>
    
                <div style="width: 100%; height: 5%;"></div>
<!--pw-->
                <div style="display: flex; width: 100%; height: 20%;">
                    <div style="width: 10%; height: 100%;"></div>
                    <div style="width: 80%; height: 100%;">
                        <div style="display: flex; width: 100%; height: 60px; border: 1px solid transparent; border-radius: 20px 20px 20px 20px;">
                            <div style="display: flex; justify-content: center; align-items: center; width: 30%; height: 100%; border: 1px solid transparent; border-radius: 20px 5px 5px 20px; background-color: rgb(185, 185, 185);">
                                <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
                                    <path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                </svg>
                            </div>
                            <div style="width: 1%; height: 100%;"></div>
                            <div style="width: 69%; height: 100%; border: 1px solid transparent;">
                                <input type="password" id="mem_pw" style="width: 100%; height: 100%; border: 1px solid rgb(175, 175, 175); border-radius: 5px 5px 5px 5px;" placeholder="비밀번호 확인"/>
                            </div>
                        </div> 
                    </div>
                    <div style="width: 10%; height: 100%;"></div>
                </div> 

                <div style="width: 100%; height: 5%;"></div>
                
<!-- 회원가입/로그인 -->
                <div style="display: flex; width: 100%; height: 20%;">
                    <div style="width: 10%; height: 100%;"></div>

                    <div style="width: 39%; height: 100%;">
                        <div style="width: 100%; height: 60px;">
                            <button value="회원가입" onclick="popupJoin()" style="width: 100%; height: 100%;" 
                            class="btn btn-outline-secondary btn-lg" type="submit">join</button>
                        </div>
                    </div>
                    <div style="width: 2%; height: 100%;"></div>
                    <div style="width: 39%; height: 100%;">
                        <div style="width: 100%; height: 60px;">
                            <button id="login" value="LOGIN" style="width: 100%; height: 100%;" class="btn btn-primary btn-lg" 
                            type="submit">login</button>
                        </div>
                    </div>
                    <div style="width: 10%; height: 100%;"></div>

                </div>
                
                <div style="width: 100%; height: 2%;"></div>
    
                <div style="width: 100%; height: 10%;">
                    <li><a href="./findPw">비밀번호 찾기</a></li>
                </div>
                <div style="width: 100%; height: 8%;"></div>
            </div>

            <div style="width: 100%; height: 2%;"></div>
            <div style="width: 100%; height: 7%; background-color: rgb(80, 80, 80);"></div>
        </div>
                
        
    </body>

    <script>
    /* 20220122 - 회원가입 팝업 */
    function popupJoin(){
       javascript:void(window.open('./joinForm', '','width=800px, height=655px, top=50px, left=600px'));
    };
    
    
    
    // 로그인 버튼을 눌렀을 때
    $('#login').click(function(){

    var mem_id = $('#mem_id').val();
    var mem_pw = $('#mem_pw').val();
    console.log(mem_id+'/'+mem_pw);

    // 로그인 유효성 검사
    $.ajax({
        type:'POST',
        url:'login',
        data:{'mem_id':mem_id,'mem_pw':mem_pw},
        dateType:'JSON', //hashmap 으로 보내줘야 받아올 수 있어요
        success:function(data){
            console.log("안녕하세요"+data.memInfo);
            // 로그인 성공시
         if(data.memInfo != null){
            console.log('여기서확인' , data.memInfo.mem_grade);
            
            // 로그인 아이디의 등급이 3이면 = 관리자라면
            if(data.memInfo.mem_grade == 3){
               //location.href='./admin';
               console.log('관리자 로그인');
               
               // 모르겠으면 복습하세요
               //console.log(data);
               //console.log(data.memInfo);
               
               //console.log('data의 길이', Object.keys(data).length);
               //console.log('memInfo의 길이', Object.keys(data.memInfo).length);
               
               opener.document.location.href='./admin';
         
               // 자식창(현재 로그인 창)을 끄기
               window.close();
            }else{
               // 일반회원, 업주회원이면
               alert(data.memInfo.mem_nick+'님 반갑습니다.');
               location.href='./main';
            
// 20220122 => 그냥 main으로 때리면 안되고, 부모창의 정보가 있어야 한다.
               // 부모창(원래 보던 창) 새로고침
               opener.document.location.reload();
            
               // 자식창(현재 로그인 창)을 끄기
               window.close();
// 20220122 => 그냥 main으로 때리면 안되고, 부모창의 정보가 있어야 한다.
               
            }
            // 로그인 실패시
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