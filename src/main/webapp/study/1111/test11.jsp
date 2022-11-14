<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test11.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
    'use strict';
  
    function fCheck() {
        let regName = /^[a-zA-Z가-힣]{2,20}$/gm; // 성명은 한글/영문만 가능하도록 길이는 2~20자까지
        let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g; //전화번호 형식에 맞도록 체크 (지역번호-국번-전화번호)
        let regEmail = /^[a-zA-Z0-9]/gm; //이메일 형식에 맞도록 체크
 
        let name = myform.name.value;
        let age = myform.age.value;
        let phone = myform.phone.value;
        let email1 = myform.email1.value;
        let area = myform.area.value;
        let birthday = myform.birthday.value;
        let test = myform.test.value;
        
        if(name == "") {
            alert("성명을 입력하세요!");
            myform.name.focus();
            return false;
        }
        else if(!name.match(regName)) {
            alert("성함는 영문소문자,대문자,한글만 사용가능 합니다")
            return;
        }
        else if(age == "") {
            alert("나이를 입력하세요!");
            myform.age.focus();
            return false;
        }
        else if(myform.hobby[0].checked==false
                && myform.hobby[1].checked==false
                && myform.hobby[2].checked==false
                && myform.hobby[3].checked==false
                && myform.hobby[4].checked==false) {
                  alert("취미를 선택하세요!");
                  return false;
              }
        else if(phone == "") {
            alert("전화번호를 입력하세요!");
            myform.phone.focus();
            return false;
        }
        else if(!phone.match(regTel)) {
            alert("전화번호는 숫자(10~12글자) 및 '-'까지 입력해야합니다!")
            return;
          }
        else if(email1 == "") {
            alert("이메일을 입력하세요!");
            myform.email1.focus();
            return false;
        }
        else if(!email1.match(regEmail)) {
            alert("이메일은 영문소문자,대문자,숫자만 사용가능 합니다")
            return;
        }
        else if(area == "") {
            alert("거주지를 선택하세요!");
            myform.area.focus();
            return false;
        }
        
        else if(area == "") {
            alert("거주지를 선택하세요!");
            myform.area.focus();
            return false;
        }
        else if(birthday == "") {
            alert("생년월일을 선택하세요!");
            myform.area.focus();
            return false;
        }
        else if(test == "") {
            alert("로봇판별기를 입력하세요!");
            myform.test.focus();
            return false;
        }
        else if(test.trim() != "고양이") {
            alert("입력한 동물이 틀립니다! 다시 입력하세요!");
            myform.test.focus();
            return false;
        }
        
            else {
                myform.submit();
            }
    }
  </script>
  
  <style>
  body {
      background-color : gray;
  }
  
  .container{
      width : 600px;
      height : 950px;
  }
  
  p{
      font-size : 20pt;
  }
     
  #btn2 {
      text-align: center;
  }
  h2 {
      text-align: center;
  }
  #test {
      width: 250px;
  }
  </style>
</head>
<body>
<p><br/></p>
<div class="container bg-dark text-white">
    <br/>
  <h2>그린컴퓨터 백엔드 과정 신청서</h2>
  <!-- <form name="myform" method="get" action="../../atom/t7"> -->
  <!-- <!-- <form name="myform" method="post" action="../../test11Ok"> -->
  <!-- <form name="myform" method="post" action="test11Ok.jsp"> -->
  <form name="myform" method="post" action="test11Ok.jsp">
    성명 : <input type="text" name="name" placeholder="성명을 입력하세요" class="form-control"/>
    나이 : <input type="number" name="age" placeholder="나이를 입력하세요" class="form-control"/>
    <div>
    성별 : <br/>
                <input type="radio" name="gender" value="남자" checked />남자
          <input type="radio" name="gender" value="여자" />여자
    </div>
    <div>
      취미 : <br/>
          <input type="checkbox" name="hobby" id="hobby" value="등산" checked>등산
          <input type="checkbox" name="hobby" id="hobby" value="낚시">낚시
          <input type="checkbox" name="hobby" id="hobby" value="독서">독서
          <input type="checkbox" name="hobby" id="hobby" value="음악감상">음악감상
          <input type="checkbox" name="hobby" id="hobby" value="수영">수영
    </div>
    핸드폰 번호 : <input type="text" name="phone" placeholder="000-0000-0000" class="form-control"/>
    <div>
      이메일 : <br/>
      <input type="text" name="email1" id="email1" size="5"/> @
        <select name ="email2">
        <option value="gmail.com">gmail.com</option>  
        <option value="naver.com">naver.com</option>  
        <option value="daum.net">daum.net</option>  
        <option value="nate.com">nate.com</option>  
        <option value="hanmail.net">hanmail.net</option>  
        <option value="hotmail.net">hotmail.net</option>  
      </select>
    </div>
    <div>
      거주지 : <br/>
      <select name ="area"size="4"/>
        <option value="서울">서울</option>  
        <option value="대전">대전</option>  
        <option value="세종">세종</option>  
        <option value="청주">청주</option>  
        <option value="인천">인천</option>  
        <option value="광주">광주</option>  
        <option value="괴산">괴산</option>  
        <option value="부산">부산</option>  
      </select>
    </div>
    <div>
    생년월일 : <br/>
        <input type="date" name="birthday" id="birthday" /> <br/><br/>
    </div>
    <div>
        <p>
        당신은 로봇이 아닙니까? : 
        </p>
        <img src="../고양이.gif" width="250px"/>
        <input type="text" name="test" id="test" placeholder="위 사진은 무슨 동물입니까?" class="form-control mt-2" /> <br/>
    </div>
   <div id="btn2">
    <input type="reset" value="다시입력"  class="btn btn-warning"/>&nbsp &nbsp
    <input type="button" value="전송" onclick="fCheck()" class="btn btn-success"/>
    </div>
  </form>
</div>
<p><br/></p>
</body>
</html>