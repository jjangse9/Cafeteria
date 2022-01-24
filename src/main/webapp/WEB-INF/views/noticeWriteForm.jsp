<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	 
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>    
	  	
	<style>
		  .frame{
                width: 100%;
                margin: 0 auto;
                max-width: 1200px;
                border: black solid 1px;
            }
            table,tr,td,th{
                border: black solid 1px;
                border-collapse:collapse ;
                table-layout: fixed;
            }
            #content,summernote{
            
            	height: 100%; 
            	width: 100%;
            	border: none;
   				 resize: none;
            } 
            
            .note-editable{
            	height: 500px;
            	width: 100%;
            }
            
	</style>
</head>
<body>
	<div class="frame">
            <H1>작성페이지</H1>
            <form name="noticeWriteForm" action="noticeWrite" method="post">
                <table style="width: 1200px; height: 800px;" >
                    <tr>
                        <th style="height: 10%; width: 20%; text-align: center;">제목</th>
                        <td><input type="text" name="notice_title"></td>
                    </tr>
                    
                    <tr>
                        <th style="height: 10%;width: 20%; text-align: center;">작성자</th>
                        <td><input type="text" name="mem_id"></td>
                    </tr>
                    <tr>
                        
                        <td colspan="2" height="50%"><!-- .note-editable은 textarea에 적용된 텍스트 에디터 크기입니다. -->
                        	
                        	<textarea name="notice_content" id="content" style="height: 500px ;">
                        		
                        </textarea>
                        	
                        
                        </td>
                    </tr>
                    
                    <tr>
                        <th colspan="2" style="height: 10%;">
                           <input type="button" onclick="location.href='./noticeList'" value="목록">
                            <input type="button" value="저장" onclick= noticeChk()>
                        </th>
                    </tr>
                </table>
            </form>
      </div>
</body>

<script>

$(document).ready(function() { $("#content").summernote(); }) ;

/* $('#summernote').summernote('fullscreen.toggle'); */

function noticeChk(){
		var note = document.noticeWriteForm;
		
		if (note.notice_title.value == "") {
	        alert("제목을 입력해주십시오");
	         note.notice_title.focus(); 
	    }else if (note.notice_content.value == "") {
	        alert("내용을 입력해주십시오");
	         note.notice_content.focus(); 
	    }else{
	    	noticeWriteForm.submit();
	    }
};
	


</script>
</html>