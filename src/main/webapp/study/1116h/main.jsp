<%@page import="j1116h.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String sw = "";
ProductVO vo = (ProductVO) request.getAttribute("vo");
System.out.println("vo :"+ vo);
if(vo != null) vo.getSw();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>main.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <style>
    body{
  	width : 700px;
  	margin : 0px auto;
  	padding : 0px;
  }
  #header {
		background-color : orange;  
		text-align : center;
		height : 90px;
  }
  #footer {
		background-color : #ccc;  
		text-align : center;
		height : 80px;
  }
  #content {
		background-color : skyblue;
		text-align : center;
		margin : 0px auto;
  }
  </style>
  
</head>
<body>
<div class="container">
	<!-- 헤더영역('메뉴/로고' 를 표시한다. -->
  <div id="header">
    <br/>
  	<%@ include file="menu.jsp" %>
  </div>
  <!-- 본문영역 -->
  <div id="content">
	  <br/>
	  <div class="text-center">
		  <h1>메인</h1>
		  <hr/>
		  <p><img src="${pageContext.request.contextPath}/images/고양이.jpg" width="400px"/></p>
	  </div>
		<br/>
  </div>
  <div id="footer">
    <%@ include file="footer.jsp" %>
    <br/><%=vo %>
  </div>
</div>
</body>
</html>