<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
    'use strict';
    let addTbl;

    function addProduct() {
      addTbl = document.getElementById("addTable");
      let addRow = addTbl.insertRow();  
      addRow.onmouseover = function() { 
        addTbl.clickedRowIndex = this.rowIndex;
      }
      let addCell = addRow.insertCell(); 

      let formTag = "";
      formTag += '상품명:&nbsp<input type="text" name="product" style="width:100px; height:30px;"/>';
      formTag += '&nbsp단가:&nbsp<input type="number" name="price" style="width:100px; height:30px;"/>';
      formTag += '&nbsp수량:&nbsp<input type="number" name="su" style="width:100px; height:30px;"/>';
      formTag += '&nbsp<input type="button" value="삭제" onclick="removeRow()"/>';
      addCell.innerHTML = formTag;
    }

    function removeRow() {
      addTable.deleteRow(addTbl.clickedRowIndex);
    }
    
    
    function fCheck() {
	    let cusname =  document.getElementById("cusname");
	    let part =  document.getElementById("part").value;
	    let product =  document.getElementsByName("product").value;
	    let price =  document.getElementsByName("price").value;
	    let su =  document.getElementsByName("su").value;
	    
        if(cusname.value=="") {
          alert("구매자를 입력하세요");
          cusname.focus();
          return;
        }
        else if(part=="") {
          alert("상품분류를 선택하세요");
          return;
        }
        /*
    		else if(product=="") {
            alert("상품명을 입력하세요");
            product.focus();
            return;
          }

        else if(price=="") {
            alert("단가를 입력하세요");
            price.focus();
            return;
          }
        
        else if(su=="") {
            alert("수량을 입력하세요");
            su.focus();
            return;
          }
        */
        else {
    		  myform.submit();
    	 	}
      }
  
  </script>
  
  <style>
  	.container {
  		border: 1px solid gray;
  		width: 600px;
  	}
  
  	#name {
  		width: 130px;
  		height: 30px;
  		margin-left: 20px;
  		margin-bottom: 5px;
  		margin-top: 5px;
  	}
  	#btn1,#btn2 {
  		width: 200px;
  		margin-bottom: 2px;
  	}
  	
  </style>
  
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="<%=request.getContextPath()%>/j1114_Homework"> 
		<table>
			<tr>
		  	<td>구매자<input type="text" name="cusname" id="cusname"/></td>
		  </tr>
		  <tr>	
		  	<td>상품분류
			  	<select name ="part" id="part">
			  		<option value="전자제품">전자제품</option>  
			      <option value="식품">식품</option>
			      <option value="가구">가구</option>
			      <option value="의류">의류</option>
			    </select>
		    </td>
		  </tr>
		  <tr>
		 	 <td><input type="button" value="상품추가" onclick="addProduct()" id="btn1" class="btn btn-primary mt-2"/></td>
		  </tr>
		  <tr><td><hr/></td></tr>
		 	 <table id="addTable">
			  <tr>
			  	<td>
	          상품명:&nbsp <input type="text" name="product" id="product" style="width:100px; height:30px;" />
	          단가:&nbsp <input type="number" name="price" id="price" style="width:100px; height:30px;" />
	          수량:&nbsp <input type="number" name="su" id="su" style="width:100px; height:30px;" />
	        </td>
			  </tr>
			</table>
				<tr>
				<td><input type="button" value="계산하기" onclick="fCheck()" id="btn2" class="btn btn-success mt-2 mb-2"/></td>
				</tr>
	  </table>
	</form>
</div>
<p><br/></p>
</body>
</html>