<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t5_LoginMember.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 전용방</h2>
  <p><font color='blue'>${sMid}</font>님 로그인 중이십니다.</p>
</div>
	<hr />
	<p><img src="${pageContext.request.contextPath}/images/3.jpg" width="300px"/></p>
	<hr />
	<p>
		방문카운트(session) : <br />
		전체 총방문카운트(application) : <b><font color='blue'>${aVisitCnt}</font></b>
	</p>
	<hr />
	<% if(mid.equals("admin")) {%>
	<p><a href="${pageContext.request.contextPath}/study/1118_storage/t5_LoginDelete.jsp" class="btn btn-danger">전체 방문카운트 초기화</a></p>
	<% } %>
	<p><a href="${pageContext.request.contextPath}/study/1118_storage/t5_LogOut.jsp" class="btn btn-warning">로그아웃</a></p>
	<hr />
<p><br/></p>
</body>
</html>