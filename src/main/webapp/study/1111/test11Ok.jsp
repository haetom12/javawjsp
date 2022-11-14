<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String name = request.getParameter("name");
  int age = Integer.parseInt(request.getParameter("age"));
  String[] hobbys = request.getParameterValues("hobby");
  String gender = request.getParameter("gender");
  String phone = request.getParameter("phone");
  String email1 = request.getParameter("email1");
  String email2 = request.getParameter("email2");
  String area = request.getParameter("area");
  String birthday = request.getParameter("birthday");
  
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 
 <script>
 'use strict'
    function fCheck() {
        alert("회원가입이 완료되었습니다.");
        }
 
 </script>
   
<style>
    body {
      background-color : gray;
  }
    .container {
        text-align: center;
    }
    
</style>
 
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원가입 정보확인</h2>
  <table class="table table-bordered bg-dark text-white">
    <tr>
      <td class="td1"><font size="4"><b>성명</b></font></td>
      <td class="td2"><%=name %></td>
    </tr>
    <tr>
      <td class="td1">나이</td>
      <td class="td2"><%=age %></td>
    </tr>
    <tr>
      <td class="td1">성별</td>
      <td class="td2"><%=gender %></td>
    </tr>
    <tr>
      <td class="td1">취미</td>
      <td class="td2">
          <%
          String hobby1="";
            for(String hobby  : hobbys) {
                hobby = (hobby + "/");
                hobby1 += hobby;
            } 
                out.print(hobby1.substring(0,hobby1.length()-1));
          %>
      </td>
    </tr>
    <tr>
             <td class="td1">핸드폰 번호</td>
      <td class="td2"><%=phone%></td>
    </tr>
    <tr>
      <td class="td1">이메일</td>
      <td class="td2"><%=email1 + "@" + email2 %></td>
    </tr>
    <tr>
      <td class="td1">거주지</td>
      <td class="td2"><%=area%></td>
    </tr>
    <tr>
      <td class="td1">생년월일</td>
      <td class="td2"><%=birthday%></td>
    </tr>
  </table>
  <br/>
  <div>
  <a href="test11.jsp" class="btn btn-warning">돌아가기</a>
  <input type="button" value="회원가입" onclick="fCheck()" id="btn1" class="btn btn-primary"/>
  </div>
</div>
<p><br/></p>
</body>
</html>