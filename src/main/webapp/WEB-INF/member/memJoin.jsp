<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memJoin.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <script>
    'use strict';
    // 회원가입폼 체크후 서버로 전송(submit)
    function fCheck() {
    	// 폼의 유효성 검사~~~~
    /*	let regMid = /\w/gm;  //아이디는 영문소문자,대문자,숫자,밑줄만 사용가능
      let regpwd = /\w/gm;  //아이디는 영문소문자,대문자,숫자,밑줄만 사용가능
      let regName = /^[a-zA-Z가-힣]{2,20}$/gm; // 성명은 한글/영문만 가능하도록 길이는 2~20자까지
      let regblank = /\s/g;  // 문장안에 공백 또는 탭을 포함하고 있느냐? */
    		  
      let regMid = /^[a-z0-9_]{4,20}$/;
      // let regPwd = /(?=.*[a-zA-Z])(?=.*?[#?!@$%^&*-]).{4,24}/;
      let regPwd = /(?=.*[0-9a-zA-Z]).{4,24}/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
    		
    	//  폼의 내용을 가져와서 유효성 검사....(아이디/비밀번호/성명은 모두 20자 이하...)
    	let mid = myform.mid.value;
      let pwd = myform.pwd.value;
      let nickName = myform.nickName.value;
      let name = document.getElementById("name").value;
		  let email1 = myform.email1.value;
		  let email2 = myform.email2.value;
		  let gender = myform.gender.value;
		  let birthday = myform.birthday.value;
	    let tel1 = myform.tel1.value;
	    let tel2 = myform.tel2.value;
	    let tel3 = myform.tel3.value;
	    let tel = tel1 + "-" + tel2 + "-" + tel3;
	    let homePage = myform.homePage.value;
	    /* let hobbyCount = document.getElementsByName("hobby").length;
	    let hobby = "";
		    for(let i=0; i<hobbyCount; i++) {
		      if(document.getElementsByName("hobby")[i].checked) {
		        hobby += document.getElementsByName("hobby")[i].value + "/";
		      }
		    }
		    hobby = hobby.substring(0, hobby.length - 1); */
	    let job = myform.job.value;
	    let content = myform.content.value;
	    let userInfor = myform.userInfor.value;
	    
      
      /* if(mid.trim() == "") {
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
		  	} */

    	// 숙제...
    	
	
    	
    	let maxSize = 1024 * 1024 * 1;		// 1MByte 까지 허용
    	let fName = myform.fName.value;
    	let ext = fName.substring(fName.lastIndexOf(".")+1);
    	let uExt = ext.toUpperCase();
    	
    	let submitFlag = 0;
    	
    	// 파일 전송전에 파일에 관한사항 체크..(파일명이 넘어올경우는 해당 파일을 넘기고, 비었으면 'noimage.jpg'를 넘겨준다.)
    	if(fName.trim() == "") {
    		myform.photo.value = "noimage";
    		submitFlag = 1;
    	}
    	else {
    		let fileSize = document.getElementById("file").files[0].size;
    		
    		if(fileSize > maxSize) {
    			alert("업로드 파일의 크기는 1MByte를 초과할수 없습니다.");
    			return false;
    		}
    		else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
    			alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
    			return false;
    		}
    		else if(fName.indexOf(" ") != -1) {
    			alert("업로드 파일에는 공백을 포함할수 없습니다.");
    			return false;
    		}
    		
    		else {
    			submitFlag = 1;
    		}
    	}
    	
			let	numcheck1 = myform.numcheck1.value;
			let	numcheck2 = myform.numcheck2.value;    
    	
    	// 전송전에 모든 체크가 끝났다면 submitFlag가 1이 되도록 처리후 서버로 전송한다.
    	if(numcheck1 == 0 ){
    		alert("아아디 중복체크를 다시해주세요");
    	}
    	else if(numcheck2 == 0 ){
    		alert("닉네임 중복체크를 다시해주세요");
    	}
    	else if(submitFlag == 1) {
    		// 아이디와 닉네임 중복체크버튼에 대한 체크...
    		
    		
    			myform.tel.value = tel;
    		
    		
    		
    		
    		  // 이메일을 하나로 묶어준다.
    		  myform.email.value = email1 + "@" + email2;
    			
    			// 전송전에 '주소'를 하나로 묶어서 전송처리
    			let postcode = myform.postcode.value + " ";
    			let roadAddress = myform.roadAddress.value + " ";
    			let detailAddress = myform.detailAddress.value + " ";
    			let extraAddress = myform.extraAddress.value + " ";
    			myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;
    			
	    		/* alert("회원가입 성공"); */
    			myform.submit();
    	}
    	else {
    		alert("회원가입 실패~~");
    	}
    }
    
    // id 중복체크
    function idCheck() {
    	let mid = myform.mid.value;
    	let url = "${ctp}/memIdCheck.mem?mid="+mid;
    	
    	if(mid.trim() == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else {
    		
    		window.open(url,"nWin","width=580px,height=250px");
    	}
    }
    
    // 닉네임 중복체크
    function nickCheck() {
    	let nickName = myform.nickName.value;
    	let url = "${ctp}/memNickCheck.mem?nickName="+nickName;
    	
    	if(nickName.trim() == "") {
    		alert("닉네임을 입력하세요!");
    		myform.nickName.focus();
    	}
    	else {
    		window.open(url,"nWin","width=580px,height=250px");
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/memJoinOk.mem" class="was-validated">
    <h2>회 원 가 입</h2>
    <br/>
    <div class="form-group">
      <label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" class="btn btn-secondary btn-sm" onclick="idCheck()"/></label>
      <input type="text" class="form-control" name="mid" id="mid" placeholder="아이디를 입력하세요." required autofocus/>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력하세요." name="pwd" required />
    </div>
    <div class="form-group">
      <label for="nickName">닉네임 : &nbsp; &nbsp;<input type="button" value="닉네임 중복체크" class="btn btn-secondary btn-sm" onclick="nickCheck()"/></label>
      <input type="text" class="form-control" id="nickName" placeholder="별명을 입력하세요." name="nickName" required />
    </div>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="form-group">
      <label for="email1">Email address:</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" selected>naver.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="hotmail.com">hotmail.com</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="nate.com">nate.com</option>
					    <option value="yahoo.com">yahoo.com</option>
					  </select>
				  </div>
				</div>
	  </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">성별 :</span> &nbsp; &nbsp;
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="남자" checked>남자
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="gender" value="여자">여자
			  </label>
			</div>
    </div>
    <div class="form-group">
      <label for="birthday">생일</label>
      <input type="date" name="birthday" value="<%=java.time.LocalDate.now() %>" class="form-control"/>
    </div>
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
			      <select name="tel1" class="custom-select">
					    <option value="010" selected>010</option>
					    <option value="02">서울</option>
					    <option value="031">경기</option>
					    <option value="032">인천</option>
					    <option value="041">충남</option>
					    <option value="042">대전</option>
					    <option value="043">충북</option>
			        <option value="051">부산</option>
			        <option value="052">울산</option>
			        <option value="061">전북</option>
			        <option value="062">광주</option>
					  </select>-
	      </div>
	      <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
	      <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
	    </div> 
    </div>
    <div class="form-group">
      <label for="address">주소</label>
			<input type="hidden" name="address" id="address">
			<div class="input-group mb-1">
				<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
				<div class="input-group-append">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary">
				</div>
			</div>
			<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1">
			<div class="input-group mb-1">
				<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
				<div class="input-group-append">
					<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
				</div>
			</div>
    </div>
    <div class="form-group">
	    <label for="homepage">Homepage address:</label>
	    <input type="text" class="form-control" name="homePage" value="http://" placeholder="홈페이지를 입력하세요." id="homePage"/>
	  </div>
    <div class="form-group">
      <label for="name">직업</label>
      <select class="form-control" id="job" name="job">
        <option>학생</option>
        <option>회사원</option>
        <option>공무원</option>
        <option>군인</option>
        <option>의사</option>
        <option>법조인</option>
        <option>세무인</option>
        <option>자영업</option>
        <option>기타</option>
      </select>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">취미</span> &nbsp; &nbsp;
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="등산" name="hobby"/>등산
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="낚시" name="hobby"/>낚시
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="수영" name="hobby"/>수영
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="독서" name="hobby"/>독서
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="영화감상" name="hobby"/>영화감상
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="바둑" name="hobby"/>바둑
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="축구" name="hobby"/>축구
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="checkbox" class="form-check-input" value="기타" name="hobby" checked/>기타
			  </label>
			</div>
    </div>
    <div class="form-group">
      <label for="content">자기소개</label>
      <textarea rows="5" class="form-control" id="content" name="content" placeholder="자기소개를 입력하세요."></textarea>
    </div>
    <div class="form-group">
      <div class="form-check-inline">
        <span class="input-group-text">정보공개</span>  &nbsp; &nbsp; 
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="userInfor" value="공개" checked/>공개
			  </label>
			</div>
			<div class="form-check-inline">
			  <label class="form-check-label">
			    <input type="radio" class="form-check-input" name="userInfor" value="비공개"/>비공개
			  </label>
			</div>
    </div>
    <div  class="form-group">
      회원 사진(파일용량:2MByte이내) :
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">회원가입</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/memLogin.mem';">돌아가기</button>
    
    <input type="hidden" name="photo"/>
    <input type="hidden" name="tel"/>
    <input type="hidden" name="email"/>
    <input type="hidden" name="numcheck1"/>
    <input type="hidden" name="numcheck2"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>