<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>비밀번호 변경</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

        <link rel="stylesheet" href="resources/css/common.css" type="text/css">

        <style></style>





    </head>
    <body id="body">
        <!-- 네비게이션 바 -->
        <section id="main-navi">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: white; border: 2px solid black; border-top: none; border-left: none; border-right: none;">
                <div style="width: 100px;"></div>
                
                
<!-- 20220120 사이트 로고 연결 -> 홈페이지로SI -->
				<a class="navbar-brand" href="#">
					<!-- svg => 아이콘 -->
					<svg style="color: rgb(255, 174, 0);" xmlns="http://www.w3.org/2000/svg" 
								width="50px" height="50px" fill="currentColor" class="bi bi-piggy-bank-fill" viewBox="0 0 16 16"
								onclick="location.href='./'">
						<!-- 아이콘 경로 -->
						<path fill-rule="evenodd" d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069c0-.145-.007-.29-.02-.431.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a.95.95 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58	0 0 0-.707-.098.735.735 0 0 0-.375.562c-.024.243.082.48.32.654a2.112 2.112 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595zm7.173 3.876a.565.565 0 0 1-.098.21.704.704 0 0 1-.044-.025c-.146-.09-.157-.175-.152-.223a.236.236 0 0 1 .117-.173c.049-.027.08-.021.113.012a.202.202 0 0 1 .064.199zm-8.999-.65A6.613 6.613 0 0 1 7.964 4.5c.666 0 1.303.097 1.893.273a.5.5 0 1 0 .286-.958A7.601 7.601 0 0 0 7.964 3.5c-.734 0-1.441.103-2.102.292a.5.5 0 1 0 .276.962zM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0z"/>
					</svg>
				</a>
<!-- 20220120 사이트 로고 연결 -> 홈페이지로SI -->
                
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarScroll">
                  <ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll" style="max-height: 100px;"></ul>
                  <form class="d-flex">
                    <!-- 공지사항 -->
                    <div class="nav-item">
                      <a class="nav-link" href="#" style="font-size: 20px; color: black;">공지사항</a>
                    </div>
                    <!-- 구내식당 -->
                    <div class="nav-item">
                      <a class="nav-link" href="#" style="font-size: 20px; color: black;">구내식당</a>
                    </div>
                    
              
<!-- 20220120 네비게이션 바 검색SI -->
					<!-- 검색바 -->
					<div class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
						<svg xmlns="http://www.w3.org/2000/svg" 
						width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16" style="color: black;">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
						</svg>
					</a>
               		</form>
					 	<form action="searchResult" method="get" name="naviSearchForm" >
							<ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
								<input class="form-control mr-2" type="search" aria-label="Search" name="keyword" placeholder="검색어 입력" value="${keyword }">
								<button type="submit" style="margin: 0px 0px 0px 0px;" class="btn btn-danger" >Search</button>
							</ul>
						</form>
					</div>
<!-- 20220120 네비게이션 바 검색SI -->					
								
					
					
					
					
<!-- 20220120 상태 아이콘SI --> 
				<div class="dropdown">
					<img src="/photo/1.png" width="50px" class="btn btn-secondary dropdown-toggle" 
						style="padding:0px; margin-left:10px;" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false"/>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="./myStat">${loginId } 님</a>
					<!-- 20220117 내 정보 보기 쪽에서 할 수 있도록
						<a class="dropdown-item" href="#">내 글 보기</a>
						<a class="dropdown-item" href="#">내 댓글 보기</a>
					-->
					<a class="dropdown-item" href="#">문의하기</a>
					<a class="dropdown-item" href="#">로그아웃</a>
					</div>
				</div>
 
                    <div style="width: 100px;"></div>
<!-- 20220120 상태 아이콘SI -->
   
            </nav>
        </section>
        
        <div style="width: 100%; height: 78px;"></div>

        <section style="width: 100%; height: auto;" class="container">
            <div style="width: 100%; height: 100px;"></div>
            <div style="width: 100%; height: auto;">
                <div><h2>비밀번호 변경</h2></div>
                <div style="width: 100%; height: 3px;"></div>
                <div style="width: 100%; height: 3px; background-color: rgb(138, 138, 138); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
                <div style="width: 100%; height: 50px;"></div>
                <div style="width: 100%; height: 50px;"></div>
                <div style="display: flex; width: 100%; height: auto;">
                    <div style="width: 20%; height: auto;"></div>
                    <div style="width: 60%; height: auto;">
                       
                        <form action="pwupdate" method="post">
                            <!--아이디-->
                            <div class="form-group input-group" style="height: 48px;">
                                <div class="input-group-prepend">
                                    <span for="mem_id" class="input-group-text"> <a>ID</a> </span>
                                </div>
                                <input style="height: 48px;" class="form-control" placeholder="이메일 입력해주세요" type="text" name="mem_id" value="${userId}" readonly/>
                            </div>
                            <div style="width: 100%; height: 15px;"></div>
                            <!--비밀번호-->
                            <div class="form-group input-group" style="height: 48px;">
                                <div class="input-group-prepend">
                                    <span for="mem_pw" class="input-group-text"> <a>PASSWORD</a> </span>
                                </div>
                                <input style="height: 48px;" class="form-control" placeholder="비밀번호를 입력해주세요" type="text" name="mem_pw"  value="${info.mem_pw}"/>
                            </div>
                            <div style="width: 100%; height: 30px;"></div>

                            <!-- 제출 버튼-->
                            <div style="display: flex; width: 100%; height: auto;" class="form-group">
                                <div style="width: 33%;">
                                    <button class="btn btn-outline-primary btn-block" onclick="location.href='main'" class="btn btn-primary btn-block"> 메인으로  </button>
                                </div>
                                <div style="width: 2%;"></div>
                                <div style="width: 65%;">
                                    <button type="submit" class="btn btn-primary btn-block"> 비밀번호  변경  </button>
                                </div>
                            </div>                                          
                        </form>     
                    </div>
                    <div style="width: 20%; height: auto;"></div>
                </div>
                <div style="width: 100%; height: 31px;"></div>
            </div>
            
            <div style="width: 100%; height: 150px;"></div>
        </section>
       



        <!--푸터-->
        <footer style="width: 100%; height: 230px; background-color: rgb(29, 29, 29);">
            <div style="width: 100%; height: 7%;"></div>
            <div style="display: flex; width: 100%; height: 85%;">
                <!-- 로고 및 설명 -->
                <div style="width: 20%; height: 100%;">
                    <div tyle="width: 50%; height: 50%;"></div>
                    <div style="width: 100%; height: 50%;">
                        <a href="#">
                            <svg style="color: rgb(255, 174, 0);" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="currentColor" class="bi bi-piggy-bank-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M7.964 1.527c-2.977 0-5.571 1.704-6.32 4.125h-.55A1 1 0 0 0 .11 6.824l.254 1.46a1.5 1.5 0 0 0 1.478 1.243h.263c.3.513.688.978 1.145 1.382l-.729 2.477a.5.5 0 0 0 .48.641h2a.5.5 0 0 0 .471-.332l.482-1.351c.635.173 1.31.267 2.011.267.707 0 1.388-.095 2.028-.272l.543 1.372a.5.5 0 0 0 .465.316h2a.5.5 0 0 0 .478-.645l-.761-2.506C13.81 9.895 14.5 8.559 14.5 7.069c0-.145-.007-.29-.02-.431.261-.11.508-.266.705-.444.315.306.815.306.815-.417 0 .223-.5.223-.461-.026a.95.95 0 0 0 .09-.255.7.7 0 0 0-.202-.645.58.58 0 0 0-.707-.098.735.735 0 0 0-.375.562c-.024.243.082.48.32.654a2.112 2.112 0 0 1-.259.153c-.534-2.664-3.284-4.595-6.442-4.595zm7.173 3.876a.565.565 0 0 1-.098.21.704.704 0 0 1-.044-.025c-.146-.09-.157-.175-.152-.223a.236.236 0 0 1 .117-.173c.049-.027.08-.021.113.012a.202.202 0 0 1 .064.199zm-8.999-.65A6.613 6.613 0 0 1 7.964 4.5c.666 0 1.303.097 1.893.273a.5.5 0 1 0 .286-.958A7.601 7.601 0 0 0 7.964 3.5c-.734 0-1.441.103-2.102.292a.5.5 0 1 0 .276.962zM5 6.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0z"/>
                            </svg>
                        </a>
                    </div>
                    <div style="display: flex; width: 100%; height: 50%; ">
                        <div style="width: 15%; height: 100;"></div>
                        <!-- text text text -->
                        <div>
                            <p style="color: rgb(151, 151, 151);">
                                text text text 
                            </p>
                        </div>
                    </div>
                </div>
                <!-- 주소 및 아이콘 -->
                <div style="width: 70%; height: 100%;">
                    <div style="width: 100%; height: 10%;"> </div>
                    <div class="col text-center" style="width: 100%; color: rgb(151, 151, 151);">
                        <p>
                            <span>㈜000</span>
                            <span>대표이사 : 000</span>
                            <span>사업자등록번호 : 000-00-00000</span>
                            <span>등록연월일 : 2022.01.24</span>
                        </p>
                        <p>
                            <span>주소 : 000 000 000 000 000, 0000</span>
                            <span>개인정보 관리책임자 : 000</span>
                        </p>
                        <p>
                            ©Copyright 2022 - Made by Gudi Project team, Group 4.
                        </p>
                        <div style="width: 100%; height: 10px;"></div>
                        <div style="display: flex; justify-content: center; align-items: center;">
                            <!--아이콘 구글-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16 " style="color: rgb(0, 128, 248);">
                                <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z"/>
                                </svg>
                            </a>
                            <a style="width: 30px;"></a>
                             <!--아이콘 인스타-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16" style="color: rgb(255, 123, 0);">
                                <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                                </svg>
                            </a>
                            <a style="width: 30px;"></a>
                             <!--아이콘 유튜브-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16" style="color: red;">
                                <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z"/>
                                </svg>
                            </a>
                            <a style="width: 30px;"></a>
                             <!--아이콘 위치(지도)-->
                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16" style="color: rgb(0, 155, 26);">
                                <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                </svg>
                            </a>
                            
                        </div>
                    </div>
                    <div style="width: 100%; height: 10%;"></div>
                </div>
                <div style="width: 10%; height: 100%;"></div>
            </div>
            <div style="width: 100%; height: 8%;"></div>
        </footer>
    </body>
    <script>
        
    </script>
</html>
