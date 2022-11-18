<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t5_LogOut.jsp -->

<% //세션 닫기
	String mid = (String) session.getAttribute("sMid");
	session.invalidate();
%>
<script>
  alert("<%=mid%>님 로그아웃 되셨습니다!!");
  location.href = "t2_Login.jsp";
</script>