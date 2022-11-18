<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDeleteNick.jsp -->
<%
	session.removeAttribute("sNickName");  //지정한 닉네임 삭제
%>

<script>
  alert("${sName}님의 닉네임 삭제 완료!!");
  location.href = "t3_SessionMain.jsp";
</script>