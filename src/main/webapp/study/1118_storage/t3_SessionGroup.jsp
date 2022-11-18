<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionGroup.jsp -->
<%
  Enumeration names = session.getAttributeNames();	//열거형으로
  
  while(names.hasMoreElements()) {  //자료가 있으면 참 없으면 거짓
  	String name = (String) names.nextElement(); // 객체이므로 string으로 형변환 시켜야함	
  	out.println("세션명 : " + name + "<br/>");
  }
%>
<p>
  <a href="t3_SessionMain.jsp" class="btn btn-warning form-control">돌아가기</a>
</p>