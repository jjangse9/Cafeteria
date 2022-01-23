<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>비밀번호 찾기 입력폼</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

        
        <style>
    
        </style>

    </head>

    <body>

        <div style="margin-left: 5px; border: 1px solid transparent; border-radius: 10px 10px 10px 10px; width: 485px; height: 485px;">
            <div style="width: 100%; height: 7%; background-color: rgb(80, 80, 80);"></div>
            <div style="width: 100%; height: 12%;"></div>
            <div style="width: 100%; height: 37px;"></div>
            <h2 style="text-align: center;">비밀번호 찾기</h2>
            <div style="width: 100%; height: 5%;"></div>
            
            
            <div style="text-align: center;">

                <form style="display: flex; align-items: center; justify-content: center; text-align: center;" action="findpassword" name="findpassword" method="post" >
                    
                    <div>
                        <div></div>
                        <div class="form-group input-group" style="height: 48px;">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <a>e-mail</a> </span>
                            </div>
                            <input style="height: 48px;" class="form-control" placeholder="이메일를 입력해주세요" type="email" name="mem_id" />
                        </div>
                        
                        <div>
                            <input type="submit" class="btn btn-primary" value="비밀번호 찾기" />    
                        </div>
                    </div>
                   
                        
                    
                </form>
            </div> 
            <div style="width: 100%; height: 3%;"></div>
            <p style="text-align: center;">로그인 페이지로 가시려면 
                <a href="./loginPage">바로가기</a>를 클릭하세요.
            </p>
            <div style="width: 100%; height: 12%;"></div>
            <div style="width: 100%; height: 37px;"></div>
            <div style="width: 100%; height: 7%; background-color: rgb(80, 80, 80);"></div>
            
        </div>
    </body>

    <script>
           
    </script>
</html>