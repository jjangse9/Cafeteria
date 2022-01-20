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
         text-align: center;         
      }
      th, td{
         width: 40%;
         vertical-align: middle;
      }
      input[type="text"]{
         text-align: center;
      }
      
      #fileName {
          display: flex;
          justify-content: center;
      }
      label {
          cursor: pointer;
          font-size: 1em;
      }
      #chooseFile {
          visibility: hidden;
      }
   </style>
</head>
<body>
   <h2>회원정보 변경 페이지</h2>
   <hr/>
<!-- 20220117 테이블 보여주기 방식SI -->
   <table class="table table-bordered">
   <tbody >
      <tr>
         <!-- <th scope="row">아이콘</th> -->
         <!-- 
            20220119 아이콘 업로드 => 파일업로드는 jS / back 확실히 구분해야함
            back으로 넘길땐 파일 이름만 넘긴다
          -->
         <td colspan="2" id="image-show">
            <img id="imageChange" src="/photo/${userInfo.icon_newname}" width="250px">
            <!--  파일첨부 -->
              <form name="imageUploadForm" method="post" enctype="multipart/form-data" style="height: 16px;">
                <div>
                    <label for="chooseFile">
                    <span id = "fileName"></span>
                           👉 여기를 눌러서 이미지를 바꿔보세요! 👈
                    </label>
                </div>
                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
            </form>
          </td>
      </tr>
      <tr>
         <th scope="row">이메일</th>
         <td>${userInfo.mem_id }</td>
      </tr>
      <tr>
         <th scope="row" style="padding-top: 15px;">닉네임</th>
         <td><input type="text" name="mem_nick" value="${userInfo.mem_nick }" style="width:130px;"></td>
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
               <input id="mem_emailchky" type="radio" name="mem_emailchk" value = '1' checked> 동의 &nbsp;&nbsp;&nbsp;
                  <input id="mem_emailchkn" type="radio" name="mem_emailchk" value = '2'> 거부
                  <div id="emailchkError" class="error"></div>
            </c:when>
            <c:when test="${userInfo.mem_emailchk eq 2 }">
               <input id="mem_emailchky" type="radio" name="mem_emailchk" value = '1'> 동의  &nbsp;&nbsp;&nbsp;
                  <input id="mem_emailchkn" type="radio" name="mem_emailchk" value = '2' checked> 거부
                  <div id="emailchkError" class="error"></div>
            </c:when>
         </c:choose>
         
         
         
         </td>
      </tr>
   </tbody>
   </table>

<!-- 20220119 회원정보변경 -->
   <button type="button" class="btn btn-outline-dark" onclick="updateInfo()">변경</button>
<!-- 20220119 회원정보변경 -->   



   <br><br>
   <br><br>
   <input type="button" value="메인으로" class="btn" onclick="location.href='main'"/>
   
<!-- //20220117 테이블 보여주기 방식SI -->
</body>
<script>

var check = false;

   function updateInfo(){
      /* 20220119 닉네임 중복 체크SI */
      console.log('닉네임 중복 체크 시작');
      
      var nick = $('input[name="mem_nick"]').val();
      console.log('check nick', nick);
      
      $.ajax({
         type:'get',         // type은 get
         url:'nickChk',      // 요청명은 overlay
         data:{'nick':nick},      // 가지고 가는 파라미터는 id값( 현재 입력 값 ), 'id' 라는 파라미터명
         dataType:'json',   // dataType은 JSON* -> Controller로
         
         success:function(data){
            console.log(data);
            
            if(data.chk){
               alert('이미 사용중인 닉네임이에용');
               $('input[name="id"]').val('');
            }else{
               check = true;
               editInfo();
            }
         },
         error:function(e){
            console.log(e);
         }
      });
   
      function editInfo(){
         /* 20220119 ajax로 변경 데이터 넘기기 */   
         console.log('click');
         console.log(check);
         if(check){
            console.log('변경 시작');
            if(imgName==''){
               var $icon = '${userInfo.icon_newname}';
            }else{
               var $icon = file.name;
            }
            var $id = '${userInfo.mem_id }';
            var $nick = $('input[name="mem_nick"]');
            var $regdate = '${userInfo.mem_regidate}';
            var $mem_grade = '${userInfo.mem_grade}';
            var $emailchk = $('input[name="mem_emailchk"]:checked');
            
            // 성별을 한쪽이라도 체크했을 때 / 한쪽도 체크하지 않았을 때 둘다 확인
            console.log($emailchk);
            
            // 한 단계씩 진행하며 프로그래밍
            if($nick.val() == ''){
               alert('닉네임을 입력하세요');
               $nick.focus();
            /* }else if($pw.val() == ''){
               alert('비밀번호를 입력 해 주세요');
               $pw.focus(); */
            /* }else if($age.val() == ''){
               alert('나이를 입력 해 주세요');
               $age.focus();
            }else if($gender.val() == null){
               alert('성별을 선택 해 주세요');
               // 라디오는 focus() 불가
            }else if($email.val() == ''){
               alert('이메일을 입력 해 주세요');
               $email.focus(); */
            }else{// 모두 입력했을 경우
               console.log('서버전송 시작');
            
      
               // param( data) 채우기 - Object 에 데이터 넣는 법 3가지
               var param = {'icon':$icon};
               param.id = $id;   // 직접 넣기
               param.nick = $nick.val();         // 속성을 지정해서 넣기
               param['regdate'] = $regdate;   // 배열처럼 넣기
               param.emailchk = $emailchk.val();
               
               // 콘솔상에서는 a,b,c 순으로 보여주지만 순서가 절대적이지 않음
               console.log(param);
               
               $.ajax({
                  type:'POST',
                  url:'EditInfo',
                  data:param,
                  dataType:'json',
                  
                  success:function(data){
                     console.log('여기보면 돼',data);
                     alert('값이 잘 변경됐어요');
                     location.href='./myStat';
                  },
                  error:function(e){
                     console.log(e);
                     alert('서버에 문제가 생겼습니다. 고객센터에 문의하세요');
                  }
               });
            }    
            
         }else{
            
            
         }
         
      }
};




   var imgName = '';
   var file = '';

/* 20220119 파일 업로드시 썸네일 띄우기 => 프론트단 */
function loadFile(input) {   // 선택한 파일 이름
   // 1. 선택 파일 정보 가져오기
    file = input.files[0];
   //console.log('파일 정보 : ', file);

    // 2. 만들어놓은 div에 선택한 파일 이름 적어주기
    imgName = document.getElementById('fileName');
    imgName.textContent = file.name;
    //console.log(name);
    //console.log(file.name);

    //새로운 이미지 태그 생성하기(createElement)
     // blog: JavaScript에서 Blob(Binary Large Object, 블랍)은 이미지, 사운드, 비디오와 같은 멀티미디어 데이터를 다룰 때 사용
    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'userIcon');
   console.log(newImage);
    
    // 생성한 이미지 태그에 src 넣어주기(url.createObjectURL로 현재 파일 url 따옴)
    newImage.src = URL.createObjectURL(file);   
    console.log('javascript에서 해당 파일을 열 수 있는 url 생성' , URL.createObjectURL(file));
    
    // 이미지 속성 넣어주기
    newImage.style.width = "250px";
    newImage.style.height = "250px";
    //newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지를 숨긴다
    newImage.style.objectFit = "contain";

    // 이미지를 image-show div에 추가
    var container = document.getElementById('image-show');
    /* 원래 있던 이미지 지우기 */
    $('#imageChange').remove();
    $('.userIcon').remove();
    // 만들어놓은 이미지 태그 추가
    container.prepend(newImage);
    
};






</script>
</html>













