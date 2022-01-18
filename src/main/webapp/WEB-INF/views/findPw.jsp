<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
       <meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <style>
                div{
                    text-align: center;
                }



                #findpw1{
        margin-top: 300px;
    }

                .findpw2{
                     margin-top: 300px;

                     border: 1px solid rebeccapurple;
        width: 502px;
        height: 800px;
        margin-top: 130px;
        margin-left: 698px;
                }


                
    .findpw3{
        background-color: aquamarine;
        width: 500px;
        height: 90px;

    }

    .findpw4{
        background-color: cadetblue;
        width: 500px;
        height: 90px;
    }




        </style>




    </head>
    <body>
        <div id="findpw1">
            <h3>비밀번호 찾기</h3>
            <hr>
            </div>
        
        <div class = "findpw2">
        <div class = "find">
        	가입하셨을때 사용한 이메일 주소를 정확하게 입력해 주십시오. 
        	<br/>
        	입력하신 이메일 주소로 비밀번호가 전송됩니다. 
        	<br/>
        	이메일 수신을 동의하지 않으셨을 경우 이용이 불가합니다.
        </div>

            <div class="findpw4">
                <label for="email">이메일</label>
                  <input id="email" name=email type="email" />
              <div class="error">유효하지 않은 이메일주소 입니다  </div>
            </div>
            
            <br><br>

               <input type="submit" id="check" value="비밀번호찾기">
        </div>
        
    </body>

</html>