<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=13d5c33e08b7f9bd8e414183f027f399&libraries=services"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
   
</head>
<style>
#map{
    width: 30%;
    height: 400px;
      margin-bottom: 50px;
    float: right;
    margin-right: 500px;
}
table, tr, th, td{
   
    border: black 1px solid;
    border-collapse: collapse;
}
#infotable{
    width: 30%;
     float: left;
    width: 500px ;
    height: 500px;   
    margin-bottom: 50px;  
    text-align: center;
}

th{
    background-color: rgb(214, 214, 214);
}

textarea {
 width: 800px;
 height: 100px;
border: none;
resize: none;
}

#navy{

    width: 100%;
    height: 100px;
    background-color: grey;
}

#foot{

    width: 100%;
    height: 100px;
    background-color: grey;
}

         /*모달*/
.background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100vh;
      background-color: rgba(0, 0, 0, 0.3);
      z-index: 1000;
  
       /* 숨기기 */
      z-index: -1;
      opacity: 0;
        }

 .show {
      opacity: 1;
      z-index: 1000;
      transition: all .5s;
        }

.window {
      position: relative;
      width: 100%;
      height: 100%;
        }

.popup {
      position: absolute;
      top: 50%;
      left: 50%;
     
     /*transform: translate(-50%, -50%);*/
      background-color: #ffffff;
      box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
  
     /* 임시 지정 */
      width: 800px;
      height: 600px;
  
             /* 초기에 약간 아래에 배치 */
           
        }

.show .popup {
      transform: translate(-50%, -50%);
      transition: all .5s;
        }
        
.menuname{
   width:120px;
   vertical-align:middle;
   margin: 0px 
   
}

.btnAdd .btnRemove{
   font-size:0.5em;
   vertical-align:middle; 
}
        
#dietform{
   background-color: rgb(190, 190, 190);
   table-layout: fixed;
   word-break:break-all;
   }
   
    .frame{
            width: 100%;
            margin: 0 auto;
            max-width: 1200px;
            border: solid 1px black;
          }  
          
          
    .diet_table{
    
          table-layout: fixed;
    
    }      
</style>
<html>
    
   <body>
   <h1>(임시)작성페이지</h1>
       <h2>
             <c:choose>
            <c:when test="${cafe.cafe_title != '' || cafe.cafe_title != null}">
               <input type="text" name="cafe_title" id="Fixed_cafe_title" value="${cafe.cafe_title}" readonly="readonly">
            </c:when>
                <c:otherwise>
                   <input type="text" name="cafe_title" id="Fixed_cafe_title" value="아래 내용을 작성해주세요" readonly="readonly">
                </c:otherwise>
         </c:choose>
       </h2> 
       <b>조회수 : 
       ${cafe.cafe_hit}
       </b> 
       <b> 추천 :
       ${cafe.cafe_likecnt}
       </b> 
       <b> 별점 :
       <c:set var = "total" value = "0" />
       <c:set var = "avg" value = "0" />
       <c:forEach items="${reply}" var="rp">
               
             <c:set var= "total" value="${total + rp.cafereply_ratestar}"/>
             <c:set var = "avg" value = "${avg + 1}" />
       </c:forEach>
       <fmt:formatNumber type="number" maxFractionDigits="2"  value="${total/2/avg}" />
       </b>
       <hr>
   
   <div class=frame>
   
     <form action="newWrite" name="newWriteForm" method = "post" enctype="multipart/form-data">
     
    <div id="diet_frame">
      <table id="diet_table">
         <tr>
            <td>시간/요일</td>
            <td>월요일</td>
            <td>화요일</td>
            <td>수요일</td>
            <td>목요일</td>
            <td>금요일</td>
            <td>토요일</td>
            <td>일요일</td>
         </tr>
         <tr>
            <td>조식</td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
         </tr>
         <tr>
            <td>중식</td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
         </tr>
         <tr>
            <td>석식</td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">                  
                  <c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>   
         </tr>
         
      </table>
   </div>
   
        <input type="button" id="show" onclick="fn_getThisWeek('0',this)" value="식단 입력하기">
       <br>
       <br>
        
       <div class="info_frame">
         
          <table id="infotable">
             <tr>
                 <th>업체명</th>
                 <td>
                 <input id="cafe_idx" name="cafe_idx" value="${cafe.cafe_idx}" hidden="">
                 <c:choose>
                       <c:when test="${cafe.cafe_title != '' || cafe.cafe_title != null}">
                          <input type="text" name="cafe_title" id="cafe_title" value="${cafe.cafe_title}">
                       </c:when>
                       <c:otherwise>
                          <input type="text" name="cafe_title" id="cafe_title" value="">
                       </c:otherwise>
                    </c:choose>               
                  </td>
              </tr>
              <tr>
                 <th>업주 아이디</th>
                 <td><input type="text" id="mem_id" name="mem_id" value="" placeholder="아이디를 입력하세요"></td>
              </tr>
              <tr>
                 <th>업주 코드</th>
                 <td><input type="text" id="mem_bcode" name="mem_bcode" value="" placeholder="업주 코드를 입력하세요"></td>
              </tr>
              <tr>
                  <th>지역</th>
                  <td>
                  <c:choose>
                       <c:when test="${cafe.bmem_area_name != '' || cafe.bmem_area_name != null}">
                          <input type="text" name="bmem_area_name" id="bmem_area_name" value="${cafe.bmem_area_name}" readonly="readonly">
                       </c:when>
                       <c:otherwise>
                          <input type="text" name="bmem_area_name" id="bmem_area_name" value="">
                       </c:otherwise>
                    </c:choose>
                    </td>
              </tr>
              <tr>
                  <th>상세주소</th>
                  <td>
                  <c:choose>
                       <c:when test="${cafe.bmem_address != '' || cafe.bmem_address != null}">
                          <input type="text" name="bmem_address" id="bmem_address" value="${cafe.bmem_address}" readonly="readonly">
                       </c:when>
                       <c:otherwise>
                          <input type="text" name="bmem_address" id="bmem_address" value="">
                       </c:otherwise>
                    </c:choose>
                    <c:choose>
                       <c:when test="${cafe.bmem_address_detail != '' || cafe.bmem_address_detail != null}">
                          <input type="text" name="bmem_address_detail" id="bmem_address_detail" value="${cafe.bmem_address_detail}" readonly="readonly"> 
                       </c:when>
                       <c:otherwise>
                          <input type="text" name="bmem_address_detail" id="bmem_address_detail" value="">
                       </c:otherwise>
                    </c:choose>
                  </td>
             </tr>
             <tr>
                 <th>영업시간</th>
                 <td>
                 <c:choose>
                       <c:when test="${cafe.bmem_btime != '' || cafe.bmem_btime != null}">
                          <input type="text" name="bmem_btime" id="bmem_btime" value="${cafe.bmem_btime}" readonly="readonly">
                       </c:when>
                       <c:otherwise>
                          <input type="text" name="bmem_btime" id="bmem_btime" value="">
                       </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                 <th>가격</th>
                 <td>
                 <c:choose>
                       <c:when test="${cafe.cafe_diet_price != '' || cafe.cafe_diet_price != null}">
                          <input type="number" name="cafe_diet_price" id="cafe_diet_price" value="${cafe.cafe_diet_price}">
                       </c:when>
                       <c:otherwise>
                          <input type="number" name="cafe_diet_price" id="cafe_diet_price" value="">
                       </c:otherwise>
                    </c:choose>
                 </td>
           </tr>
            <tr>
                 <th>연락처</th>
                 <td>
                 <c:choose>
                       <c:when test="${cafe.bmem_tel_no != '' || cafe.bmem_tel_no != null}">
                          <input type="text" name="bmem_tel_no" id="bmem_tel_no" value="${cafe.bmem_tel_no}" readonly="readonly">
                       </c:when>
                       <c:otherwise>
                          <input type="text" name="bmem_tel_no" id="bmem_tel_no" value="">
                       </c:otherwise>
                    </c:choose>
                 </td>
            </tr>
            
          </table>
       </div> 
   
     
    <textarea name="comment" id="com" cols="30" rows="10" readonly> 
           <c:choose>
              <c:when test="${cafe.bmem_remark != '' || cafe.bmem_remark != null}">
                 ${cafe.bmem_remark}
              </c:when>
              <c:otherwise>
                 업주의 자유기입란
              </c:otherwise>
           </c:choose>
    </textarea>
    <br>
    <input type="button" id="show" onclick="submitList()" value="작성하기">
    
</form>
   </div><!-- frame 끝 -->

<!--  modal-diet form --><!-- 식단입력 팝업창 입니다. -->
            <div class="background">
                <div class="window">
                    <div class="popup" style="overflow:scroll; width:1270px; height:730px;">
                       <br>
                        <div id="diet_table">
                        &nbsp;
                              <input type="button" id="show" onclick="prevconfirm();" value="전주 식단 ">
                              
                          <input type="button" id="show" onclick="nextconfirm();" value="다음주 식단">
                        <br><hr>
                            <table style="width: 1250px ; height: 600px; cellpadding:5px" id="dietform" >
                               <tbody id="dietBody">
                                   <tr id="diet_date">
                                   </tr>
                                   <tr style="height:33%" id="diet_morning">
                                       <th>조식</th>
                                   </tr>
                                   <tr style="height:33%" id="diet_lunch">
                                       <th>중식</th>                                  
                                   </tr>
                                   <tr style="height:33%" id="diet_dinner">
                                       <th>석식</th>                               
                                   </tr>
                                </tbody>
                            </table>
                            <hr>
                            <button id="close">팝업닫기</button>
                            <input type="button" name="submit" id="diet_submit" onclick="dietSubmit(this)" value="저장" >
                       </div><!-- diet_table -->
                    </div><!-- popup -->
                </div><!-- window -->
            </div><!-- background -->
    </body>
   
<script>





function prevconfirm(){
   if(confirm('다른주의 식단을 확인하시기 전에 꼭 저장해 주세요')==true){
      fn_getThisWeek('-1',this);
   }else{
      return;
   }      
}

function nextconfirm(){
   if(confirm('다른주의 식단을 확인하시기 전에 꼭 저장해 주세요')==true){
      fn_getThisWeek('+1',this);
   }else{
      return;
   }      
}


var fileArr;
var fileInfoArr=[];
var stat = 0;//한주구하기

$(document).ready (function () {      
   
      
}); // end ready


//모달
function show() {
    document.querySelector(".background").className = "background show";
  }

  function close() {
    document.querySelector(".background").className = "background";
  }
  document.querySelector("#show").addEventListener('click', show);
  document.querySelector("#close").addEventListener('click', close);
  
  //날짜 불러오기
  function createTd(value){
        var html = '';
      
      html += '<th>일자</th>';
      for(var i = 0 ; i < 7 ; i++ ){
         html += '<td style="text-align:center;">'+value[i]+'</td>';
      }
      
      $("#diet_date").empty();
      $("#diet_date").append(html);
      show();
  }

  
   
   function getValueOfDate(){
      
       var now = new Date();
         var nowWeekDay =  now.getDate(); 
            now.setDate(now.getDate() + (stat));
         var nowDayOfWeek = now.getDay(); 
         var nowDay = now.getDate(); 
         var nowMonth = now.getMonth(); 
         var nowYear = now.getYear(); 
         
         var value = [];
         var formatDate = function(date){
          var myMonth = date.getMonth()+1; 
             var myWeekDay = date.getDate();
             
             var addZero = function(num){
              if (num < 10){
               num = "0"+num;
              }
              return num;
             }
             var md = addZero(myMonth)+addZero(myWeekDay);
             
             return md;
         }
         
         nowYear += (nowYear < 2000) ? 1900 : 0; 
         
         for(var i = 1 ; i < 8 ; i ++){
            var z = new Date(nowYear, nowMonth, nowDay + (i - nowDayOfWeek));
            value.push(nowYear+formatDate(z));
         }
         value.push(stat);
         value.push(nowWeekDay);
         
         return value;
   
   }
   function createTdAll(status, value){
      
      //console.log(status);
      if(status == 'all'){
         
         $('#diet_morning').find('td').remove();
         $('#diet_lunch').find('td').remove();
         $('#diet_dinner').find('td').remove();
         
         //input 추가-삭제-------------------------------------------
         var html = '';
         html += '<td>';
         html += '<div class="buttons" style="display: inline-block;">';
         html += '<input type="text" name="txt" data-value="1"  class= "menuname"> <input type="button" class="btnAdd" onclick="addBtn(this)" value="+"><br>';
         html += '</div>';
         html += '</td>';
         
         for(var i = 0 ; i < 21 ; i++){
            if(i <= 6){
               $('#diet_morning').append(html);
            }else if( i > 6 && i <= 13 ){
               $('#diet_lunch').append(html);
            }else if( i > 13 ){
               $('#diet_dinner').append(html);
            }
         }
         
      }else if(status == 'allWeeks'){
         //기존 식단데이터 삭제
         $('#diet_morning').find('td').remove();
         $('#diet_lunch').find('td').remove();
         $('#diet_dinner').find('td').remove();
         
         //넘겨받은 date 결과값 보유
         var before = value;
         
         //diet 정보 보관
         var arr = new Array();
          <c:forEach items="${diet}" var="item">
                  arr.push({diet_menu: "${item.diet_menu}"
                          , diet_idx : "${item.diet_idx}"
                          , diet_code : "${item.diet_code}"
                          , diet_date_name : "${item.diet_date_name}"
                         , diet_menu_seq : "${item.diet_menu_seq}"
                         , diet_date : "${item.diet_date}"
                  });
          </c:forEach>
          //console.log(arr);
          
          //console.log(value);
          
          // 식단표 출력
         for(var i = 0 ; i < 7 ; i++){
          
             var morningHtml = '';
             morningHtml += '<td style="text-align:center;">';
             morningHtml += '<div class="buttons" style="display: inline-block;">';
             
             var lunchHtml = '';
             lunchHtml += '<td style="text-align:center;">';
             lunchHtml += '<div class="buttons" style="display: inline-block;">';
             
             var dinnerHtml = '';
             dinnerHtml += '<td style="text-align:center;">';
             dinnerHtml += '<div class="buttons" style="display: inline-block;">';
             
             var mCnt = 0;
             var aCnt = 0;
             var dCnt = 0;
             
             for(var j = 0 ; j < arr.length ; j++){
                
                    var dietDate = arr[j].diet_date.substr(0,10);
                    dietDate = dietDate.replaceAll('-','');
                    //console.log(dietDate);
                    //console.log(value[8]);
                    
                   if(dietDate == value[i] && arr[j].diet_code == '1'){
                        morningHtml += '<input type="text" name="txt" data-value="'+arr[j].diet_menu_seq+'" value="'+arr[j].diet_menu+'"  class= "menuname">';
                        if((value[8] == dietDate || value[8] <= dietDate) && arr[j].diet_menu_seq == '1'){
                           morningHtml += ' <input type="button" class="btnAdd" onclick="addBtn(this)" value="+">';
                        }else if((value[8] == dietDate || value[8] <= dietDate)){
                           morningHtml += ' <input type="button" class="btnRemove" onclick="thisRemove(this)" value="-">';
                        }
                        morningHtml += '<br>';
                        
                         mCnt += 1;
                        continue;
                   }else if(dietDate == value[i] && arr[j].diet_code == '2'){
                        lunchHtml += '<input type="text" name="txt" data-value="'+arr[j].diet_menu_seq+'" value="'+arr[j].diet_menu+'"  class= "menuname">';
                        if((value[8] == dietDate || value[8] <= dietDate) && arr[j].diet_menu_seq == '1'){
                           lunchHtml += ' <input type="button" class="btnAdd" onclick="addBtn(this)" value="+">';
                        }else if((value[8] == dietDate || value[8] <= dietDate)){
                           lunchHtml += ' <input type="button" class="btnRemove" onclick="thisRemove(this)" value="-">';
                        }
                        lunchHtml += '<br>';
                        aCnt += 1;
                        continue;
                   }else if(dietDate == value[i] && arr[j].diet_code == '3'){
                        dinnerHtml += '<input type="text" name="txt" data-value="'+arr[j].diet_menu_seq+'" value="'+arr[j].diet_menu+'"  class= "menuname">';
                        if((value[8] == dietDate || value[8] <= dietDate) && arr[j].diet_menu_seq == '1'){
                           dinnerHtml += ' <input type="button" class="btnAdd" onclick="addBtn(this)" value="+">';
                        }else if((value[8] == dietDate || value[8] <= dietDate)){
                           dinnerHtml += ' <input type="button" class="btnRemove" onclick="thisRemove(this)" value="-">';
                        }
                        dinnerHtml += '<br>';
                        dCnt += 1;
                        continue;
                   }
                
             }
             
             if(mCnt == 0){
               morningHtml += '<input type="text" name="txt" data-value="1" value="" class= "menuname"> <input type="button" class="btnAdd" onclick="addBtn(this)" value="+"><br>';
               mCnt = 0;
             }
             
             if(aCnt == 0){
                  lunchHtml += '<input type="text" name="txt"  data-value="1" value="" class= "menuname"> <input type="button" class="btnAdd" onclick="addBtn(this)" value="+"><br>';
                  aCnt = 0;
             }
             
             if(dCnt == 0){
                  dinnerHtml += '<input type="text" name="txt" data-value="1"  value="" class= "menuname"> <input type="button" class="btnAdd" onclick="addBtn(this)" value="+"><br>';
                  dCnt = 0;
             }
             
             morningHtml += '</div>';
             morningHtml += '</td>';
             $('#diet_morning').append(morningHtml);
             
             lunchHtml += '</td>';
             lunchHtml += '</div>';
             $('#diet_lunch').append(lunchHtml);
             
             dinnerHtml += '</td>';
             dinnerHtml += '</div>';
             $('#diet_dinner').append(dinnerHtml);
             
          }
         
      }
      
   }

   function addBtn(obj){
      
      var allCnt = $(obj).closest("div").children(".menuname").length;
      //console.log(allCnt);
      if(allCnt > 7){
         alert('최대 생성 개수는 8개까지 입니다.');
         return;
      }else{
           $(obj.parentNode).append (          
                   '<input type="text" name="txt" data-value="'+(allCnt + 1)+'" class= "menuname"> <input type="button" class="btnRemove" onclick="thisRemove(this)" value="-"><br>'
           ); // end append         
      }
                   
   }

   function thisRemove(obj){
        $(obj).prev().remove (); // 텍스트박스 삭제
        $(obj).next ().remove (); //br삭제
        $(obj).remove (); // 버튼 삭제
   }

   
   //한주 구하기---------
    function fn_getThisWeek(status,obj){
   
         //var stat = 0;//한주구하기
         if(status == '-1'){
            stat = stat - 7;
         }else if(status == '+1'){
            stat = stat + 7;
         }else{
            stat = 0;
         }

         var now = new Date();
         var nowWeekDay =  now.getDate(); 
            now.setDate(now.getDate() + (stat));
         var nowDayOfWeek = now.getDay(); 
         var nowDay = now.getDate(); 
         var nowMonth = now.getMonth(); 
         var nowYear = now.getYear(); 
         
         var value = [];
         var formatDate = function(date){
         var myMonth = date.getMonth()+1; 
             var myWeekDay = date.getDate();
             
             var addZero = function(num){
              if (num < 10){
               num = "0"+num;
              }
              return num;
             }
             var md = addZero(myMonth)+addZero(myWeekDay);
             
             return md;
         }
         
         nowYear += (nowYear < 2000) ? 1900 : 0; 
         if(nowYear == '2021'){
            alert('전년도 데이터는 마이페이지에서 확인 가능합니다.');
               stat += 7;
            return;
         }
         //var weekStartDate = new Date(nowYear, nowMonth, nowDay + (1 - nowDayOfWeek)); 
         //var weekEndDate = new Date(nowYear, nowMonth, nowDay + (7 - nowDayOfWeek));
         
         for(var i = 1 ; i < 8 ; i ++){
            var z = new Date(nowYear, nowMonth, nowDay + (i - nowDayOfWeek));
            value.push(nowYear+formatDate(z));
         }
         value.push(stat);
         value.push(nowWeekDay);
         
         //console.log(value);
         
         if(status == '-1'){
            createTdAll('allWeeks', value);
         }else{
            createTdAll('allWeeks', value);
         }
         
         if(nowWeekDay == nowDay || nowWeekDay <= nowDay){
            $(obj).parents('div').find('input').attr('readonly',false);
            $(obj).parents('div').find('.btnAdd').css('display','inline-block');
            $(obj).parents('div').find('.btnRemove').css('display','inline-block');
         }else{
            $(obj).parents('div').find('input').attr('readonly',true);
            $(obj).parents('div').find('.btnAdd').css('display','none');
            $(obj).parents('div').find('.btnRemove').css('display','none');
         }
         
         createTd(value);
         //$("#show").trigger('click'); 
         //return value;
   }


    function getToday(){
          var date = new Date();
          var year = date.getFullYear();
          var month = ("0" + (1 + date.getMonth())).slice(-2);
          var day = ("0" + date.getDate()).slice(-2);

          return year + month + day;
    }
    
    /*
    
    allCnt 는 날짜를 구분하기 위한 값
    nextCnt 및 backCnt는 각 data-value ( diet_menu_seq 를 구분하여 map에 들어가는 값을 구분하기 위한 구분자 )
    
    */
    function dietSubmit(obj){// 식단submit
       
          var rows = $('#dietBody').find("tr");// 식단이 들어갈 tr
          var date = $('#dietBody').find("#diet_date").find('td');//td
          var morning = $('#dietBody').find("#diet_morning").find('td').find('input[name="txt"]');//끼니-아침
          var lunch = $('#dietBody').find("#diet_lunch").find('td').find('input[name="txt"]');//끼니-점심
          var dinner = $('#dietBody').find("#diet_dinner").find('td').find('input[name="txt"]');//끼니-저녁

         var map = new Map();
         var data = '[]';
         var dietData = JSON.parse(data);
         var bcode = '${diet_detail[0].mem_bcode}';
         var idx = '${diet_detail[0].cafe_idx}';
         dietData.push(bcode);
         dietData.push(idx);
         
         var startDate = '';
         var endDate = '';
         var dateArr = [];
         for(var i = 0 ; i < date.length ; i++){
            
            dateArr[i] = date[i].innerHTML;
            console.log(date[i].innerHTML);
         }
         var dataArr = '{date:'+dateArr+'}';
         dietData.push(dataArr);
         
         var marr = [];//아침식단배열
         var larr = [];//아침식단배열
         var darr = [];//아침식단배열
         var allCnt = -1;
         
         var backCnt = 0;
         var nextCnt = 0;
         
         for( var i = 0 ; i < morning.length ; i++ ){
            
            nextCnt = morning[i].dataset['value'];
            
            console.log(backCnt + ' , ' +nextCnt);
            if(backCnt > nextCnt){
               //console.log('backCnt 가 커서 여기로 들어옴');
               allCnt += 1;
               
               var name = date[allCnt].innerHTML+'M';
               var dataArr = '{'+name+':'+marr+'}';
               
               dietData.push(dataArr);
               marr = [];
            }
            
            /*else if(backCnt == nextCnt && (backCnt + nextCnt) > 2){
               allCnt += 1;
               map.set( date[allCnt].innerHTML+'M' , marr );
               marr = [];
               nextCnt = 0;
               if(i == morning.length - 1){
                  backCnt = 0;
               }
            }*/
            
            
            var morningValue = morning[i].value;         
            if(morningValue != '' && morningValue != 'undefined' && morningValue != null){//아침식사배열 안의 값이 null이 아니라면...
               marr.push( morningValue );//아침식사배열에 값을  널는다.
            }else{
               allCnt += 1; //null 일경우 allcnt 누적
            }
            
            backCnt = morning[i].dataset['value'];//backcnt는 아침배열의 수 만큼
         }
         
         allCnt = -1;
         
         for( var i = 0 ; i < lunch.length ; i++ ){
            
            nextCnt = lunch[i].dataset['value'];
            
            //console.log(backCnt + ' , ' +nextCnt);
            if(backCnt > nextCnt){
               allCnt += 1;
               
               var name = date[allCnt].innerHTML+'L';
               var dataArr = '{'+name+':'+larr+'}';
               
               dietData.push(dataArr);
               larr = [];
            }
            /*else if(backCnt == nextCnt && (backCnt + nextCnt) > 2){
               allCnt += 1;
               console.log(allCnt);
               map.set( date[allCnt].innerHTML+'L' , larr );
               marr = [];
               nextCnt = 0;
               if(i == lunch.length - 1){
                  backCnt = 0;
               }
            }*/
            
            var lunchValue = lunch[i].value;
            
            if(lunchValue != '' && lunchValue != 'undefined' && lunchValue != null){
               larr.push(lunchValue);
            }else{
               allCnt += 1;
            }
            
            backCnt = lunch[i].dataset['value'];
         }
         
         allCnt = -1;
   
         for( var i = 0 ; i < dinner.length ; i++ ){
            
            nextCnt = dinner[i].dataset['value'];
            
            if(backCnt > nextCnt){
               //console.log('backCnt 가 커서 여기로 들어옴');
               allCnt += 1;
               
               var name = date[allCnt].innerHTML+'D';
               var dataArr = '{'+name+':'+darr+'}';
               
               dietData.push(dataArr);
               darr = [];
            }
            /*else if(backCnt == nextCnt && (backCnt + nextCnt) > 2){
               allCnt += 1;
               map.set( date[allCnt].innerHTML+'D' , darr );
               marr = [];
               nextCnt = 0;
               if(i == dinner.length - 1){
                  backCnt = 0;
               }
            }*/
            
            var dinnerValue = dinner[i].value;
            
            if(dinnerValue != '' && dinnerValue != 'undefined' && dinnerValue != null){
               darr.push(dinnerValue);
            }else{
               allCnt += 1;
            }
            
            backCnt = dinner[i].dataset['value'];
            
         }
         
         allCnt = -1;
         
         var conStr = confirm("정말로 저장하시겠습니까?");
         if(conStr){
            
         }else{
            return;
         }
       
         console.log('=======================');
         console.log(JSON.stringify(dietData));
         console.log('=======================');
         var strData = JSON.stringify(dietData);
         $.ajaxSetup({
             headers: { "AJAX": "true" }
         });
         //식단 넘기기
         $.ajax({
            type:'post',
            url: 'diet_save',
            data: strData,
            dataType : 'JSON',
            contentType : "application/json; charset=UTF-8",
            async: false,
            success:function(data){
               alert('식단표 등록에 성공하였습니다.');
               window.location.reload();
            },
            error:function(e){
               console.log(e);
            }
         });
         
    }
    


    function submitList(){
       
       var nwf = document.newWriteForm;
       var memId = document.getElementById("mem_id");
       var bCode = document.getElementById("mem_bcode");
       
       console.log(nwf);
          console.log(memId);
       console.log(bCode);
       
       if(memId.value == "" || memId.value == null){
          
          alert("업주 회원 아이디를 등록해주세요");
          nwf.mem_id.focus();
          return false;
          
       }else if(bCode.value == "" || bCode.value  == null){
          
          alert("업주 코드를 등록해주세요");
          nwf.mem_bcode.focus();
          return false;
          
       }else{
         newWriteForm.submit();
       }
       
       
       
    }










</script>

</html>