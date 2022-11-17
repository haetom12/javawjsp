<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL을 사용하기 위한 준비 -->
<% request.setCharacterEncoding("utf-8"); %>

<!-- 앞에서 전송된 값들을 변수에 담아보자 JSTL -->
<c:set var="name" value="${param.name}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="gender" value="${param.gender}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="age" value="${param.age}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="job" value="${param.job}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="address" value="${param.address}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	<jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>개별 인적 자료 현황(서버(serviet)없이 jsp에서 변수에 값담아서 jsp로 보내기)</h2>
	<p>
  	<table class="table table-bordered">
	  	<tr>
	  		<th>성명</th>
	  		<td>${name}</td> <%-- <%=vo.getName()%> --%>
	  	</tr>
	  	<tr>
	  		<th>성별</th>
	  		<td>${gender}</td>
	  	</tr>
	  	<tr>
	  		<th>나이</th>
	  		<td>${age + 1}</td>
	  	</tr>
	  	<tr>
	  		<th>직업</th>
	  		<td>${job}</td>
	  	</tr>
	  	<tr>
	  		<th>주소</th> 
	  		<td>${address}</td>
	  	</tr>
		</table>
  </p>
  
</div>
<p><br/></p>
</body>
</html>