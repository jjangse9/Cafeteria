<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

   
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorate="~{cmmn/adminLayout}">
<body>
<div layout:fragment="content">
   <!-- <script src="https://code.jquery.com/jquery-3.5.0.min.js"></script> -->
    <script src="/js/storeDataSendAjax.js"></script>
    <script src="/js/imagePreview.js"></script>
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    <div class="row border-bottom" style="margin-top: 10px; margin-bottom: 10px;"></div>
 
    <form id="addForm" enctype="multipart/form-data" >
        <div style="display: inline;">
            <label for="img_upload">
                <img src="/img/photo_add.png" style="width:100px; height:100px; cursor: pointer;">
            </label>
            <input type="file" name="img_upload" id="img_upload"
                   onchange="previewImage(this,'View_area')"
                   style="display: none;" multiple>
 
            <span id='View_area'
                  style='position:relative; color: black; border: 0px solid black;'>
        </span>
        </div>
 
        <div style="align-content: center; width: 100%; text-align: center;">
            <input type="button" class="btn" style="background: #FF6491; color: #FFF2F6;" onclick="dataSubmit();"
                   value="전송하기">
        </div>
 
    </form>
</div>
</body>
<script>


var fileArr;
var fileInfoArr=[];

//썸네일 클릭시 삭제.
function fileRemove(index) {
    console.log("index: "+index);
    fileInfoArr.splice(index,1);
 
    var imgId="#img_id_"+index;
    $(imgId).remove();
    console.log(fileInfoArr);
}

//썸네일 미리보기.
function previewImage(targetObj, View_area) {
    var files=targetObj.files;
    fileArr=Array.prototype.slice.call(files);
    
    var preview = document.getElementById(View_area); //div id
    var ua = window.navigator.userAgent;
 
    //ie일때(IE8 이하에서만 작동)
    if (ua.indexOf("MSIE") > -1) {
        targetObj.select();
        try {
            var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
            var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
 
 
            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
 
            var img = document.getElementById(View_area); //이미지가 뿌려질 곳
 
            //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + View_area)) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + View_area;
                info.innerHTML = e.name;
                preview.insertBefore(info, null);
            }
        }
        //ie가 아닐때(크롬, 사파리, FF)
    } else {
        var files = targetObj.files;
        for ( var i = 0; i < files.length; i++) {
            var file = files[i];
            fileInfoArr.push(file);
 
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;
            // var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
            // if (prevImg) {
            //     preview.removeChild(prevImg);
            // }
 
            var span=document.createElement('span');
            span.id="img_id_" +i;
            span.classList.add("imgDel");
            span.style.width = '100px';
            span.style.height = '100px';
            preview.appendChild(span);
 
            var img = document.createElement("img");
            img.className="addImg";
            img.classList.add("obj");
            img.file = file;
            img.style.width='inherit';
            img.style.height='inherit';
            img.style.cursor='pointer';
            const idx=i;
            img.onclick=()=>fileRemove(idx);   //이미지를 클릭했을 때.
            span.appendChild(img);
 
            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"+ View_area)) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + View_area;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
}



//form데이터 전송
function dataSubmit(replyIdx, idx) {
	
	var sendData = new FormData($("#addForm")[0]);
    
    
    $.ajax({
        url:"/board/fileUpload",
        processData:false,
        contentType:false,
        enctype: 'multipart/form-data',
        data:sendData,
        type:"POST",
        dataType:'JSON',
        success:function(data){
        	
        	//console.log(data.imgList);
        	
        	//data.put("replyIdx",replyIdx);
        	
        	/*
        	var imgList = new Array();
        	var imgGroup = {};
        	
        	//console.log(data.imgList.length);
        	//console.log(data.imgList[0]);
        	
        	for(var i = 0; i < data.imgList.length; i++){
        		
        		var imgName = "imaName"+i;
				
        		imgGroup = {imgName : data.imgList[i]};
        	 	console.log("이미지 정보 통합"+imgGroup.imgName);
        	}
        	
        	console.log(imgGroup.imgName0);
        	console.log(imgGroup.imgName1);
        	
        	imgGroup.replyIdx = replyIdx;
        	
        	console.log("이미지 정보 통합"+imgGroup);
        	*/
        	
        	var totalData = {};
        	totalData.data = data;
        	totalData.replyIdx = replyIdx;
        	
        	
        	$.ajax({
    	         type:'POST',	
    	         url: 'imgUpload',
    	         data : totalData,
    	         dataType:'JSON',
    	         success:function(data){
                    
    	        	$("#recon").val('');
                  	
                    $(".starOrigin input[type=radio]").prop('checked', false);
                  	
          			$("span .addImg").remove();
          			
          			$("#div1").css("display","none");
          			
          			$("#callImgBox").val("이미지 첨부 하기");
          			
                  	replyList(idx);
                  	  
    	         },
    	         error:function(e){
    	            console.log(e);
    	         }
    	      });    
        	
        	
	    },
	    error:function(e){
	            
	    }    
         
    }).done(function (fragment) {
        
    	$("#resultDiv").replaceWith(fragment);
	   
       });
 
};





</script>
</html>