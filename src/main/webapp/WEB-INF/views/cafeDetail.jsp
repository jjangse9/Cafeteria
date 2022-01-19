<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=13d5c33e08b7f9bd8e414183f027f399&libraries=services"></script>
<style>
#buis_img {
	width: 500px;
	height: 200px;
	background-color: cadetblue;
}

#diet_table {
	width: 500px;
	height: 200px;
	background-color: yellowgreen;
}

#map {
	width: 30%;
	height: 400px;
	margin-bottom: 50px;
	float: right;
	margin-right: 500px;
}

table, tr, th, td {
	border: black 1px solid;
	border-collapse: collapse;
}

table {
	width: 30%;
	float: left;
	margin-bottom: 50px;
}

th {
	background-color: rgb(214, 214, 214);
}

#remark {
	width: 70%;
	height: 100px;
	border: none;
	resize: none;
}

#navy {
	width: 100%;
	height: 100px;
	background-color: grey;
}

#foot {
	width: 100%;
	height: 100px;
	background-color: grey;
}

#diet_table {
	width: 800px;
	text-align: center;
	font-size: xx-small;
}

#infoArea {
	height: 300px;
}

tbody {
	width: 100%;
}

#replyArea {
	width: 1500px;
}

#likeArea {
	display: flex;
	justify-content: center;
}

#likeCnt {
	display: flex;
	justify-content: center;
	font-size: x-large;
}

.blind {
	position: absolute;
	overflow: hidden;
	margin: -1px;
	padding: 0;
	width: 1px;
	height: 1px;
	border: none;
	clip: rect(0, 0, 0, 0);
}

.startRadio {
	display: inline-block;
	overflow: hidden;
	height: 40px;
}

.startRadio:after {
	content: "";
	display: block;
	position: relative;
	z-index: 10;
	height: 40px;
	background:
		url("data:image/png;base64,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")
		repeat-x 0 0;
	background-size: contain;
	pointer-events: none;
}

.startRadio__box {
	position: relative;
	z-index: 1;
	float: left;
	width: 20px;
	height: 40px;
	cursor: pointer;
}

.startRadio__box input {
	opacity: 0 !important;
	height: 0 !important;
	width: 0 !important;
	position: absolute !important;
}

.startRadio__box input:checked+.startRadio__img {
	background-color: #0084ff;
}

.startRadio__img {
	display: block;
	position: absolute;
	right: 0;
	width: 500px;
	height: 40px;
	pointer-events: none;
}
</style>
<html>
<!-- header s -->
<div id="navy">NAVY</div>
<!-- header e -->
<body>
	<h1>(임시)상세페이지</h1>
	<h2>구내식당 업체명</h2>
	<b>조회수 : ${cafe.cafe_hit} </b>
	<b> 좋아요 : ${cafe.cafe_likecnt} </b>
	<b id="rateAvg"> 별점 : </b>
	<hr>

	<div id="buis_img">업장 이미지가 들어갈 자리</div>
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
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 01}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td>중식</td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 02}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
			</tr>
			<tr>
				<td>석식</td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '월요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '화요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '수요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '목요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null || dt.diet_menu =''}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '금요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '토요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
				<td><c:forEach items="${diet}" var="dt">
						<c:if test="${dt.diet_date_name eq '일요일' && dt.diet_code == 03}">
							<c:if test="${dt.diet_menu eq null}">
								<span>휴무 입니다.</span>
							</c:if>
							<span>${dt.diet_menu}</span>
							<br />
						</c:if>
					</c:forEach></td>
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
			<td>${cafe.bmem_address}, ${cafe.bmem_address_detail}</td>
		</tr>
		<tr>
			<th>영업시간</th>
			<td>${cafe.bmem_btime}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${cafe.cafe_diet_price}원</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${cafe.bmem_tel_no}</td>
		</tr>
	</table>

	<br>
	<div id="map"></div>

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

	<textarea id="remark" name="comment" id="com" cols="30" rows="10"
		readonly> 
   ${cafe.bmem_remark}
</textarea>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



	<div id="likeArea">
		<span> <img id="likeChk" src="./resources/images/like.png"
			width="100px" height="100px" style="cursor: pointer;" />
		</span>
	</div>
	<br />
	<div id="likeCnt">
		<span style="color: #ed3f27;"><b>${cafe.cafe_likecnt}</b></span>
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

	<div>
		<table id="replyArea">
			<tr>
				<td><span>작성자</span><br /> <span>별점 : </span></td>
				<td>내용</td>
				<td>작성일</td>
			</tr>
			<c:forEach items="${reply}" var="rp">
				<tbody id="replyListCall${rp.cafereply_idx}">

				</tbody>
				<tbody id="recommentArea${rp.cafereply_idx}"></tbody>
				<tbody id="addRecoArea${rp.cafereply_idx}"></tbody>
			</c:forEach>
			<tr>
				<td>회원 이름</td>
				<td>
					<div class="startRadio">
						<label class="startRadio__box"> <input type="radio"
							name="star" id="" value="1"> <span
							class="startRadio__img"><span class="blind">별 1개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="2"> <span
							class="startRadio__img"><span class="blind">별 1.5개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="3"> <span
							class="startRadio__img"><span class="blind">별 2개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="4"> <span
							class="startRadio__img"><span class="blind">별 2.5개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="5"> <span
							class="startRadio__img"><span class="blind">별 3개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="6"> <span
							class="startRadio__img"><span class="blind">별 3.5개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="7"> <span
							class="startRadio__img"><span class="blind">별 4개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="8"> <span
							class="startRadio__img"><span class="blind">별 4.5개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="9"> <span
							class="startRadio__img"><span class="blind">별 5개</span></span>
						</label> <label class="startRadio__box"> <input type="radio"
							name="star" id="" value="10"> <span
							class="startRadio__img"><span class="blind">별 5.5개</span></span>
						</label>
					</div> <textarea id="recon" placeholder="댓글을 입력하세요"
						style="width: 100%; height: 100px"></textarea>
				</td>
				<td><input type="button" id="addReply" value="입력"
					onclick="addReply(${cafe.cafe_idx});" /></td>
				<td hidden=""><input id="replyList" value="${cafe.cafe_idx}" /></td>
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

</body>

<script>

var replyListNo = $('#replyList').val();

var limit = 0;

replyList(replyListNo);

function replyList(idx){
	
	console.log(idx);
	
	 $.ajax({
         type:'POST',
         url:'replyList',
         data:{'idx' : idx},
         dataType:'JSON',
         success:function(data){
        	//console.log("댓글 정보 "+data);
        	replyListDraw(data)
         },
         error:function(e){
            console.log("에러 발생   "+e);
         }
      });      
	
}

function replyListDraw(data){
	
	limit += 1;
	
	for(var i = 0; i<data.length; i++){
		var replyListCall ="#replyListCall"+data[i].cafereply_idx;
		$(replyListCall).empty();	
	}
			
	if(data.length >0){
		
		var rateAvg = [];
		
		for(var i = 0; i<data.length; i++){
			
			var replyListCall ="#replyListCall"+data[i].cafereply_idx;
			var replyPostTime = data[i].cafereply_posttime;
			var date = new Date(replyPostTime);
			var content="";
			var recoTbody = "";
			
			rateAvg[i] = data[i].cafereply_ratestar;
			
			var replyStar = ".replyStar"+data[i].cafereply_idx
			
			if(data[i].cafereply_stat == 1){
			
				content += "<tr>";
				content += "<td>";
				content += "<span>"+data[i].mem_nick+"</span><br/>";
				content += "<span>별점 : "
				+'<div class="startRadio replyStar'+data[i].cafereply_idx+'">'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="1">'
				    +'<span class="startRadio__img"><span class="blind">별 1개</span></span>+'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio"  disabled name="star'+data[i].cafereply_idx+'" id="" value="2">'
				    +'<span class="startRadio__img"><span class="blind">별 1.5개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="3">'
				    +'<span class="startRadio__img"><span class="blind">별 2개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				   +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="4">'
				    +'<span class="startRadio__img"><span class="blind">별 2.5개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="5">'
				    +'<span class="startRadio__img"><span class="blind">별 3개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="6">'
				    +'<span class="startRadio__img"><span class="blind">별 3.5개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="7">'
				    +'<span class="startRadio__img"><span class="blind">별 4개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="8">'
				    +'<span class="startRadio__img"><span class="blind">별 4.5개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="9">'
				    +'<span class="startRadio__img"><span class="blind">별 5개</span></span>'
				  +'</label>'
				  +'<label class="startRadio__box">'
				    +'<input type="radio" disabled name="star'+data[i].cafereply_idx+'" id="" value="10">'
				    +'<span class="startRadio__img"><span class="blind">별 5.5개</span></span>'
				  +'</label>'
				+'</div>'
				
				+"</span>";
				
				
				
				
				
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
				//recoTbody += "<tbody id=recommentArea"+data[i].cafereply_idx+"></tbody>";
				//recoTbody += "<tbody id=addRecoArea"+data[i].cafereply_idx+"></tbody>";
		
				
				$(replyListCall).append(content);
				//$(replyListCall).append(recoTbody);
				
				//console.log(".replyStar"+data[i].cafereply_idx);
			
				//$(".replyStar"+data[i].cafereply_idx+" input[name=star"+data[i].cafereply_idx+"] [value="+data[i].cafereply_ratestar+"]").prop('checked' , true);
				
				//console.log($(".replyStar"+data[i].cafereply_idx).find('input[name=star'+data[i].cafereply_idx));
				var onCheckedRadio = $(".replyStar"+data[i].cafereply_idx).find('input[name=star'+data[i].cafereply_idx);
				//console.log(data[i].cafereply_ratestar);
				for(var j = 0 ; j < data[i].cafereply_ratestar ; j++){
					onCheckedRadio[j].checked = true;
				}
				
				
				//console.log(rateAvg);
				
				
				
				
			}else if(data[i].cafereply_stat == 2){
			
				content += "<tr>";
				content += "<td>";
				content += "<span>블라인드</span>";
				content += "</td>";
				content += "<td>";
				content += "블라인드 처리된 댓글입니다.";
				content += "<br/>";	
				if(data[i].cafereply_recommentcnt >=1){
					content += "<a id=commentCall"+data[i].cafereply_idx+" href=javascript:void(0); onclick=recoCall("+data[i].cafereply_idx+")>답글 더 보기</a>";	
				}
				content += "</td>";
				content += "<td>정보가 없습니다.</td>";
				content += "</tr>";
				//recoTbody += "<tbody id=recommentArea"+data[i].cafereply_idx+"></tbody>";
				//recoTbody += "<tbody id=addRecoArea"+data[i].cafereply_idx+"></tbody>";
		
				$(replyListCall).append(content);
				//$(replyListCall).append(recoTbody);
				
			}else if(data[i].cafereply_stat == 3){
			
				content += "<tr>";
				content += "<td>";
				content += "<span>삭제</span>";
				content += "</td>";
				content += "<td>";
				content += "삭제된 댓글입니다.";
				content += "<br/>";	
				if(data[i].cafereply_recommentcnt >=1){
					content += "<a id=commentCall"+data[i].cafereply_idx+" href=javascript:void(0); onclick=recoCall("+data[i].cafereply_idx+")>답글 더 보기</a>";	
				}
				content += "</td>";
				content += "<td>정보가 없습니다.</td>";
				content += "</tr>";
				//recoTbody += "<tbody id=recommentArea"+data[i].cafereply_idx+"></tbody>";
				//recoTbody += "<tbody id=addRecoArea"+data[i].cafereply_idx+"></tbody>";
		
				$(replyListCall).append(content);
				//$(replyListCall).append(recoTbody);
			}
		
		}
	}	
			//console.log(rateAvg);
			var Avg = 0;
			
			for(var i = 0; i<rateAvg.length; i++){
				Avg += rateAvg[i]
			}
			
			var starAvg = (Avg/2)/rateAvg.length;
			
			if(limit == 1){
				$("#rateAvg").append(starAvg.toFixed(2));			
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
   
   var cfIdx = [];
   var replyIdx = [];
   var recoIdx = [];
   var rcCom = [];
   
   for(var i=0; i<listcall.length; i++){
	   
	   var content = "";
	   
	   var timestamp = listcall[i].recomment_posttime;
	   var date = new Date(timestamp);
	   
	   cfIdx[i] = listcall[i].cafe_idx;
	   replyIdx[i] = listcall[i].cafereply_idx;
	   recoIdx[i] = listcall[i].recomment_idx;
	   rcCom[i] = listcall[i].recomment_content;
	   
		//console.log(cfIdx[i]);
      
	  if(listcall[i].recomment_stat == 1 ){
		  
	      content += '<tr id="receDelClear'+replyIdx+'">';
	      content += '<td>';
	      content += '<span>'+listcall[i].mem_nick+'</span><br/>';
	      content += '</td>';
	      content += '<td>';
	      if(listcall[i].recomment_rewritechk>0){
	    	  content += listcall[i].recomment_content+"(수정 됨)"+"<br/>";				
			}else{
				content += listcall[i].recomment_content
			}
	      
	      content += '<span>'
	      +'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
	      +'<a id="" href="javascript:void(0);" onclick="recoRew(\''+cfIdx[i]+'\',\''+replyIdx[i]+'\',\''+recoIdx[i]+'\',\''+rcCom[i]+'\');">수정</a>'
	      +'&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'
	      +'<a id="" href="javascript:void(0);" onclick="recoDel(\''+recoIdx[i]+'\',\''+cfIdx[i]+'\',\''+replyIdx[i]+'\');">삭제</a>'
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
      
		  $(recommentArea).append(content);
		  
	  }else if(listcall[i].recomment_stat == 2 ){
		  
		  content += '<tr>';
	      content += '<td>';
	      content += '<span>블라인드</span><br/>';
	      content += '</td>';
	      content += '<td>블라인드 처리된 댓글입니다.</td>';
	      content += '<td>정보가 없습니다.</td>';
	      content += '</tr>';
      
		  $(recommentArea).append(content);
      
	  }else if(listcall[i].recomment_stat == 3 ){
		  
	      content += '<tr>';
	      content += '<td>';
	      content += '<span>삭제</span><br/>';
	      content += '</td>';
	      content += '<td>삭제된 댓글입니다.</td>';
	      content += '<td>정보가 없습니다.</td>';
	      content += '</tr>';
      
		  $(recommentArea).append(content);
	  }

   }

   $(commentCall).html('간략히 보기');
   
   $(commentCall).attr("onclick","recoHide(\""+idx+"\",\""+replyIdx+"\");");
   
}


function recoHide(idx, Ridx){
	var recommentArea = '#recommentArea'+idx;
	var commentCall = '#commentCall'+idx;
	
	var content = "";
	
	var listcall = Ridx[0]+Ridx[1];
	
   $(recommentArea).empty();   
   
   
   
	
	//console.log("Ridx[0] 의 값 : "+Ridx[0]);
	//console.log("Ridx[1] 의 값 : "+Ridx[1]);

	//console.log("댓글 숨기고 다시 불러올 영역 번호 : "+listcall );
	
	if(listcall >= 10){
		content += '<tbody id="recommentArea'+listcall+'">';
		content += '</tbody>';
		$("#recoRewClear"+listcall).empty();
		$("#recoRewClear"+listcall).replaceWith(content);
	}else{
		content += '<tbody id="recommentArea'+Ridx[0]+'">';
		content += '</tbody>';
  		$("#recoRewClear"+Ridx[0]).empty();
		$("#recoRewClear"+Ridx[0]).replaceWith(content);	
	}
	
	console.log(content);
   
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
	
	var recon = $("#recon").val();
	var idx = idx;
	var star_rate = $(".startRadio input[type=radio]:checked").val();     
	
	if(recon == ""){
		
  	  alert("댓글을 입력해 주세요.");
  	  
    }else if($("#recon").val() != ""){     
                                                              
	      var param = {};
	      param.recon = recon;
	      param.idx = idx;
	      param.rate = star_rate;

	      //console.log(param);
	      
	      if(star_rate === undefined){
	    	  alert("점수를 선택해 주세요.");
	      }else{
	    	  
		       $.ajax({
		            type:'POST',   
		            url:'addreply',
		            data:param,
		            dataType:'JSON',
		            success:function(data){
		               console.log(data.success);
		               if(data.success>0){
		                  $("#recon").val('');2
		                  $(".startRadio input[type=radio]").prop('checked', false);
		               }
		            },
		            error:function(e){
		               
		            }
		         });    
	      }
	      
	       
	   
	   
	   }

	
};




function recoBoxCall(Cidx, Ridx){
	
	var content = "";
	var addRecoArea = "#addRecoArea"+Ridx;
	
	if(document.getElementById("addRecoBox")==null){
    
	    content += '<tr id="addRecoBox">';
	    content += '<td>회원 이름</td>';
	    content += '<td><textarea id="recoBox" placeholder="답글을 입력하세요" style="width: 100%; height: 100px" cols="30" rows="10"></textarea></td>';
	    content += '<td><input type="button" id="addReply" value="답글 입력" onclick="addRecomment('+Ridx+','+Cidx+');"/><input type="button" value="취소" onclick="cancelAddReco('+Ridx+');"/></td>';
	    content += '</tr>';
	    
	    $(addRecoArea).append(content);
	}else{
		alert("답글을 입력해 주세요");
	}
    
};


function cancelAddReco(Ridx){
	
	$("#addRecoArea"+Ridx).empty();
	
}




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
	
	//content += '<tbody id="replyListCall'+Ridx+'">'	
	content += '<tr id="replyRewClear'+Ridx+'">';
    content += '<td>회원 이름</td>';
    content += '<td><textarea id="updateReply'+Ridx+'" placeholder="답글을 입력하세요" style="width: 100%; height: 100px" cols="30" rows="10">'+oriReply+'</textarea></td>';
    content += '<td><input type="button" id="" value="수정하기" onclick="updateReply(\'' + Ridx +'\',\'' +cafeidx + '\');"/><input type="button" id="" value="취소" onclick="cancelReRew(\'' + Ridx +'\',\'' +cafeidx + '\')"/></td>';
    content += '</tr>';
    //content += '</tbody>'
    
   // $("#updateReply"+idx).val() = $("#replyArea"+idx+"#text").val();
    $("#replyListCall"+Ridx).replaceWith(content);
};


function cancelReRew(Ridx, cafeidx){
	
	 var content = "";
	 
	 content += '<tbody id="replyListCall'+Ridx+'">';
	 content += '</tbody>';
	
	 $("#replyRewClear"+Ridx).empty();
	 $("#replyRewClear"+Ridx).replaceWith(content);
	 replyList(cafeidx);
}



function updateReply(Ridx,cafeidx){

	 var $newContent = $("#updateReply"+Ridx).val();
	 
	 var content = "";
	 
	 var param = {};
	 
	 param.newContent = $newContent;
	 param.Ridx = Ridx;
	 
	 
	 content += '<tbody id="replyListCall'+Ridx+'">';
	 content += '</tbody>';
	 
	 $.ajax({
         type:'POST',	
         url:'updateReply',
         data:param,
         dataType:'JSON',
         success:function(data){
        	 if(data.success>0){
        		 $("#replyRewClear"+Ridx).empty();
        		 $("#replyRewClear"+Ridx).replaceWith(content)
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



function recoRew(cfIdx, replyIdx, recoIdx, rcCom){
	//console.log(cfIdx, replyIdx, recoIdx, rcCom);
	
	var content = "";
	var addRecoArea = "#recommentArea"+replyIdx;

    content += '<tr id="recoRewClear'+replyIdx+'">';
    content += '<td>회원 이름</td>';
    content += '<td><textarea id="updateCom'+recoIdx+'" placeholder="답글을 입력하세요" style="width: 100%; height: 100px" cols="30" rows="10">'+rcCom+'</textarea></td>';
    content += '<td><input type="button" id="" value="수정하기" onclick="updateRecom(\''+cfIdx+'\',\'' +replyIdx+'\',\'' +recoIdx+'\',\'' +rcCom+'\')"/><input type="button" id="" value="취소" onclick="cancelCoRew(\'' + recoIdx +'\',\'' +cfIdx + '\',\''+replyIdx+'\')"/></td>';
    content += '</tr>';
    
    $("#recommentArea"+replyIdx).replaceWith(content);
}


function cancelCoRew(recoIdx, cfIdx, replyIdx){
	
	var content = "";
	
	console.log(replyIdx);
	
	content += '<tbody id="recommentArea'+replyIdx+'">';
	content += '</tbody>';
	
	$("#recoRewClear"+replyIdx).empty();
	$("#recoRewClear"+replyIdx).replaceWith(content)
	
	$("#commentCall"+replyIdx).html('답글 더 보기');
   
    $("#commentCall"+replyIdx).attr("onclick","recoCall("+replyIdx+");");
	replyList(cfIdx);
}



function updateRecom(cfIdx, replyIdx, recoIdx, rcCom){
	
	var $newContent = $("#updateCom"+recoIdx).val(); 
	
	var content = "";
	
	var param = {};
	param.newcontent = $newContent;
	param.recoIdx = recoIdx;
	param.rcCom = rcCom;
	
	content += '<tbody id="recommentArea'+recoIdx+'">';
	content += '</tbody>';
	
	$.ajax({
        type:'POST',	
        url:'updateRecom',
        data:param,
        dataType:'JSON',
        success:function(data){
       	 if(data.success>0){
       		$("#recoRewClear"+recoIdx).empty();
       		$("#recoRewClear"+recoIdx).replaceWith(content)
       		replyList(cfIdx);
       	 }
        },
        error:function(e){
           
        }
     });    
	
	
}



function recoDel(Cidx, cafeidx, Ridx){
	
	var recoDelCon = confirm("정말로 삭제하시겠습니까?");
	
	var content = "";
	
	var param = {};
	
	param.Cidx = Cidx;
	param.Ridx = Ridx;
	
	if(recoDelCon){
			
		$.ajax({
	         type:'POST',	
	         url:'recoDel',
	         data:param,
	         dataType:'JSON',
	         success:function(data){
	        	 if(data.success>0){
	        		console.log("삭제 되었습니다.");
	        		$("#recommentArea"+Ridx).empty();
	        		//$("#receDelClear"+Ridx).replaceWith(content);
	        		replyList(cafeidx);
	        	 }
	         },
	         error:function(e){
	            
	         }
	    });    
	}	
}

//=========================================================================================
//=========================================================================================
// 좋아요 할 파트

$("#likeChk").click(function(){
	
	var path = $("#likeChk").attr("src");
	var color = "./resources/images/likecolor.png";
	
	console.log("path의 값 : "+path);
	console.log("color의 값 : "+color);
	
	if(path == color){
		$("#likeChk").attr("src","./resources/images/like.png");
	}else{
		$("#likeChk").attr("src","./resources/images/likecolor.png");
	}
	
	
});






</script>

</html>