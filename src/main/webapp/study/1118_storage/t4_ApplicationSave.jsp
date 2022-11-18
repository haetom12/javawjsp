<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t4_ApplicationSave.jsp -->

<%
  String mid = (request.getParameter("mid")==null || request.getParameter("mid").equals("")) ? "hkd1234" : request.getParameter("mid");
  String nickName = (request.getParameter("nickName")==null || request.getParameter("nickName").equals("")) ? "홍장군" : request.getParameter("nickName");
  int age = (request.getParameter("age")==null || request.getParameter("age").equals("")) ? 20 : Integer.parseInt(request.getParameter("age"));
  String name = (request.getParameter("name")==null || request.getParameter("name").equals("")) ? "홍길동" : request.getParameter("name");
  
  application.setAttribute("aMid", mid);
  application.setAttribute("aNickName", nickName);
  application.setAttribute("aAge", age);
  application.setAttribute("aName", name);
%>

<script>
  alert("${aName}님의 Application 저장 완료!!");
  location.href = "t4_ApplicationMain.jsp";
</script>