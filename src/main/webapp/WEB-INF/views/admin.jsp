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
		margin: 10%;
		}
	   
       .adnavi{
       		
            }
            ul, li{
                list-style: none;
            }

            .adnavi{
                float: left;

                width: 100%;

                height: 700px;
            }
            .boardFrame{
                float: right;
                width: 1300px;
                margin-right: 15%;

            }

			table{
			width: 800px;
			}

            table, tr, td, th{
                border: solid black 1px;
                border-collapse: collapse;
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

         /*??????*/
.background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100vh;
      background-color: rgba(0, 0, 0, 0.3);
      z-index: 1000;
  
       /* ????????? */
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
  
     /* ?????? ?????? */
      width: 800px;
      height: 600px;
  
             /* ????????? ?????? ????????? ?????? */
           
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
</head>
<body>
      <h1>??????????????????</h1>
        <hr>
    <div class="adnavi">
		<br>
		<div class="row">
		  <div class="col-2" style="height:600px; background-color:purple;">
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" 
		      href="#list-home" role="tab" aria-controls="home">?????? ?????? ??????</a>
		      
		      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" 
		      href="#list-profile" role="tab" aria-controls="profile">?????? ??????</a>
		      
		      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" 
		      href="#list-messages" role="tab" aria-controls="messages">??? ??????</a>
		      
		      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
		      href="#list-settings" role="tab" aria-controls="settings">??????/?????? ??????</a>
		    
		     <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
		      href="#list-noticeWrite" role="tab" aria-controls="noticeWrite">?????? ?????????</a>
		    
		     <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" 
		      href="#list-boardWrite" role="tab" aria-controls="boardWrite">???????????? ?????????</a>
		    
		    
		    </div>
		  </div>
		  <div class="col-10" style="width:100%; height:auto;">
		    <div class="tab-content" id="nav-tabContent">
		      
		      <!-- ?????? ?????? ?????? -->
		      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
						<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">?????? ?????????</th>
						      <th scope="col">?????????</th>
						      <th scope="col">????????????</th>
						      <th scope="col">?????? ????????????</th>
						      <th scope="col">????????????</th>
						      <th scope="col">??????</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${memResult}" var="admin">
						  
							    <tr>
							      <th scope="row">${admin.mem_id }</th>
							      <td>${admin.mem_nick }</td>
							      <td>${admin.mem_grade }</td>
							      <td>
								      	<input type="button" class="checkinfo" value="??????/??????" >
							      	
							      </td>
							      
							      <c:if test="${admin.mem_bcode ne null }">
							      <td id="bcode">${admin.mem_bcode }</td>
							      
							      	</c:if>
							      	<c:if test="${admin.mem_bcode eq null }">
							      	<td id="bcode"></td>
							      	</c:if>
							      <td><input class="agreeBtn" type="button" value="??????"></td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>

		      </div>
		      <!-- ?????? ?????? -->
		      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
					<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">?????? ?????????</th>
						      <th scope="col">?????????</th>
						      <th scope="col">????????????</th>
						      <th scope="col">?????? ????????????</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${memResult}" var="admin">
						  
							    <tr>
							      <th scope="row">${admin.mem_id }</th>
							      <td>${admin.mem_nick }</td>
							      <td>${admin.mem_grade }</td>
							      <td style="width:15%"></td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>
					
					
			 	</div>
			 	
			 	<!-- ??? ?????? -->
		      <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
					<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">?????????(??????)</th>
						      <th scope="col">?????????</th>
						      <th scope="col">??????</th>
						      <th scope="col">??????</th>
						      <th scope="col">????????? ?????????</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${cafeResult}" var="cafe">
						  
							    <tr>
							      <th scope="row">${cafe.cafe_title }</th>
							      <td>${cafe.cafe_content }</td>
							      <td>${cafe.cafe_ratestaravg }</td>
							      <td>${cafe.cafe_diet_price }</td>
							      <td>${cafe.mem_id }</td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>
				</div>
				
				<!-- ??????/?????? ?????? -->
		      <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-qst-list">
					<table class="table" style="text-align:center;">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">?????????(??????)</th>
						      <th scope="col">?????????</th>
						      <th scope="col">????????????</th>
						      <th scope="col">????????? ?????????</th>
						    </tr>
						 	</thead>
						  
							<tbody>
						 <c:forEach items="${qstResult}" var="qst">
						  
							    <tr>
							      <th scope="row">${qst.qst_title }</th>
							      <td><a href="qstDetail?qst_idx=${qst.qst_idx}">${qst.qst_content}</a></td>					
							      <td>${qst.qst_posttime }</td>
							      <td>${qst.mem_id }</td>
							    </tr>
						  
						  </c:forEach>
							</tbody>
						</table>
				</div>
				
				<!-- ?????? ????????? -->
				<div class="tab-pane fade" id="list-noticeWrite" role="tabpanel" aria-labelledby="list-messages-list">
	
        <section style="width: 100%; height: auto;" class="container">
            <div style="width: 100%; height: auto;">
                <div><h2>???????????? ????????????</h2></div>
                <div style="width: 100%; height: 3px;"></div>
                <div style="width: 100%; height: 3px; background-color: rgb(138, 138, 138); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
                <div style="width: 100%; height: 70px;"></div>

                <div style="display: flex;">
                    <div style="width: 3%;"></div>
                    <div style="width: 94%;">
                        <div style="width: 100%; display: flex;">
<!--?????????-->
                            <div style="width: 40%;">
                                
                            </div>
<!--??????-->  
                            <div style="width: 60%; text-align: right;"> 
                                <input type="button" class="btn btn-dark" onclick="location.href='./noticeList'" value="??????">
                            </div>
                        </div>
                        <div style="width: 100%; height: 3px;"></div>
                        <div style="width: 100%; height: 3px; background-color: rgb(7, 7, 7); border: 1px solid transparent; border-radius: 20px 20px 20px 20px;"></div>
<!--????????? ?????? ?????? ??????-->
                        <div style="display: flex;">
                            <div style="width: 2%;"></div>
                            <div style="width: 10%;">
                                <a name="mem_id">?????????</a>
                                <input name="notice_idx" value="${noticeInfo.notice_idx}" style="display: none;"/>
                            </div>
                            <div style="width: 50%;">
                                <a>??????</a>
                            </div>
                            <div style="text-align: right; width: 36%;">
                                
                            </div>
                            <div style="width: 2%;"></div>
                        </div>
                        <div style="width: 100%; height: 30px;"></div>
                    </div>
                    <div style="width: 3%;"></div>
                </div>


                <div style="display: flex; width: 100%; height: auto;">
                    <div style="width: 5%; height: auto;"></div>
                    <div style="width: 90%; height: auto;">
                        <form action="noticeWrite" method="post">
<!--??????-->                            
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <a>??????</a> </span>
                                </div>
                                
                                <div class="form-control" style="height: auto;">
                                    <input name="notice_title" class="form-control" type="text" value="" placeholder="????????? ??????????????????"/>
                                </div>
                            </div>
                            

<!--??????-->
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <a>??????</a> </span>
                                </div>
                                <div class="form-control" style="height: auto;">
                                    <textarea type="text" style="height: 190px;" class="form-control" placeholder="????????? ??????????????????" id="comment" name="comment" cols="45" rows="8" required=""></textarea>
                                </div>
                            </div>
                            <div style="width: 100%; height: 15px;"></div>
                        
                        
                            <!-- ?????? ??????-->
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block"> ??????  </button>
                            </div>

                                                                            
                        </form>     
                    </div>
                    <div style="width: 5%; height: auto;"></div>
                </div>
                <div style="width: 100%; height: 60px;"></div>
                

            </div>
            <div style="width: 100%; height: 100px;"></div>
        </section>
        
        </div>
        
        
        
        
        
        
        
        <!-- ???????????? ????????? -->
        <div class="tab-pane fade" id="list-boardWrite" role="tabpanel" aria-labelledby="list-messages-list">
			 <h1>(??????)???????????????</h1>
       <h2>
             <c:choose>
            <c:when test="${cafe.cafe_title != '' || cafe.cafe_title != null}">
               <input type="text" name="cafe_title" id="Fixed_cafe_title" value="${cafe.cafe_title}" readonly="readonly">
            </c:when>
                <c:otherwise>
                   <input type="text" name="cafe_title" id="Fixed_cafe_title" value="?????? ????????? ??????????????????" readonly="readonly">
                </c:otherwise>
         </c:choose>
       </h2> 
       <b>????????? : 
       ${cafe.cafe_hit}
       </b> 
       <b> ?????? :
       ${cafe.cafe_likecnt}
       </b> 
       <b> ?????? :
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
            <td>??????/??????</td>
            <td>?????????</td>
            <td>?????????</td>
            <td>?????????</td>
            <td>?????????</td>
            <td>?????????</td>
            <td>?????????</td>
            <td>?????????</td>
         </tr>
         <tr>
            <td>??????</td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 01}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
         </tr>
         <tr>
            <td>??????</td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 02}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
         </tr>
         <tr>
            <td>??????</td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>
            <td>
               <c:forEach items="${diet_detail}" var="dt">                  
                  <c:if test="${dt.diet_date_name eq '?????????' && dt.diet_code == 03}">
                     <c:if test="${dt.diet_menu eq null}"><span>?????? ?????????.</span></c:if>
                     <span>${dt.diet_menu}</span><br/>
                  </c:if>
               </c:forEach>
            </td>   
         </tr>
         
      </table>
   </div>
   
        <input type="button" id="show" onclick="fn_getThisWeek('0',this)" value="?????? ????????????">
       <br>
       <br>
        
       <div class="info_frame">
         
          <table id="infotable">
             <tr>
                 <th>?????????</th>
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
                 <th>?????? ?????????</th>
                 <td><input type="text" id="mem_id" name="mem_id" value="" placeholder="???????????? ???????????????"></td>
              </tr>
              <tr>
                 <th>?????? ??????</th>
                 <td><input type="text" id="mem_bcode" name="mem_bcode" value="" placeholder="?????? ????????? ???????????????"></td>
              </tr>
              <tr>
                  <th>??????</th>
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
                  <th>????????????</th>
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
                 <th>????????????</th>
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
                 <th>??????</th>
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
                 <th>?????????</th>
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
                 ????????? ???????????????
              </c:otherwise>
           </c:choose>
    </textarea>
    <br>
    <input type="button" id="show" onclick="submitList()" value="????????????">
    
</form>
   </div><!-- frame ??? -->

<!--  modal-diet form --><!-- ???????????? ????????? ?????????. -->
            <div class="background">
                <div class="window">
                    <div class="popup" style="overflow:scroll; width:1270px; height:730px;">
                       <br>
                        <div id="diet_table">
                        &nbsp;
                              <input type="button" id="show" onclick="prevconfirm();" value="?????? ?????? ">
                              
                          <input type="button" id="show" onclick="nextconfirm();" value="????????? ??????">
                        <br><hr>
                            <table style="width: 1250px ; height: 600px; cellpadding:5px" id="dietform" >
                               <tbody id="dietBody">
                                   <tr id="diet_date">
                                   </tr>
                                   <tr style="height:33%" id="diet_morning">
                                       <th>??????</th>
                                   </tr>
                                   <tr style="height:33%" id="diet_lunch">
                                       <th>??????</th>                                  
                                   </tr>
                                   <tr style="height:33%" id="diet_dinner">
                                       <th>??????</th>                               
                                   </tr>
                                </tbody>
                            </table>
                            <hr>
                            <button id="close">????????????</button>
                            <input type="button" name="submit" id="diet_submit" onclick="dietSubmit(this)" value="??????" >
                       </div><!-- diet_table -->
                    </div><!-- popup -->
                </div><!-- window -->
            </div><!-- background -->
		</div>

<!-- 
    <script>
        
        $(document).ready(function() { $("#content").summernote(); }) ;

        /* $('#summernote').summernote('fullscreen.toggle'); */

	

    </script> -->
</html>
					
			
      
</body>
</html>
<script>
	// ??????????????? ?????? ???????????? ?????? ?????? ??????
	var bcodeList = [];
	
// db ???????????? ???????????? ?????? ?????? ?????? ?????? ????????? ???????????? ???????????????


	function rand(min, max) {
		  return Math.floor(Math.random() * (max - min)) + min;
	}

// ???????????? ????????? ??????????????? ???????????? ????????? ???????????? ??????( 5?????? ?????? )
	$('.checkinfo').click(function(){
		console.log(this);
		console.log($(this).parent().next().html());
				
		if($(this).parent().next().html() == ''){
			// 5?????? ?????? ??????
			var bcode = rand(9999, 100000);

			
			// ????????? ?????? ?????? 10????????? ??????
			for(var i=0; i<10; i++){
				// ???????????? ????????? ?????? ????????? ????????? ?????????
				if(bcodeList.includes(bcode)){
					bcode = rand(9999, 100000);
				}
			}	
				$(this).parent().next().html(bcode);
		
		}else{
			$(this).parent().next().html('');
		}
		
		console.log(bcode);
		
		
	});
	
	$('.agreeBtn').click(function(){
		//console.log($(this).parent().prev().prev().prev().prev().prev().html());
		
		var id = $(this).parent().prev().prev().prev().prev().prev().html();
		var bcode = $(this).parent().prev().html();
		
		console.log(id);
		console.log(bcode);
		
		
		// ???????????? ??? ?????? ??????
	  		$.ajax({
	        type:'POST',
	        url:'bcodeEdit',
	        data:{'mem_id':id,'bcode':bcode},
	        dateType:'JSON', //hashmap ?????? ???????????? ????????? ??? ?????????
	        success:function(data){
	        	alert('????????? ?????? ????????????.');
	        	
	        	document.location.reload();
	        
	        },
	        error:function(e){
	        
	        	console.log(e);
	        }
	        
	        
	    });
		 
	});
	
	
	





	function prevconfirm(){
	   if(confirm('???????????? ????????? ??????????????? ?????? ??? ????????? ?????????')==true){
	      fn_getThisWeek('-1',this);
	   }else{
	      return;
	   }      
	}

	function nextconfirm(){
	   if(confirm('???????????? ????????? ??????????????? ?????? ??? ????????? ?????????')==true){
	      fn_getThisWeek('+1',this);
	   }else{
	      return;
	   }      
	}


	var fileArr;
	var fileInfoArr=[];
	var stat = 0;//???????????????

	$(document).ready (function () {      
	   
	      
	}); // end ready


	//??????
	function show() {
	    document.querySelector(".background").className = "background show";
	  }

	  function close() {
	    document.querySelector(".background").className = "background";
	  }
	  document.querySelector("#show").addEventListener('click', show);
	  document.querySelector("#close").addEventListener('click', close);
	  
	  //?????? ????????????
	  function createTd(value){
	        var html = '';
	      
	      html += '<th>??????</th>';
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
	         
	         //input ??????-??????-------------------------------------------
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
	         //?????? ??????????????? ??????
	         $('#diet_morning').find('td').remove();
	         $('#diet_lunch').find('td').remove();
	         $('#diet_dinner').find('td').remove();
	         
	         //???????????? date ????????? ??????
	         var before = value;
	         
	         //diet ?????? ??????
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
	          
	          // ????????? ??????
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
	         alert('?????? ?????? ????????? 8????????? ?????????.');
	         return;
	      }else{
	           $(obj.parentNode).append (          
	                   '<input type="text" name="txt" data-value="'+(allCnt + 1)+'" class= "menuname"> <input type="button" class="btnRemove" onclick="thisRemove(this)" value="-"><br>'
	           ); // end append         
	      }
	                   
	   }

	   function thisRemove(obj){
	        $(obj).prev().remove (); // ??????????????? ??????
	        $(obj).next ().remove (); //br??????
	        $(obj).remove (); // ?????? ??????
	   }

	   
	   //?????? ?????????---------
	    function fn_getThisWeek(status,obj){
	   
	         //var stat = 0;//???????????????
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
	            alert('????????? ???????????? ????????????????????? ?????? ???????????????.');
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
	    
	    allCnt ??? ????????? ???????????? ?????? ???
	    nextCnt ??? backCnt??? ??? data-value ( diet_menu_seq ??? ???????????? map??? ???????????? ?????? ???????????? ?????? ????????? )
	    
	    */
	    function dietSubmit(obj){// ??????submit
	       
	          var rows = $('#dietBody').find("tr");// ????????? ????????? tr
	          var date = $('#dietBody').find("#diet_date").find('td');//td
	          var morning = $('#dietBody').find("#diet_morning").find('td').find('input[name="txt"]');//??????-??????
	          var lunch = $('#dietBody').find("#diet_lunch").find('td').find('input[name="txt"]');//??????-??????
	          var dinner = $('#dietBody').find("#diet_dinner").find('td').find('input[name="txt"]');//??????-??????

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
	         
	         var marr = [];//??????????????????
	         var larr = [];//??????????????????
	         var darr = [];//??????????????????
	         var allCnt = -1;
	         
	         var backCnt = 0;
	         var nextCnt = 0;
	         
	         for( var i = 0 ; i < morning.length ; i++ ){
	            
	            nextCnt = morning[i].dataset['value'];
	            
	            console.log(backCnt + ' , ' +nextCnt);
	            if(backCnt > nextCnt){
	               //console.log('backCnt ??? ?????? ????????? ?????????');
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
	            if(morningValue != '' && morningValue != 'undefined' && morningValue != null){//?????????????????? ?????? ?????? null??? ????????????...
	               marr.push( morningValue );//????????????????????? ??????  ?????????.
	            }else{
	               allCnt += 1; //null ????????? allcnt ??????
	            }
	            
	            backCnt = morning[i].dataset['value'];//backcnt??? ??????????????? ??? ??????
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
	               //console.log('backCnt ??? ?????? ????????? ?????????');
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
	         
	         var conStr = confirm("????????? ?????????????????????????");
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
	         //?????? ?????????
	         $.ajax({
	            type:'post',
	            url: 'diet_save',
	            data: strData,
	            dataType : 'JSON',
	            contentType : "application/json; charset=UTF-8",
	            async: false,
	            success:function(data){
	               alert('????????? ????????? ?????????????????????.');
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
	          
	          alert("?????? ?????? ???????????? ??????????????????");
	          nwf.mem_id.focus();
	          return false;
	          
	       }else if(bCode.value == "" || bCode.value  == null){
	          
	          alert("?????? ????????? ??????????????????");
	          nwf.mem_bcode.focus();
	          return false;
	          
	       }else{
	         newWriteForm.submit();
	       }
	       
	       
	       
	    }


	
	
</script>

















