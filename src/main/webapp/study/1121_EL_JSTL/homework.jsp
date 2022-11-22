<%@page import="study.database.JusorokVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="study.database.JusorokDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
<%
							 //0         1         2
               //012345678901234567890123456
  String atom = "Welcome to My Homepage!";
	pageContext.setAttribute("atom", atom);
		
%>
    5-3.atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치값을 출력하시오.
        단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.
     <form>
      <input type="text" name="textinput" class="form-control mb-3" />
      <input type="submit" value="검색" class="btn btn-primary mb-3" />
      </form>
      <c:set var="text1" value="${param.textinput}" />
      <c:set var="cnt" value="0" />
      <div class="form-control">
      	<c:forEach var="i" begin="0" end="${fn:length(atom)-1}" >
      		<c:if test="${fn:substring(atom,i,i+1) == text1}">
      			<c:set var="cnt" value="${cnt+1}"/>
      				<c:if test="${cnt==1}">
      					<c:set var="num1" value="${i}" />
      				</c:if>
      				<c:if test="${cnt==2}">
      					<c:set var="num2" value="${i}" />
      				</c:if>
      		</c:if>
      	</c:forEach>     
      	<c:if test="${cnt>=2}"> 두번째 값의 위치는 ${num2}</c:if>
      	<c:if test="${cnt<2}"> 첫번째 값의 위치는 ${num1}</c:if>
      </div>
    </div>
    <br /><br />

<p><br/></p>
</body>
</html>