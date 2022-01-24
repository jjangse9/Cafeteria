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
            }
            
             .note-editable{
            	height: 500px;
            	width: 100%;
            }
	</style>
</head>
<body>
	<div class="frame">
            <H1>수정페이지</H1>
            <form action="noticeUpdate" method="post">
                <table style="width: 1200px; height: 800px;">
                    <tr>
                        <th style="height: 10%;">제목</th>
                        <td><input type="text" name="notice_title" value="${noticeInfo.notice_title}" ></td>
                    </tr>
                    
                    <tr>
                        <th style="height: 10%;">작성자</th>
                        <td>
                        	<input type="text" name="mem_id">
                        	<input type="text" name="notice_idx" value="${noticeInfo.notice_idx}" style="display: none;"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="height: 50%;">내용</th>
                        <td>
                        	<textarea name="notice_content" id="content" style="height: 100%; width: 100%;" >
                        		${noticeInfo.notice_content}
                        	</textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <th colspan="2" style="height: 10%;">
                            <input type="button" onclick="location.href='./noticeList'" value="리스트">
                            <input type="submit" value="저장">
                        </th>
                    </tr>
                </table>
            </form>
      </div>
</body>
<script>
	$(document).ready(function() { $("#content").summernote(); }) 
</script>
</html>