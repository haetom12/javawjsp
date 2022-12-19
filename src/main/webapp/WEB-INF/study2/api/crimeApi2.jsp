<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>crimeApi.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    const API_KEY = '7WMGwpEENfXvFnxY1efwZ4263gPHczyuehE7RyufhGeO4SZPOKxDisyWglB%2BjylPIXZJu8Xxs8BCWVbLqr9PdA%3D%3D';
    //const API_KEY = '7WMGwpEENfXvFnxY1efwZ4263gPHczyuehE7RyufhGeO4SZPOKxDisyWglB+jylPIXZJu8Xxs8BCWVbLqr9PdA==';
    
    // 외부 데이터를 가져오는 방식? jQuery / fetch 방식
    
    async function getCrimeData() {
    	let url = "https://api.odcloud.kr/api/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
    	url += "?serviceKey="+API_KEY+"&page=1&perPage=100&returnType=json";
    	
    	// 앞의 지정한 URL을 호출한다.(전송시까지 기다리기위해 async명령 사용. await명령사용시는 함수명 앞에 꼭 async 기술한다.
    	const response = await fetch(url);
    	
    	// 응답받은 데이터를 json데이터형식으로 변환하여 data변수에 담는다.
    	const data = await response.json();
    	
    	console.log("data : ", data);
    	
    	//$("#demo").html(data);
    }
    		
    
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <div>
    <input type="button" value="강력범죄자료조회" onclick="getCrimeData()" class="btn btn-success"/>
  </div>
  <hr/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>