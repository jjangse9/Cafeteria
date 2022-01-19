<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="container" style="overflow: hidden; position: relative;">
			<br> <a class="blameList" href="./blameList?mem_id=${loginId}">
				<b style="font-size: 30px;">신고게시판</b>
				<hr/>
			</a>
		</div>
		
		<div class="container">
			<form class="blameWrite" method="post">
				<div id="declareTitle">제목</div>
				<input type="text" class="blameWrite" placeholder="제목" name="blame_title" value="" required>
				<br/>
				<div id="declareContain">내용</div>
				<!-- name값과 메서드의 매개변수가 이름이 같으면 알아서 넣어줌 -->
				<textarea class="blameWrite" rows="20" placeholder="신고내용" name="blame_content" value="" required></textarea>
				<hr/>
				<input type="submit" value="저장" />
				<a href="./blameList?mem_id=${loginId}">취소 </a>
			
			</form>
		</div>
		
		

</body>
</html>