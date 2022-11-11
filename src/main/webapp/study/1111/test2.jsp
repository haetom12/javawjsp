<!-- 지시자(디렉티브) 초기환경이나 외부 import를 할때 사용 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>test1.jsp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<!-- HTML 주석 -->
	<%-- 이곳은 JSP 주석입니다. 이곳은 보호받고싶은곳 / 페이지 소스보기에서 안보임 --%>
	<h2>이곳은 1111폴더의 test1.jsp입니다.</h2>
	<%  //스트립코드(자바코드를 작성하는 공간)
	// 이곳은 자바 한줄 주석입니다.
	/*
	이곳은 자바 여러줄 주석입니다.
	*/
	System.out.println("이곳은 jsp파일입니다.");;  //콘솔에 뜨는것
	
	out.println("<font color='red'>이곳은 jsp의 out메소드</font>입니다"); //웹에 뜨는 것
	%>
	<hr/>
	<%="안녕하세요. 이곳은 <b>표현식(expression)</b> 내부입니다 // 내용만 출력하는곳 // 자바코드 안먹음" %>>
</div>
<p><br/></p>
</body>
</html>