<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>join.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    
    function fCheck() {
      let regMid = /\w/gm;  //아이디는 영문소문자,대문자,숫자,밑줄만 사용가능
      let regpwd = /\w/gm;  //아이디는 영문소문자,대문자,숫자,밑줄만 사용가능
      let regName = /^[a-zA-Z가-힣]{2,20}$/gm; // 성명은 한글/영문만 가능하도록 길이는 2~20자까지
      let regblank = /\s/g;  // 문장안에 공백 또는 탭을 포함하고 있느냐?
    		
    	//  폼의 내용을 가져와서 유효성 검사....(아이디/비밀번호/성명은 모두 20자 이하...)
    	let mid = document.getElementById("mid").value;
      let pwd = document.getElementById("pwd").value;
      let name = document.getElementById("name").value;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요...");
    		document.getElementById("mid").focus();
    	}
    	else if(!mid.match(regMid)) {
    	  alert("아이디는 영문소문자,대문자,숫자,밑줄만 사용가능 합니다")
    	  return;
    	  }
    	else if(mid.match(regblank)) {
    		alert("아이디에 공백이 있습니다")
      	return;
    	}
      else if(pwd.trim()=="") {
        alert("비밀번호를 입력하세요")
        return;
        }
      else if(!pwd.match(regpwd)) {
        alert("비밀번호는 영문소문자,대문자,숫자,밑줄만 사용가능 합니다")
        return;
        } 
      else if(pwd.match(regblank)) {
	  		alert("비밀번호에 공백이 있습니다")
	    	return;
	  	}
      else if(name.trim()=="") {
        alert("성함을 입력하세요")
        return;
      }
      else if(!name.match(regName)) {
        alert("성함는 영문소문자,대문자,한글만 사용가능 합니다")
        return;
      }
      else if(name.match(regblank)) {
	  		alert("성함에 공백이 있습니다.")
	    	return;
	  	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 가입</h2>
  <form name="myform" method="post" action="${pageContext.request.contextPath}/database/JoinOk">
    <table class="table">
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" id="mid" required class="form-control"/></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" id="pwd" required class="form-control"/></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" id="name" required class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center">
          <input type="button" value="회원가입" onclick="fCheck()" class="btn btn-success mr-3"/>
          <input type="reset" value="다시입력" class="btn btn-success mr-3"/>
          <input type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/study/1120_Database/login.jsp';" class="btn btn-success"/>
        </td>
      </tr>
    </table>
  </form>
</div>
<p><br/></p>
</body>
</html>