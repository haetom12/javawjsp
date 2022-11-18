<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="study.j1116h.ProductVO"%>
<!-- input.jsp -->

	<div class="container">
	  <h2 class="text-center">판매상품 등록하기</h2>
			<form name="myform" method="post" action="${pageContext.request.contextPath}/j1116h/Main"> 
		 	 <table id="inputTable" class="table table-striped" >
			   <tr>
				   <td>상품명<input type="text" name="product" id="product" value="냉장고" size="7" width="100%"/></td>
				   <td>단가<input type="text" name="price" id="price" value="1000" size="3" width="100%"/></td>
				   <td>수량<input type="text" name="su" id="su" value="2" size="2" width="100%"/></td>
			  </tr>
			</table>
			<div class="col"><input type="submit" value="계산하기" class="btn btn-success form-control "/></div>
        <div class="col"><input type="reset" value="다시입력" class="btn btn-warning form-control"/></div>
			</form>
			<br/>
     </div>	