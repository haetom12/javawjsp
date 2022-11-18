<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Cookie[] cookies = request.getCookies();
String mid = "";

if(cookies != null) { //유효성검사
	for(int i=0; i<cookies.length; i++) {
		if(cookies[i].getName().equals("cMid")){
			mid = cookies[i].getValue();
			pageContext.setAttribute("mid", mid);
			break;
		}
	}
}

%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_Login.jsp</title>
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
  <form name="myform" method="post" action="${pageContext.request.contextPath}/study/j1118h_LoginOk" >
  	<p>아이디<input type="text" name="mid" value="${mid}" autofocus required class="form-control" /></p>
  	<p>비밀번호<input type="text" name="pwd" class="form-control"/></p>
  	<p><input type="submit" class="btn btn-primary" value="로그인" /></p>
  	<p><input type="checkbox" name="cookies" value="true" />쿠키저장</p>
  	<hr />
  	<p>세션id<input type="text" name="sessionIP" value="<%=session.getId()%>" readonly class="form-control"/></p>
  </form>
</div>
<p><br/></p>
</body>
</html>