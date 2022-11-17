<%@page import="j1116.Test2VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Test2VO vo  = (Test2VO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="../../include/bs4.jsp" %>
</head>
<body>
<p><br/></p>
<div class="container">
   <h2>이곳은 test4Ok_2.jsp</h2>
  <p>학번 : ${vo.hakbun}</p> <!-- MVC1 방식 : 서버코드와 프론트를 나눠놓은 방식 -->
  <p>성명 : ${vo.name}</p>
  <p>국어 : ${vo.kor}</p>
  <p>영어 : ${vo.eng}</p>
  <p>수학 : ${vo.mat}</p>
  <p>과학 : ${vo.sci}</p>
  <p>총점 : ${vo.tot}</p>
  <p>평균 : ${vo.avg}</p>
  <p>학점 : ${vo.grade}</p>
 	<p><hr/></p>
 	<p><a href="<%=request.getContextPath()%>/study/1116/test2.jsp" class="btn btn-warning">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>