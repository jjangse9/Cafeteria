<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>구내식당 정보</title>
        <!--부트 스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        
        <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>

        <!--카카오-->
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
            height: 300px;
            background-color: yellowgreen;
            width: 100%;
            text-align: center;
            font-size: xx-small;
        }

        #map {
            width: 100%;
            height: 100%;
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

        

        #infoArea {
            height: auto;
            width: 100%;
        }

        tbody {
            width: 100%;
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
        #search-navi{
            width: 100%;
            height: 100px;
            /* background-color: rgb(228, 206, 6); */
        }
        </style>
        
    <body>
        <!-- 네비 -->
        <section id="search-navi">
            <div>
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



        </section>
        
        <section style="width: 100%; height: auto;" class="container">
            <div style="width: 100%; height: 80px;"></div>
            <div style="width: 100%; height: auto;">
                <div style="width: 100%; display: flex;">
                    <div>
                        <b><h2>구내식당 상세 페이지</h2></b>
                    </div> 
                </div>
                <div style="width: 100%; height: 3px;"></div>
                <div style="width: 100%; height: 3px; background-color: rgb(138, 138, 138); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
                <div style="width: 100%; height: 70px;"></div>

                <div style="display: flex;">
                    <div style="width: 3%;"></div>
                    <div style="width: 94%;">
                        <div style="width: 100%; display: flex;">
<!--식당명-->
                            <div style="width: 40%;">
                                <b><h3>식당명</h3></b>
                            </div>
<!--별점 조회순 좋아요-->  
                            <div style="width: 60%; margin: 9px; text-align: right;"> 
                                <b>조회수 : ${cafe.cafe_hit} </b>
                                <b> 좋아요 : ${cafe.cafe_likecnt} </b>
                                <b id="rateAvg"> 별점 : </b>
                            </div>
                        </div>
                        <div style="width: 100%; height: 3px;"></div>
                        <div style="width: 100%; height: 3px; background-color: rgb(7, 7, 7); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
<!--고객명 날짜 수정 삭제-->
                        <div style="display: flex;">
                            <div style="width: 2%;"></div>
                            <div style="width: 10%;">
                                <a>고객명</a>
                            </div>
                            <div style="width: 50%;">
                                <a>날짜</a>
                            </div>
                            <div style="text-align: right; width: 36%;">
                                <a href="#">수정</a> <a>/</a> <a href="#">삭제</a>
                            </div>
                            <div style="width: 2%;"></div>
                        </div>
                        <div style="width: 100%; height: 50px;"></div>
                    </div>
                    <div style="width: 3%;"></div>
                </div>
<!--내용-->
                <div style="display: flex; width: 100%; height: auto;">
                    <div style="width: 5%; height: auto;"></div>
                    <div style="width: 90%; height: auto;">
<!-- 이미지 -->
                        <div style="display: flex; width: 100%; height: auto; justify-content: center;align-items: center;">
                            <div style="width: 266.4px; height: 266.4px; background-color: aquamarine;"></div>
                            <div style="width: 5%; height: auto;"></div>
                            <div style="width: 266.4px; height: 266.4px; background-color: aquamarine;"></div>
                            <div style="width: 5%; height: auto;"></div>
                            <div style="width: 266.4px; height: 266.4px; background-color: aquamarine;"></div>
                        </div>
                        <div style="width: 100%; height: 50px;"></div>
<!-- 식단표 -->
                        <div style="display: flex; justify-content: center; align-items: center;">
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
                        </div>
                        <div style="width: 100%; height: 50px;"></div>

                        <div style="width: 100%; display: flex;">
<!-- 업체명 -->
                            <div style="width: 43%; height: auto;">
                                <table id="infoArea">
                                    <tr>
                                        <th style="width: 100px; height: 60px; text-align: center;">업체명</th>
                                        <td style="padding: 0px 0px 0px 10px;">${cafe.cafe_title}</td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px; height: 60px; text-align: center;">지역</th>
                                        <td style="padding: 0px 0px 0px 10px;">${cafe.bmem_area_name}</td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px; height: 100px; text-align: center;">상세주소</th>
                                        <td style="padding: 0px 0px 0px 10px;">${cafe.bmem_address}, ${cafe.bmem_address_detail}</td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px; height: 60px; text-align: center;">영업시간</th>
                                        <td style="padding: 0px 0px 0px 10px;">${cafe.bmem_btime}</td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px; height: 60px; text-align: center;">가격</th>
                                        <td style="padding: 0px 0px 0px 10px;">${cafe.cafe_diet_price}원</td>
                                    </tr>
                                    <tr>
                                        <th style="width: 100px; height: 60px; text-align: center;">연락처</th>
                                        <td style="padding: 0px 0px 0px 10px;">${cafe.bmem_tel_no}</td>
                                    </tr>
                                </table>
                            </div>

                            <div style="width: 4%; height: auto;"></div>
<!-- 지도 -->
                            <div style="width: 53%; height: 400px; background-color: rebeccapurple;">
                                <div id="map"></div>
                            </div>
                        </div>
<!-- 업주 코멘트 -->
                        <div style="width: 100%; height: auto;">
                            <textarea style="width: 100%; height: 100%; border: none; resize: none;" name="comment" id="com" cols="30" rows="10" readonly> 
                                ${cafe.bmem_remark}
                            </textarea>
                        </div>
                        <div style="width: 100%; height: 100px; background-color: royalblue;"></div>
<!-- 따봉 -->
                        <div style="width: 100%; height: auto;">
                            <div id="likeArea">
                                <span> 
                                </span>
                            </div>
                            <br />
                            <div id="likeCnt">
                                <span style="color: #ed3f27;"><b>${cafe.cafe_likecnt}</b></span>
                            </div>
                        </div>
                        <div style="width: 100%; height: 50px; background-color: royalblue;"></div>
                    </div>
                
                    <div style="width: 5%; height: auto;"></div>
                </div>
                
                <div style="width: 100%; height: 50px;"></div>
            </div>
        </section>

        <section style="width: 100%; height: auto;" class="container">

            <div style="width: 100%; height: auto;">
<!-- 댓글 -->
                <div>
                    <div style="width: 100%; height: auto;">
                        <div style="display: flex;">
                            <div style="width: 2%;"></div>
                            <div style="width: 10%; display: flex;">
                                <h3>댓글</h3><h3>()</h3>
                            </div>
                            <div style="width: 50%; margin: 9px;">
                                <a href="#" style="margin-right: 10px;">최신순</a>
                                <a>|</a>
                                <a href="#" style="margin-left: 10px;">좋아요순</a>
                            </div>
                            <div style="margin: 9px; text-align: right; width: 36%;">
                                <a style="margin-right: 20px;" href="#">공유하기</a><a href="#">아이콘</a>
                            </div>
                            <div style="width: 2%;"></div>
                        </div>
                        <div style="width: 100%; height: 3px;"></div>
                        <div style="width: 100%; height: 3px; background-color: rgb(7, 7, 7); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
                        <div style="width: 100%; height: 20px;"></div>
                    </div>
                </div>

                <div style="width: 100%; height: auto;">
                    <table style="width: 100%; height: auto;" id="replyArea">
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
                                <div class="startRadio starOrigin">
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
                                </div> <input type="button" id="callImgBox" value="이미지 첨부 하기"/>
                                <div id="div1" style="border: solid;width:100%; height:140px; display: none;"></div>
                                <textarea id="recon" placeholder="댓글을 입력하세요"
                                    style="width: 100%; height: 150px" onclick="replyLoginChk()"></textarea>
                            </td>
                            <td><input type="button" id="addReply" value="입력"
                                onclick="addReply(${cafe.cafe_idx});" /></td>
                            <td hidden=""><input id="replyList" value="${cafe.cafe_idx}" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>

    </body>

<script>

$(document).ready(function addImageBox(){

    $("#div1").load("./testImage");

});


var loginId = "${sessionScope.loginId}";

var boardLike = {};
var loginChk = {};
var userInfo = {};

idChk(loginId);

function idChk(loginId){
	
	//console.log("유저 세션 정보"+loginId);
	
	var param = {};
	param.idChk = loginId;
	
	
	
	if(loginId != null && loginId != ""){
		
		$.ajax({
	        type:'POST',
	        url:'idChk',
	        async:false,
	        data:param,
	        dataType:'JSON',
	        success:function(data){ // data == idChkinfo -> idChk 라는 키가 있고 idChk의 val이 존재
	        	console.log("idChk 정보 : "+data.idChk.mem_grade);
	        	
	        if(data.idChk.mem_grade ==1 ){
	        	
		       	loginChk = data.idChk;    
		       	console.log("일반 회원의 정보"+loginChk.mem_id);
		       	likeView(loginChk);
		       	
	        }else if(data.idChk.mem_grade == 2){
	       		
	       		$.ajax({
	       	        type:'POST',
	       	        url:'bmemchk',
	       	        async:false,
	       	        data:param,
	       	        dataType:'JSON',
	       	        success:function(data){
	       	        	loginChk = data.idChk;
	       	        	console.log("업주 회원의 정보"+loginChk);
	       	        	likeView(loginChk);
		       	     },
		             error:function(e){
		                console.log("에러 발생   "+e);
		             }
		          });    
	       	}
	        },
	        error:function(e){
	           console.log("에러 발생   "+e);
	        }
	     });      
	}else{
		var content = '<img id="likeChk" src="./resources/images/like.png" width="100px" height="100px" style="cursor: pointer;" />'
    		$("#likeArea span").append(content);
       	}
}



function likeView(loginChk){
	
	$("#likeArea span").empty();
	
	var param = {};
	param.userId = loginChk.mem_id;
	param.cafeIdx = $('#replyList').val();
	
	
	$.ajax({
        type:'POST',
        url:'likeView',
	    async:false,
        data : param,
        dataType:'JSON',
        success:function(data){
        	
        	boardLike = data;
        	console.log(boardLike);
        	//console.log(data[0].boardlike_chk);
        	if(data.length == 0 ){
        		var content = '<img id="likeChk" src="./resources/images/like.png" width="100px" height="100px" style="cursor: pointer;" />'
            		$("#likeArea span").append(content);
        	}else if(data[0].boardlike_chk == 1){
        		var content = '<img id="likeChk" src="./resources/images/like.png" width="100px" height="100px" style="cursor: pointer;" />'
            		$("#likeArea span").append(content);
        	}else{
        		var content = '<img id="likeChk" src="./resources/images/likecolor.png" width="100px" height="100px" style="cursor: pointer;" />'
            		$("#likeArea span").append(content);
        	}
       	
        },
        error:function(e){
           console.log("에러 발생   "+e);
        }
     });      
	
}






var replyListNo = $('#replyList').val();

var limit = 0;

replyList(replyListNo);

function replyList(idx){
	
	
	//console.log(idx);
	
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
	   var imgChk = {};
	   
	   //console.log(data);
	   $.ajax({
	        type:'POST',
	        url:'imgChk',
	        async:false,
	        data:{},
	        dataType:'JSON',
	        success:function(data){
	         imgChk = data;
	        },
	        error:function(e){
	           console.log("에러 발생   "+e);
	        }
	     });      
	   //console.log(data);
	   
	
	
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
			
			//console.log(data[i].cafereply_stat);
			
			 var replyStat = eval(data[i].cafereply_stat);
			 
			 //console.log(replyStat);
	         
	         if(replyStat == 1 || replyStat == '1'){
			
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
				content += "<span id=callImgList"+data[i].cafereply_idx+"><span>";
				content += "<br/>";
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
				 var onCheckedRadio = $(".replyStar"+data[i].cafereply_idx).find('input[name=star'+data[i].cafereply_idx+']');
		            //console.log(data[i].cafereply_ratestar);
		            //console.log(onCheckedRadio);
		            for(var j = 0 ; j < data[i].cafereply_ratestar ; j++){
		               //console.log(onCheckedRadio[j]);
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
	
	
	for(var i = 0; i<imgChk.length; i++){
		
		
		var contentImg = "";
		
		
		var area = "#callImgList"+imgChk[i].cafereply_idx;
		
		//console.log(area);
		
		contentImg += "<img alt='' src='"+imgChk[i].replyphoto_path+imgChk[i].replyphoto_newname+"' style='width: 150px; height: 150px;'/>"	
		
		//console.log(contentImg);
		
		$(area).prepend(contentImg);
		
	}
	
	
	
			//console.log(rateAvg);
			var Avg = 0;
			
			for(var i = 0; i<rateAvg.length; i++){
				Avg += rateAvg[i]
			}
			
			var starAvg = ((Avg/2)/rateAvg.length);
			
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
      //console.log("대댓 정보 요청중");


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
	
	//console.log(content);
   
   $(commentCall).html('답글 더 보기');
   
   $(commentCall).attr("onclick","recoCall("+idx+");");
   

};



function addReply(idx){
	
	//* param에 저장해서 보내줄 값
	//번호는 DB에서 자동 입력
	//댓글 등록 시간.
	//댓글 수정 시간은 수정폼에서
	//*2.	댓글 내용 ok
	//댓글 좋아요는 댓글 보기에서
	//*3.	별점 ok
	//기본 댓글 상태는 null
	//수정 여부를 표시하는 것도 수정 폼에서
	//대댓수는 대댓글이 달릴 때 업데이트
	//*4.	게시글의 번호 (댓글이 귀속될 게시글의 번호) 
	//*5.	유저ID 
	
	var recon = $("#recon").val();
	var idx = idx;
	var star_rate = $(".starOrigin input[type=radio]:checked").val();     
	var userId = loginChk.mem_id;
	
	
	if(recon == ""){
		
  	  alert("댓글을 입력해 주세요.");
  	  
    }else if($("#recon").val() != ""){     
                                                     
		  var imgEx = $("span .addImg").length;
	      var param = {};
	      param.recon = recon;
	      param.idx = idx;
	      param.rate = star_rate;
	      param.userId = userId;

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
		               
		               if(data.cafeReplyIdx>0){
							console.log("1차 실행");   
		                   if(imgEx > 0){
		                	   console.log("1-1차 실행");
		                	  dataSubmit(data.cafeReplyIdx, idx)
		   		       	  }else{
		   		       		console.log("1-2차 실행");
							  $("#recon").val('');
		                  	  $(".starOrigin input[type=radio]").prop('checked', false);
		                  	location.reload();

		   		       	  }	
		                   
		               }
		            },
		            error:function(e){
		               
		            }
		         });    
		       
			   				   	
		       
		       
		       
		       
	      }
	   }
	

	
	
	
};


function replyLoginChk(){
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}
	
}



$("#callImgBox").click(function(){
	

	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}else{
		
		if($("#callImgBox").val() == "이미지 첨부 하기"){
			
			$("#div1").css("display","block");
			
			$("#callImgBox").val("이미지 첨부 취소");
			
		}else if($("#callImgBox").val() == "이미지 첨부 취소"){
			
			$("span .addImg").remove();
			
			$("#div1").css("display","none");
			
			$("#callImgBox").val("이미지 첨부 하기");
			
			addImageBox();
			
		}
	}
	
	
})








function recoBoxCall(Cidx, Ridx){
	
	var content = "";
	var addRecoArea = "#addRecoArea"+Ridx;
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}else{
	
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
		        	 //console.log(data.success);
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
	
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}else{
		
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
	}
	
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
        		 location.reload();

        	 }
         },
         error:function(e){
            
         }
      });    

	
}




	
function replyDel(idx, cafeidx){
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}else{
		
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
		        		location.reload();

		        	 }
		         },
		         error:function(e){
		            
		         }
		      });    
		}
		
	}
};



function recoRew(cfIdx, replyIdx, recoIdx, rcCom){
	//console.log(cfIdx, replyIdx, recoIdx, rcCom);
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}else{
		
		
		var content = "";
		var addRecoArea = "#recommentArea"+replyIdx;
	
	    content += '<tr id="recoRewClear'+replyIdx+'">';
	    content += '<td>회원 이름</td>';
	    content += '<td><textarea id="updateCom'+recoIdx+'" placeholder="답글을 입력하세요" style="width: 100%; height: 100px" cols="30" rows="10">'+rcCom+'</textarea></td>';
	    content += '<td><input type="button" id="" value="수정하기" onclick="updateRecom(\''+cfIdx+'\',\'' +replyIdx+'\',\'' +recoIdx+'\',\'' +rcCom+'\')"/><input type="button" id="" value="취소" onclick="cancelCoRew(\'' + recoIdx +'\',\'' +cfIdx + '\',\''+replyIdx+'\')"/></td>';
	    content += '</tr>';
	    
	    $("#recommentArea"+replyIdx).replaceWith(content);
		
	}
	
}


function cancelCoRew(recoIdx, cfIdx, replyIdx){
	
	var content = "";
	
	//console.log(replyIdx);
	
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
       		location.reload();

       	 }
        },
        error:function(e){
           
        }
     });    
	
	
}



function recoDel(Cidx, cafeidx, Ridx){
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");
		$("#recon").attr("readonly", true);
		if(yn){
			location.href="/";
		}
	}else{
		
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
		        		location.reload();

		        	 }
		         },
		         error:function(e){
		            
		         }
		    });    
		}	
		
	}
	
}

//=========================================================================================
//=========================================================================================
// 좋아요 할 파트

$("#likeChk").click(function(){
	
	var path = $("#likeChk").attr("src");
	var color = "./resources/images/likecolor.png";
	
	if(loginId == ""){
		var yn = confirm("로그인 이후 이용 가능한 서비스입니다.");

		if(yn){
			location.href="/";
		}
		
	}else{
		var boardLikes = {};
		boardLikes = boardLike[0];
		console.log(boardLikes);
		//console.log(boardLikes.boardLike_chk);
		
		
		if(boardLike.length == 0){
			
			var param = {};
			
			console.log("좋아요 3번 케이스");
			//console.log("좋아요 클릭 3번 이벤트에서 : "+loginChk.mem_id);
			//console.log("좋아요 클릭 3번 이벤트에서 : "+$('#replyList').val());
			
			param.userId = loginChk.mem_id;
			param.cafeIdx = $('#replyList').val();
			
			$.ajax({
		         type:'POST',	
		         url:'addLike',
		         data : param,
		         dataType:'JSON',
		         success:function(data){
		        	 location.reload();
		         },
		         error:function(e){
		            
		         }
		    });
			
		}else if(boardLike[0].boardlike_chk  == 1){
			
			console.log("좋아요 1번 케이스");
			
			$.ajax({
		         type:'POST',	
		         url:'upLike',
		         data : boardLikes,
		         dataType:'JSON',
		         success:function(data){
		        	 console.log("성공");
		        	 location.reload();

		         },
		         error:function(e){
		            
		         }
		    });    
			
		}else if(boardLike[0].boardlike_chk == 2){
			
			console.log("좋아요 2번 케이스");
			
			$.ajax({
		         type:'POST',	
		         url:'downLike',
		         data : boardLikes,
		         dataType:'JSON',
		         success:function(data){
		        	 console.log("성공");
		        	 location.reload();

		         },
		         error:function(e){
		            
		         }
		    });
			
		}
			
	}
	
});






</script>

</html>