<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=13d5c33e08b7f9bd8e414183f027f399&libraries=services"></script>
<style>
   #buis_img{
       width: 500px;
       height: 200px;
       background-color: cadetblue;
   }

   #diet_table{
      width: 500px;
      height: 200px;
      background-color: yellowgreen;
   }

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
   
   table{
       width: 30%;
       float: left;
       margin-bottom: 50px;  
   }

   th{
       background-color: rgb(214, 214, 214);
   }

   #remark{
      width: 70%;
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

   #diet_table{
      width: 800px;
      text-align: center;
      font-size: xx-small;
   }
   
   #infoArea{
      height: 300px;
   }
   
   tbody{
      width : 100%;
   }
   
   #replyArea{
   		width : 1500px;
   }

</style>
<html>
   <!-- header s -->
         <div id="navy">
            NAVY
          </div>
   <!-- header e -->    
<body>
   <h1>(임시)상세페이지</h1>
   <h2>구내식당 업체명</h2> 
   <b>조회수 : ${cafe.cafe_hit} </b> <b> 좋아요 : ${cafe.cafe_likecnt} </b> <b> 별점 : ${cafe.cafe_ratestaravg} </b>
   <hr>
   
   <div id="buis_img">
      업장 이미지가 들어갈 자리
   </div>
   <br>
   <div id="diet_table">
      <table id="diet_table">
         <tr>
            <td>시간/요일</td>
            <td>월요일</td>
            <td>회요일</td>
            <td>수요일</td>
            <td>목요일</td>
            <td>금요일</td>
            <td>토요일</td>
            <td>일요일</td>
         </tr>
         <tr>
            <td>조식</td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
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
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
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
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null || dt.diet_menu =''}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">
                  <c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet}" var="dt">                  
                  <c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>휴무 입니다.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>   
         </tr>
         
      </table>
   </div>
       
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
       
   <table id="infoArea">
      <tr>
         <th>업체명</th>
         <td>${cafe.cafe_title}</td>
      </tr>
      <tr>
         <th>지역</th>
         <td>${cafe.bmem_area_name}</td>
      </tr>
      <tr>
         <th>상세주소</th>
         <td>${cafe.bmem_address} , ${cafe.bmem_address_detail}</td>
      </tr>
      <tr>
         <th>영업시간</th>
         <td>${cafe.bmem_btime}</td>
      </tr>
      <tr>
         <th>가격</th>
         <td>${cafe.cafe_diet_price} 원</td>
      </tr>
      <tr>
         <th>연락처</th>
         <td>${cafe.bmem_tel_no}</td>
      </tr>
   </table>
   
<br>
<div id="map"> </div>
    
<br><br><br><br><br><br><br><br><br>
<br>

<textarea id="remark" name="comment" id="com" cols="30" rows="10" readonly> 
   ${cafe.bmem_remark}
</textarea>

<br><br><br>

<div>
   <table id="replyArea" >
      <tr>
         <td>
            <span>작성자</span><br/>
            <span>별점 : </span>
         </td>
         <td>내용</td>
         <td>작성일</td>
      </tr>
    	  <c:forEach items="${reply}" var="rp">
      		<tbody id="replyListCall${rp.cafereply_idx}">

      		</tbody>
	     </c:forEach>
		<tr>
			<td>회원 이름</td>
			<td><textarea id="recon" placeholder="댓글을 입력하세요" style="width: 100%; height: 100px" ></textarea></td>
			<td><input type="button" id="addReply" value="입력" onclick="addReply(${cafe.cafe_idx});"/></td>
			<td hidden=""><input id="replyList" value="${cafe.cafe_idx}" /></td>
		</tr>
   </table>
</div>



<br><br><br><br><br><br><br><br><br><br><br>

</body>

<script>

var replyListNo = $('#replyList').val();

replyList(replyListNo);

function replyList(idx){
	
	console.log(idx);
	
	 $.ajax({
         type:'POST',
         url:'replyList',
         data:{'idx' : idx},
         dataType:'JSON',
         success:function(data){
        	console.log("댓글 정보 "+data);
        	replyListDraw(data)
         },
         error:function(e){
            console.log("에러 발생   "+e);
         }
      });      
	
}

function replyListDraw(data){
	
	for(var i = 0; i<data.length; i++){
		var replyListCall ="#replyListCall"+data[i].cafereply_idx;
		$(replyListCall).empty();	
	}
			
	if(data.length >0){
		
		for(var i = 0; i<data.length; i++){
			
			var replyListCall ="#replyListCall"+data[i].cafereply_idx;
			var replyPostTime = data[i].cafereply_posttime;
			var date = new Date(replyPostTime);
			var content="";
			var recoTbody = "";

			content += "<tr>";
			content += "<td>";
			content += "<span>"+data[i].mem_nick+"</span><br/>";
			content += "<span>별점 : "+data[i].cafereply_ratestar+"</span>";
			content += "</td>";
			content += "<td>";
			if(data[i].cafereply_rewritechk>0){
				content += data[i].cafereply_content+"(수정 됨)";				
			}else{
				content += data[i].cafereply_content;
			}
			content += "<br/>";	
			if(data[i].cafereply_recommentcnt >=1){
				content += "<a id=commentCall"+data[i].cafereply_idx+" href=javascript:void(0); onclick=recoCall("+data[i].cafereply_idx+")>답글 더 보기</a>";	
			}
			content += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
			content += "<a id=addReco href=javascript:void(0); onclick=recoBoxCall("+data[i].cafe_idx+","+data[i].cafereply_idx+");>답글 달기</a>";
			content += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
			content += '<a href="javascript:void(0);" onclick="replyRew(\'' + data[i].cafereply_idx +'\',\'' + data[i].cafereply_content +'\',\''+data[i].cafe_idx+'\');">수정</a>';
			content += "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";
			content += "<a href=javascript:void(0); onclick=replyDel(\""+data[i].cafereply_idx+"\",\""+data[i].cafe_idx+"\");>삭제</a>";
			content += "</td>";
			content += "<td>"+
			date.getFullYear()+"-"
		      +("0"+(date.getMonth()+1)).slice(-2)+"-"
		      +("0" + date.getDate()).slice(-2)+" "
		      +("0" + date.getHours()).slice(-2)+":"
		      +("0" + date.getMinutes()).slice(-2)+":"
		      +("0" + date.getSeconds()).slice(-2)+"."
		      +"0"
			+"</td>";
			content += "</tr>";
			recoTbody += "<tbody id=recommentArea"+data[i].cafereply_idx+"></tbody>";
			recoTbody += "<tbody id=addRecoArea"+data[i].cafereply_idx+"></tbody>";
	
			$(replyListCall).append(content);
			$(replyListCall).append(recoTbody);
			
		}
	
		
	}
	
}








var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${cafe.bmem_address}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${cafe.cafe_title}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    





function recoCall(idx){
      console.log("대댓 정보 요청중");


      $.ajax({
         type:'POST',
         url:'recommentCall',
         data:{'idx' : idx},
         dataType:'JSON',
         success:function(data){
           // console.log("대댓 전송 완료" + data.listcall);
            listDraw(data.listcall, idx);
            //console.log(data.listcall);
            
         },
         error:function(e){
            console.log("에러 발생   "+e);
         }
      });      
   }
   

function listDraw(listcall, idx){
   
   var recommentArea = '#recommentArea'+idx; 
   var commentCall = '#commentCall'+idx;
   console.log(recommentArea);
   console.log(commentCall);
   
   var content = "";
   
   for(var i=0; i<listcall.length; i++){
	   
	   var timestamp = listcall[i].recomment_posttime;
	   var date = new Date(timestamp)
      
      content += '<tr>';
      content += '<td>';
      content += '<span>'+listcall[i].mem_nick+'</span><br/>';
      content += '</td>';
      content += '<td>'
      + listcall[i].recomment_content +"<br/>"
      +'<span>'
      +'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
      +'<a id="" href="javascript:void(0);" onclick="">수정</a>'
      +'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
      +'<a id="" href="javascript:void(0);" onclick="">삭제</a>'
      +'</span>'
      +'</td>';
      content += '<td>'+ 
      date.getFullYear()+"-"
      +("0"+(date.getMonth()+1)).slice(-2)+"-"
      +("0" + date.getDate()).slice(-2)+" "
      +("0" + date.getHours()).slice(-2)+":"
      +("0" + date.getMinutes()).slice(-2)+":"
      +("0" + date.getSeconds()).slice(-2)+"."
      +"0"
      +'</td>';
      content += '</tr>';

   }
   $(recommentArea).append(content);

   $(commentCall).html('간략히 보기');
   
   $(commentCall).attr("onclick","recoHide("+idx+");");
   
}


function recoHide(idx){
	var recommentArea = '#recommentArea'+idx;
	var commentCall = '#commentCall'+idx;
	
   $(recommentArea).empty();   
   
   $(commentCall).html('답글 더 보기');
   
   $(commentCall).attr("onclick","recoCall("+idx+");");
   

};



function addReply(idx){
	
	//* param에 저장해서 보내줄 값
	//번호는 DB에서 자동 입력
	//댓글 등록 시간.
	//댓글 수정 시간은 수정폼에서
	//*2.	댓글 내용
	//댓글 좋아요는 댓글 보기에서
	//*3.	별점
	//기본 댓글 상태는 null
	//수정 여부를 표시하는 것도 수정 폼에서
	//대댓수는 대댓글이 달릴 때 업데이트
	//*4.	게시글의 번호 (댓글이 귀속될 게시글의 번호) 
	//*5.	유저ID
	  
	 if($("#recon").val() != ""){
	      
	      var recon = $("#recon").val();
	      var idx = idx;
	      
	      var param = {};
	      param.recon = recon;
	      param.idx = idx;

	      console.log(param);
	      
	       $.ajax({
	            type:'POST',   
	            url:'addreply',
	            data:param,
	            dataType:'JSON',
	            success:function(data){
	               console.log(data.success);
	               if(data.success>0){
	                  $("#recon").val('');
	               }
	            },
	            error:function(e){
	               
	            }
	         });    
	       
	   
	   
	   }

	
};




function recoBoxCall(Cidx, Ridx){
	
	var content = "";
	var addRecoArea = "#addRecoArea"+Ridx;


	content += '<tr>';
    content += '<td>회원 이름</td>';
    content += '<td><textarea id="recoBox" placeholder="답글을 입력하세요"></textarea></td>';
    content += '<td><input type="button" id="addReply" value="입력" onclick="addRecomment('+Ridx+','+Cidx+');"/></td>';
    content += '</tr>';
    
    $(addRecoArea).append(content);

    
};




function addRecomment(Ridx,Cidx){
	
	//console.log(Ridx,Cidx);
	
	
	if($("#recoBox").val() != ""){
			
			var recoBox = $("#recoBox").val();
			var Ridx = Ridx;
			var Cidx = Cidx;
			
			var param = {};
			param.recoBox = recoBox;
			param.Cidx = Cidx;
			param.Ridx = Ridx;
	
			//console.log(param);
		   
			
			
			 $.ajax({
		         type:'POST',	
		         url:'addRecomment',
		         data:param,
		         dataType:'JSON',
		         success:function(data){
		        	 console.log(data.success);
		        	 if(data.success>0){
		        		 $("#addRecoArea"+Ridx).empty();
		        	 }
		         },
		         error:function(e){
		            
		         }
		      });    
			 
		}
};




function replyRew(Ridx, oriReply, cafeidx){
	
	var content = "";
	
	content += '<tbody id="replyListCall'+Ridx+'">'	
	content += '<tr>';
    content += '<td>회원 이름</td>';
    content += '<td><textarea id="updateReply'+Ridx+'" placeholder="답글을 입력하세요" style="width: 100%; height: 100px">'+oriReply+'</textarea></td>';
    content += '<td><input type="button" id="" value="수정하기" onclick="updateReply(\'' + Ridx +'\',\'' +cafeidx + '\');"/><input type="button" id="" value="취소" onclick="replyList('+cafeidx+')"/></td>';
    content += '</tr>';
    content += '</tbody>'
    
   // $("#updateReply"+idx).val() = $("#replyArea"+idx+"#text").val();
    $("#replyListCall"+Ridx).replaceWith(content);
    
	
};

function updateReply(Ridx,cafeidx){

	 var $newContent = $("#updateReply"+Ridx).val();
	 
	 var param = {};
	 
	 param.newContent = $newContent;
	 param.Ridx = Ridx;
	 
	 $.ajax({
         type:'POST',	
         url:'updateReply',
         data:param,
         dataType:'JSON',
         success:function(data){
        	 //console.log(data.success);
        	 if(data.success>0){
        		 replyList(cafeidx);
        	 }
         },
         error:function(e){
            
         }
      });    

	
}




	
function replyDel(idx, cafeidx){
	
	var reDelCon = confirm("정말로 삭제하시겠습니까?");
	
	
	if(reDelCon){
		
		$.ajax({
	         type:'POST',	
	         url:'replyDel',
	         data:{'idx' : idx},
	         dataType:'JSON',
	         success:function(data){
	        	 if(data.success>0){
	        		console.log("삭제 되었습니다.");
	        		replyList(cafeidx);
	        	 }
	         },
	         error:function(e){
	            
	         }
	      });    
	}
};







</script>

</html>