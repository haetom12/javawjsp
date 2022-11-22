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
<%
							 //0         1         2
               //012345678901234567890123456
  String atom2 = "Welcome to My Homepage!";
	pageContext.setAttribute("atom2", atom2);
%>
<div class="container">
   	  6-2.atom변수에 기억되어 있는 문자를 입력받아 그 문자가 두번째로 기억되어 있는 위치값을 출력하시오.
        단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.
     <form name="myform">
        <input type="text" name="textinput2" class="form-control mb-3"/>
        <input type="submit" value="검색" class="btn btn-warning form-control mb-3"/>
        <c:set var="findChar" value="${param.textinput2}"/>
        <c:set var="before" value="${fn:substringBefore(atom2,textinput2)}"/>
        <c:set var="after" value="${fn:substringAfter(atom2,textinput2)}"/>
        <c:set var="after2" value="${fn:indexOf(after,textinput2)}"/>
        <c:if test="${after2>0}"> '${textinput2}'의 두번째 값은 ${fn:length(before)+after2+1}</c:if>
        <c:if test="${after2<0}">
            <p>'${textinput2}'의 첫번째 값은 ${fn:length(before)}입니다.</p>
        </c:if>
        <br/>
        <br/>
    </form>
    </div>
<p><br/></p>
</body>
</html>