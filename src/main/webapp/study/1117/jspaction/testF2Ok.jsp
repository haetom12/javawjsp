<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL을 사용하기 위한 준비 -->
<% request.setCharacterEncoding("utf-8"); %>

<%-- 
<!-- 앞에서 전송된 값들을 변수에 담아보자 JSTL -->
<c:set var="name" value="${param.name}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="gender" value="${param.gender}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="age" value="${param.age}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="job" value="${param.job}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
<c:set var="address" value="${param.address}"/>  <!-- ${name} 저장소에 담지 않았기 때문에 사용불가 -->
 --%>

<!-- 자바 클래스를(VO)를 사용하여 넘어온 값들을 저장하고자 한다. -->
<!-- 자바클래스는 jsp액션태그(jsp:useBean)를 사용한다. -->
<jsp:useBean id="vo" class="j1117.Test1VO"/>  <!-- Test1VO vo = new Test1VO 와 같은 뜻 -->
	
<!-- 생성된 클래스에 값을 넣을때 : jsp:setProperty태그사용  -->	
<!-- 생성된 클래스에 값을 꺼낼때 : jsp:getProperty태그사용  -->	
<jsp:setProperty property="name" name="vo"/> <!-- 변수명/위에서 쓴클래스의 아이디(vo) -->
<jsp:setProperty property="gender" name="vo"/> <!-- 변수명/위에서 쓴클래스의 아이디(vo) -->
<jsp:setProperty property="age" name="vo"/> <!-- 변수명/위에서 쓴클래스의 아이디(vo) -->
<jsp:setProperty property="job" name="vo"/> <!-- 변수명/위에서 쓴클래스의 아이디(vo) -->
<jsp:setProperty property="address" name="vo"/> <!-- 변수명/위에서 쓴클래스의 아이디(vo) -->


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>testF2Ok.jsp</title>
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
	  		<td>${name} / <jsp:getProperty property="name" name="vo"/> </td> <%-- <%=vo.getName()%> --%>
	  	</tr>
	  	<tr>
	  		<th>성별</th>
	  		<td>${gender}/ <jsp:getProperty property="gender" name="vo"/></td>
	  	</tr>
	  	<tr>
	  		<th>나이</th>
	  		<td>${age}/ <jsp:getProperty property="age" name="vo"/></td>
	  	</tr>
	  	<tr>
	  		<th>직업</th>
	  		<td>${job}/ <jsp:getProperty property="job" name="vo"/></td>
	  	</tr>
	  	<tr>
	  		<th>주소</th> 
	  		<td>${address}/ <jsp:getProperty property="address" name="vo"/></td>
	  	</tr>
		</table>
  </p>
  
</div>
<p><br/></p>
</body>
</html>