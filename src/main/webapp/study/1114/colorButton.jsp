<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<style>
		body {
			margin: 0 auto;
		}
		.container {
			text-align: center;
		}
		
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<div class="w3-container">
	  <h2>Buttons (w3-button)</h2>
	  <input type="button" class="w3-button w3-black" value="Input Button">
	  <button class="w3-button w3-black">Button Button</button>
	  <a href="#" class="w3-button w3-black">Link Button</a>
	</div>  
	<hr /><br />
	<div class="container">
	  <h2>Buttons (bs4-button)</h2>
	  <input type="button" class="btn w3-black w3-hover-red" value="Input Button">
	  <button class="btn w3-black  w3-hover-red">Button Button</button>
	  <a href="#" class="btn w3-black  w3-hover-deep-orange">Link Button</a>
	</div>
	<hr /><br />
	<div style="width:400px; height:200px;" class="w3-pink">
		이곳은 내용영역 입니다.
	</div>  
</div>
<p><br/></p>
</body>
</html>