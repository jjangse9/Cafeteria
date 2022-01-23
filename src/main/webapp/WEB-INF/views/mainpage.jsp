<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>mainpage</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <link rel="stylesheet" href="resources/css/mainPageCss.css"/>
        <style></style>
        
        
        
        
        
    </head>
    <body id="body">
        <!-- 네비게이션 바 -->
        <section id="main-navi">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top" 
            style="background-color: white; border: 2px solid black; border-top: none; 
            border-left: none; border-right: none;">
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
                      <a class="nav-link" href="./notice/noticeList" style="font-size: 20px; color: black;">공지사항</a>
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
								
					
					
					
					
<!-- 20220117 내 상태창 보기SI -->
   <c:set var="loId" value="${loginId }"/>
   <div class="dropdown">
   
   <!-- 로그인 / 비로그인 상태 구분 -->
   <c:choose>
      <c:when test="${loId ne null}">
         <img src="./resources/images/${iconName }" width="100px" class="btn btn-secondary dropdown-toggle"
            id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false"/>
         <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
           <a class="dropdown-item" href="./myStat">${loginId} 님 </a>
         
            
            <!-- 20220117 내 정보 보기 쪽에서 할 수 있도록
            <a class="dropdown-item" href="#">내 글 보기</a>
            <a class="dropdown-item" href="#">내 댓글 보기</a>
             -->
       		
           <a class="dropdown-item" href="./qstPage">문의하기</a>
           <a class="dropdown-item" href="./logout">로그아웃</a>
         </div>
      </c:when>
      <c:when test="${loId eq null }">
         <img src="/photo/0.png" width="100px" class="btn btn-secondary dropdown-toggle"
         id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false"/>
         <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" onclick='popUpLogin()'> 로그인해주세요흙흙 </a>

            <!-- 
               window.location.href 입력하면 현재 URL 가져올 수 있음
               로그인 페이지로 이동시킬 때 페이지 이동이라면 해당 정보를 파라미터로 가지고 가서
               로그인 완료시 원래 페이지로 이동시키는 방법을 쓸 수 있음
               
               로그인 창 자체를 팝업으로 띄우면 할 필요 없고
            -->


         </div>
      </c:when>
   </c:choose>   
   </div>
<!-- 20220117 내 상태창 보기 -->
 
                    <div style="width: 100px;"></div>
<!-- 20220120 상태 아이콘SI -->
   
            </nav>
        </section>


	<!-- <form action="searchResult" method="get" name="mainSearchForm" > -->
        <!--헤드 이미지 (class-부트)(id-스타일)-->
        <section id="main-one" style="background-image: url(resources/img/mainpage-top.jpg);">
            <div id="main-one-1"></div>
            
            
<!-- 20220120 - 메인페이지 검색SI -->
            <div id="main-one-2">
            	<div >
            	<!-- 검색바 -->
				<input id="searchString" class="form-control border-0 shadow-0" 
						style="width: 380px; height: 65px; font-size: 23px;" type="text" 
						name="keyword" placeholder="지역, 식당, 메뉴로 검색하세요." value="${keyword }">
				</div>
			<div style="width: 5px;"></div>
                <div >
				<!-- search 버튼 -->
				<button id="searchButton" class="btn btn-danger btn-lg" style="width: 110px; height: 65px; font-size: 25px;" type="submit">Search </button>
                </div>
            </div>
            <div id="main-one-1-1"></div>
<!-- 20220120 - 메인페이지 검색SI -->
        </section>
	<!-- </form> -->


       <!--조중석 아이콘 (class-부트)(id-스타일)-->
        <section id="main-two">
            <div id="main-two-1">
                <a href="#" target="_parent" data-toggle="tooltip" data-placement="bottom" title="조식!"> <!--@@@-->
                    <svg style="color: coral;" xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-sunrise" viewBox="0 0 16 16">
                        <path d="M7.646 1.146a.5.5 0 0 1 .708 0l1.5 1.5a.5.5 0 0 1-.708.708L8.5 2.707V4.5a.5.5 0 0 1-1 0V2.707l-.646.647a.5.5 0 1 1-.708-.708l1.5-1.5zM2.343 4.343a.5.5 0 0 1 .707 0l1.414 1.414a.5.5 0 0 1-.707.707L2.343 5.05a.5.5 0 0 1 0-.707zm11.314 0a.5.5 0 0 1 0 .707l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zM8 7a3 3 0 0 1 2.599 4.5H5.4A3 3 0 0 1 8 7zm3.71 4.5a4 4 0 1 0-7.418 0H.499a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1h-3.79zM0 10a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 0 10zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                </a>
            </div>
            <div id="main-two-1">
                
            </div>
            <div id="main-two-1">
                <a href="#" target="_parent"  data-toggle="tooltip" data-placement="bottom" title="중식!"> <!--@@@-->
                    <svg style="color: coral;" xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-sun" viewBox="0 0 16 16">
                        <path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
                    </svg>
                </a>
            </div>
            <div id="main-two-1">
                
            </div>
            <div id="main-two-1">
                <a href="#" target="_parent" data-toggle="tooltip" data-placement="bottom" title="석식!"> <!--@@@-->
                    <svg style="color: coral;" xmlns="http://www.w3.org/2000/svg" width="90" height="90" fill="currentColor" class="bi bi-sunset" viewBox="0 0 16 16">
                        <path d="M7.646 4.854a.5.5 0 0 0 .708 0l1.5-1.5a.5.5 0 0 0-.708-.708l-.646.647V1.5a.5.5 0 0 0-1 0v1.793l-.646-.647a.5.5 0 1 0-.708.708l1.5 1.5zm-5.303-.51a.5.5 0 0 1 .707 0l1.414 1.413a.5.5 0 0 1-.707.707L2.343 5.05a.5.5 0 0 1 0-.707zm11.314 0a.5.5 0 0 1 0 .706l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zM8 7a3 3 0 0 1 2.599 4.5H5.4A3 3 0 0 1 8 7zm3.71 4.5a4 4 0 1 0-7.418 0H.499a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1h-3.79zM0 10a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 0 10zm13 0a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
                    </svg>
                </a>
            </div>
        </section>

        <!--조회,좋아요,별점-->
         <section id="main-three" class="container">
            <div class="main-mid-icon">
                
            </div>
        </section>

<!-- 20220120 핫식당 댓글소개 - 반반 -->
	
        <section id="main-four" class="container">
            <div id="main-four-1">
                <div id="main-five-2-1">
                    <div id="main-five-2-1-1"></div>
                    <div id="main-five-2-1-2"></div>
                    <div id="main-five-2-1-1"></div>
                </div>
                <div id="main-five-2-2"></div>
                <div id="main-five-2-3">
                    <h3>핫식당 소개</h3>
                </div>
                <div id="main-five-2-2"></div>
                <div id="main-five-2-1">
                    <div id="main-five-2-1-1"></div>
                    <div id="main-five-2-1-2"></div>
                    <div id="main-five-2-1-1"></div>
                </div>
            </div>
            
            
<!-- 20220120 핫식당 백 삽입 -->
<!-- 20220120 forEach 인덱스 이용해서 첫번째, 두번째 다른곳에 출력시키기 => https://bangyee.tistory.com/12 -->
<c:forEach items="${halfResult }" var="har" varStatus="status">
	<c:set var="eachIndex" value="${status.index }"/>

	<c:if test="${eachIndex eq 0}">
            <div id="main-four-1"></div>
            <div id="main-four-2">
  			<!-- 식당 이미지 -->
                <div id="main-four-2-1">
	                <!-- 20220120 a 경로 -->
                    <a href="./cafeDetail?cafeIdx=${har.cafe_idx }" target="_parent"> <!--@@@-->
		                <!-- 20220120 이미지 -->
                    	<img src="/photo/${har.replyphoto_newname }" class="img-fluid"/>
                    </a>
                </div>
                <!-- 20220120 onclick 경로 -->
                <div id="main-four-2-2" OnClick="location.href ='./cafeDetail?cafeIdx=${har.cafe_idx }'" style="cursor:pointer; display: flex;"> <!--@@@-->
                    <div style="width: 5%; height: auto;"></div>
                    <div style="width: 30%; height: auto;">
                        <div style="width: 100%; height: 20%;"></div>
                        <!-- 회원 로고 -->
                        <div style="width: 100%; height: 99.3px; background-color: black;">

                        </div>
                    </div>
                    <div style="width: 5%; height: auto;"></div>
                    <!-- 회원 명, 댓글 -->
                    <div style="width: 55%; height: auto;">
                        <div style="width: 100%; height: 10%;"></div>
                        <div style="width: 100%; height: 4%;"></div>
                        <!-- 20220120 작성자 -->
                        <div style="width: 100%; height: 5%;">${har.mem_id }</div>
                        <div style="width: 100%; height: 2%;"></div>
                        <!-- 20220120 날짜 -->
                        <div style="width: 100%; height: 5%;">${har.cafereply_modtime}</div>
                        <div style="width: 100%; height: 2%;"></div>
                        <!-- 20220120 내용 -->
                        <div style="width: 100%; height: auto;">${har.cafereply_content }</div>
                        <!-- 20220120 좋아요! -->
                        좋아요 : ${har.cafereply_likecnt } 
                    </div>
                    <div style="width: 5%; height: auto;"></div>
                </div>
            </div>
    </c:if>  
    <c:if test="${eachIndex eq 1}">
            <div id="main-four-1"></div>
            <div id="main-four-2">
                <!-- 해당 식당 댓글 -->
                <!-- 20220120 onclick 경로 -->
                <div id="main-four-2-2" OnClick="location.href ='./cafeDetail?cafeIdx=${har.cafe_idx }'" style="cursor:pointer; display: flex;"> <!--@@@-->
                    <div style="width: 5%; height: auto;"></div>
                    <!-- 회원 명, 댓글 -->
                    <div style="width: 55%; height: auto;">
                        <div style="width: 100%; height: 10%;"></div>
                        <div style="width: 100%; height: 4%;"></div>
                        <!-- 20220120 작성자 -->
                        <div style="width: 100%; height: 5%;">${har.mem_id }</div>
                        <div style="width: 100%; height: 2%;"></div>
                        <!-- 20220120 날짜 -->
                        <div style="width: 100%; height: 5%;">${har.cafereply_modtime}</div>
                        <div style="width: 100%; height: 2%;"></div>
                        <!-- 20220120 내용 -->
                        <div style="width: 100%; height: auto;">${har.cafereply_content }</div>
                        <!-- 20220120 좋아요! -->
                        좋아요 : ${har.cafereply_likecnt } 
                    </div>
                    <div style="width: 5%; height: auto;"></div>
                    <div style="width: 30%; height: auto;">
                        <div style="width: 100%; height: 20%;"></div>
                        <!-- 회원 로고 -->
                        <div style="width: 100%; height: 99.3px; background-color: black;">

                        </div>
                    </div>
                    <div style="width: 5%; height: auto;"></div>
                </div>
                <!-- 식당 이미지 -->
                <div id="main-four-2-1">
                    <!-- 20220120 a 경로 -->
                    <a href="./cafeDetail?cafeIdx=${har.cafe_idx }" target="_parent"> <!--@@@-->
                         <!-- 20220120 이미지 -->
                    	<img src="/photo/${har.replyphoto_newname }" class="img-fluid"/>
                    </a>
                </div>
            </div>
            <div id="main-four-1"></div>
	</c:if>
</c:forEach>
        </section>

        <!--포토리뷰-->
        <section id="main-five">
            <div id="main-five-2">
                <div id="main-five-2-1">
                    <div id="main-five-2-1-1"></div>
                    <div id="main-five-2-1-2"></div>
                    <div id="main-five-2-1-1"></div>
                </div>
                <div id="main-five-2-2"></div>
                <div id="main-five-2-3">
                    <h3>포토 리뷰</h3>
                </div>
                <div id="main-five-2-2"></div>
                <div id="main-five-2-1">
                    <div id="main-five-2-1-1"></div>
                    <div id="main-five-2-1-2"></div>
                    <div id="main-five-2-1-1"></div>
                </div>
            </div>
            <div id="main-five-1">
                <div id="main-five-1-1"> <!--1번 라인-->
                    <div id="main-five-1-1-1" OnClick="location.href ='#'" style="background-image: url(resources/img/food-3.jpg); cursor:pointer;">  <!--포토리뷰 이미지-->
                    </div>
                    <div id="main-five-1-1-2"></div>
                    <div id="main-five-1-1-3" OnClick="location.href ='#'" style="cursor:pointer;"> <!--@@@-->
                        <li style="margin: 10px;">
                            <a>Free, high quality, open source icon library with over 1,500 icons. Include them anyway you like—SVGs, SVG sprite, or web fonts. Use them with or without Bootstrap in any project.</a>
                        </li>
                    </div>
                </div>

                <div id="main-five-1-2"></div>
                <div id="main-five-1-3"></div>
                <div id="main-five-1-2"></div>

                <div id="main-five-1-1"> <!--2번 라인-->
                    <div id="main-five-1-1-3" OnClick="location.href ='#'" style="cursor:pointer;"> <!--@@@-->
                        <li style="margin: 10px;">
                            <a>Free, high quality, open source icon library with over 1,500 icons. Include them anyway you like—SVGs, SVG sprite, or web fonts. Use them with or without Bootstrap in any project.</a>
                        </li>
                    </div>
                    <div id="main-five-1-1-2"></div>
                    <div id="main-five-1-2-1" OnClick="location.href ='#'" style="background-image: url(resources/img/food-4.jpg); cursor:pointer;"> <!--포토리뷰 이미지-->
                    </div>
                </div>

                <div id="main-five-1-2"></div>
                <div id="main-five-1-3"></div>
                <div id="main-five-1-2"></div>

                <div id="main-five-1-1" > <!--3번 라인-->
                    <div id="main-five-1-3-1" OnClick="location.href ='#'" style="background-image: url(resources/img/food-5.jpg); cursor:pointer;"> <!--포토리뷰 이미지-->
                    </div>
                    <div id="main-five-1-1-2"></div>
                    <div id="main-five-1-1-3" OnClick="location.href ='#'" style="cursor:pointer;"> <!--@@@-->
                        <li style="margin: 10px;">
                            <a>Free, high quality, open source icon library with over 1,500 icons. Include them anyway you like—SVGs, SVG sprite, or web fonts. Use them with or without Bootstrap in any project.</a>
                        </li>
                    </div>
                </div>
            </div>
        </section>

        <div style="height: 93px;"></div>

<!-- 푸터 -->
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
/* 20220122 - 로그인 팝업 띄우는 function */    
		function popUpLogin(){
			//console.log('메론');
			
			// 창을 띄우면서 현재(부모) 창의 url 정보를 같이 넘긴다.
			javascript:void(window.open('./loginPage', '','width=500px, height=500px, top=250px, left=750px'));
		 	
			
		};
		
		// 자음 / 모음이 검색어에 들어갔을 때 방어
		var chkString = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ', 
						'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ','ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ', 
						'', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ','ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ','ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ',
	        	        'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'];
		
		
		// form방식 => location.href 로 바꿈( 검색어 방어 위해 )
		$('#searchButton').click(function(){
			var searchString = $('#searchString').val();
			var searchStringArr = []
			
			for (var i = 0; i < searchString.length; i++) {
				searchStringArr.push(searchString.charAt(i));
			}
			
			console.log(searchStringArr);
			
			if($('#searchString').val().length < 1){
				alert('검색어를 입력해주세요!');
			}else{
				for(var j=0; j<searchStringArr.length; j++){
					if(chkString.includes(searchStringArr[j])){
						alert('자음이나 모음이 포함된 검색어로는 검색할 수 없어요');
						break;
					}else{
						location.href="./searchResult?keyword="+searchString;
						
					}
				}
				
			}
			
			
			
			
			
		});
		
    </script>
</html>

















