<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t5_Login.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	
	<style>
		.form-control {
		 width : 300px;
		 margin : 0 auto;
		}
	</style>
	
</head>
<body>
<p><br/></p>
<div class="container text-center">
	<h2>로그인</h2>
  <form name="myform" method="post" action="t5_LoginOk.jsp" >
  	<p>아이디<input type="text" name="mid" value="admin" autofocus required class="form-control" /></p>
  	<p>비밀번호<input type="text" name="pwd" value="1234" class="form-control"/></p>
  	<p><input type="submit" class="btn btn-primary" value="로그인" /></p>
  </form>
</div>
<p><br/></p>
</body>
</html>