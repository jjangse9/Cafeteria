<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <style>
      body{
         margin: 10% 20%;
         text-align: center;
      }
      .table{
         width: 100%;
         height: auto;
         text-align: center;
      }
      th, td{
         width: 40%;
      }
   </style>
</head>
<body>
   <form action="update" method="post"> 
      <h2>회원정보 페이지</h2>
      <hr/>


<!-- 20220117 테이블 보여주기 방식SI -->
   <table class="table table-bordered">
   <tbody >
      <tr>
         <!-- <th scope="row">아이콘</th> -->
         <td colspan="2"><img src="/photo/${userInfo.icon_newname}" width="250px"></td>
      </tr>
      <tr>
         <th scope="row">이메일</th>
         <td>${userInfo.mem_id }</td>
      </tr>
      <tr>
         <th scope="row">닉네임</th>
         <td>${userInfo.mem_nick }</td>
      </tr>
      <tr>
         <th scope="row">가입일</th>
         <td>${userInfo.mem_regidate }</td>
      </tr>
      <tr>
         <th scope="row">회원등급</th>
         <td>
         <c:choose>
            <c:when test="${userInfo.mem_grade eq 1 }">
               일반회원
            </c:when>
            <c:when test="${userInfo.mem_grade eq 2 }">
               업주회원
            </c:when>
            <c:when test="${userInfo.mem_grade eq 3 }">
               관리자
            </c:when>
         </c:choose>
         </td>
      </tr>
      <tr>
         <th scope="row">이메일 수신 동의여부</th>
         <td>
         <c:choose>
            <c:when test="${userInfo.mem_emailchk eq 1 }">
            동의
            </c:when>
            <c:when test="${userInfo.mem_emailchk eq 2 }">
            거부
            </c:when>
         </c:choose>
         </td>
      </tr>
   </tbody>
   </table>

   <button type="button" class="btn btn-outline-dark" onclick="location.href='./myStatEdit'">회원정보변경</button>
   <button type="button" class="btn btn-outline-dark" onclick="location.href='./passUpdate'">비밀번호변경</button>
   <button type="button" class="btn btn-outline-dark" onclick="location.href='./logout'">로그아웃</button>
   <button type="button" class="btn btn-outline-dark">탈퇴</button>
   
   
   
   <!--  연결을 할 때 아이디를 계속 받아오기 위해서 세션 사용* -->
   <!-- 컨트롤러에서 현재 세션에있는걸 받아와서 계속 쓸거야.  -->
   
   
   <br><br>
   <!-- 일반회원은 보이지 않음 -->
   <%-- <c:if test="${userInfo.mem_grade ne 1 }"> --%>
      <button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='./myPost'">작성 글 보기</button>
   <%-- </c:if> --%>
   
   <%-- 업주회원이면 버튼 없음 / 업주 회원 요청 처리중 / 업주회원이면 업주 정보 보기&수정
    --%>
   <button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='./bQstPage'">업주 회원 문의</button>
   
   <button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='./myReply'">작성 댓글 보기</button>
   <button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='./qstList'">문의내역</button>
   <button type="button" class="btn btn-outline-danger btn-sm">신고내역</button>
   <button type="button" class="btn btn-outline-danger btn-sm">알림내역</button>
   <br><br>
        
   <input type="button" value="메인으로" class="btn" onclick="location.href='./'">
   </form>
   
<!-- 20220117 테이블 보여주기 방식SI -->
</body>
<script>
</script>
</html>



