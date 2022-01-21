<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <link rel="stylesheet" href="resources/css/common.css" type="text/css">
   <!-- 20220117 부트스트랩 라이브러리SI -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
   <style>
   
   </style>
</head>

   <body>
        <h1>메인페이지</h1>
        <hr>
          
    <!-- 20220111 메인 검색 기능SI -->
   <!-- 
      검색어 입력 후 search 클릭시 해당 검색어를 가지고 검색결과 페이지로 이동 => get방식 사용
      Post 방식은 동일한 요청에 대해 에러를 뿌리기 때문에 새로고침이나 뒤로가기에서 만료된 페이지가 뜰 가능성 있음
    -->
   <form action="searchResult" method="get" name="mainSearchForm" >
      <input type="text" name="keyword" placeholder="식당, 메뉴, 지역으로 검색하세요.." value="${keyword }"/>
      <input type="submit" value="search">
   </form>
      
   <hr>
   
<!-- 20220117 내 상태창 보기SI -->
   <c:set var="loId" value="${loginId }"/>
   <div class="dropdown">
   
   <!-- 로그인 / 비로그인 상태 구분 -->
   <c:choose>
      <c:when test="${loId ne null}">
         <img src="/photo/${iconName }" width="100px" class="btn btn-secondary dropdown-toggle"
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
            <a class="dropdown-item" onclick='popUpLogin()'"> 로그인해주세요흙흙 </a>

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
          


    </body>

</html>
<script>
	
</script>



















