<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>upLoad1.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	
	<script>
		'use script';
		function fCheck() {
			let fName = $("#file").val();
			let ext = fName.substring(fName.lastIndexOf(".")+1); // 확장자 발췌
			let uExt = ext.toUpperCase();
			let maxSize = 1024 * 1024 * 10;   // 업로드 가능한 최대파일의 용량은 10MByte로 한다.
			
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
				return false;
			}
			
			let fileSize = document.getElementById("file").files[0].size; //자바스크립트 명령어
			if(uExt != "JPG" && uExt != "PNG" && uExt != "GIF" && uExt != "ZIP" && uExt != "HWP" &&  uExt != "PPTX" &&  uExt != "PPT" ) {
				alert("업로드 가능한 파일은 'JPG/GIF/PNG/HWP/PPT/PPTX'입니다.");
				return false;
			}
			else if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 10MByte 입니다.");
			}
			else {
			//alert("파일 전송중 ㅋ");
			 myform.submit();				
			}
		}
	</script>
	
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>파일 업로드 테스트 1(싱글파일처리)</h2>
  <p>cos라이브러리를 이용한 파일 업로드</p>
  <form name="myform" method="post" action="${ctp}/upLoad1Ok.st" enctype="multipart/form-data"> <!-- 파일전송을 해야하면 반드시 enctype을 적어야함! -->
	  <div>
	  	파일명 : 
	  	<input type="file" name="fName" id="file" class="form-control-file border mb-2">
	  	<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control" />
	  </div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>