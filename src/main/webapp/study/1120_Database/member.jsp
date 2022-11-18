<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t5_LoginMember.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
	'use strict';
	function searchMid() {
		let mid = prompt("찾고자하는 아이디를 입력하세요?")
		
		location.href="${pageContext.request.contextPath}/database/SearchMid?mid="+mid;
	}
	</script>
	
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 전용방</h2>
  <p><font color='blue'>${sName}</font>님 로그인 중이십니다.</p>
</div>
	<hr />
	<p><img src="${pageContext.request.contextPath}/images/3.jpg" width="300px"/></p>
	<hr />
	<p>
		현재 보유중이 포인트 : ${point} <br />
		최종 방문 일자 : <b><font color='red'>${sLastDate}</font></b>
	</p>
	<hr />
		<div>
			<a href="javascript:searchMid()" class="btn btn-success form-control m-3">개별 회원 조회</a>
			<a href="${pageContext.request.contextPath}/database/MemberList" class="btn btn-success form-control m-3">회원 전체 조회</a>
		</div>
	<hr />
	<p><a href="${pageContext.request.contextPath}/database/LogOut"  class="btn btn-warning form-control">로그아웃</a></p>
	<hr />
<p><br/></p>
</body>
</html>