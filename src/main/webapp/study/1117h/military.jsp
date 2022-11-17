<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	
	<style>
		form {
			margin: 0px auto;
			text-align: center;
		}
	
		div {
			width:200px;
		}
	</style>
	
</head>
<body>
	<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="info.jsp">
			<div>
				<img src="${pageContext.request.contextPath}/images/군인.jpg"/>
			</div>
		  <div>
		  	군번 <input type="text" name="code" value="20-14160" class="form-control text" />
		  </div>
		  <div>
		  	성명 <input type="text" name="name" value="천해찬" class="form-control text" />
		  </div>
		  <div>
		  	병과 <input type="text" name="branch" value="포병" class="form-control text" />
		  </div>
		  <div>
		  	소속 <input type="text" name="place" value="수기사" class="form-control text" />
		  </div>
		  <div>
		  	<input type="submit" value="전송" class="btn btn-warning" />
		  </div>
	  </form>
	</div>
	<p><br/></p>
</body>
</html>