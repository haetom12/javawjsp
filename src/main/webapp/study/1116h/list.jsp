<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  ProductVO vo = (ProductVO) request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>list.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
    <style>
  tr,td {
  	text-align:center;
  }
  
  td {
  width: 100px;
  }

	body {
	 text-align: center;
	}

  </style>
  
</head>
<body>
<!-- 헤더영역('메뉴/로고' 를 표시한다. -->
<div id="header">
  <br/>
	<%@ include file="menu.jsp" %>
</div>
<p><br/></p>
<div class="container">
  <h2>상품 판매 결과 화면</h2>
  <hr/>
<div class="container">
  <table class='table table-bordered'>
  	<tr class='table-Warning text-Warning'>
  		<td>상품명</td><td>단가</td><td>수량</td><td>가격</td>
  	</tr>
  	<tr class='table-Warning text-Warning'>
  		<td>${vo.product}</td><td>${vo.price}</td><td>${vo.su}</td><td>${vo.kumaek}</td>
  	</tr>
  </table>
</div>
  <hr/>
</div>
<p><br/></p>
<div id="footer">
  <%@ include file="footer.jsp" %>
  <br/><%=vo %>
</div>
</body>
</html>