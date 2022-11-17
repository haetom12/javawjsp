<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<style>
* {
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

#container{
	margin: 0 auto;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  margin-left : 50px;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Style the content */
.content {
  background-color: #ddd;
  padding: 10px;
  height: 900px; 
}

/* Style the footer */
.footer {
  background-color: #f1f1f1;
  padding: 10px;
}

.topnav {
 text-align: center;
 margin: 0px auto;
}
</style>
</head>
<body>
	<div id="container">
		<div class="topnav">
		  <a href="#">메인</a>
		  <a href="#">회원가입</a>
		  <a href="#">회원정보보기</a>
		</div>
		
		<div class="content">
		  <h2>어서오세요 메인화면입니다</h2>
		  <p>아직 기능이 없습니다 ㅠ</p>
		</div>
		
		<div class="footer">
		  <p>Footer</p>
		</div>
  </div>
</body>
</html>