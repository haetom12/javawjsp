<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();

 	if(cookies != null) { //유효성검사
		for(int i=0; i<cookies.length; i++) {
			cookies[i].setMaxAge(0);   //만료시간을 '0'으로 줘서 바로 쿠키를 삭제시켜버리는것! 지우고싶은것만 지울거면 Name으로 비교해서 개별삭제
			response.addCookie(cookies[i]); //쿠키를 클라이언트에 0으로 저장하는것
		}
 	}

/* 	if(cookies != null) { //유효성검사
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cPwd")) {  //지우고싶은것만 지울거면 Name으로 비교해서 개별삭제
			cookies[i].setMaxAge(0);   //만료시간을 '0'으로 줘서 바로 쿠키를 삭제시켜버리는것! 
			response.addCookie(cookies[i]); //쿠키를 클라이언트에 0으로 저장하는것
			}
		}
	} */
%>


<script>
	alert("쿠키 삭제 완료");
	location.href = "t1_CookiesMain.jsp";
</script>
