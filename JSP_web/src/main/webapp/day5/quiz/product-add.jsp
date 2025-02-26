<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="product-insert.jsp" name="item" method="post" >		
		<div>
			제품명 : <input name="item_name">
			<input type="button" value="상품중복체크" onclick="fnCheck()">
		</div>
		<div>
			가격 : <input type="number"  onkeypress="return checkNumber(event)" name="price">
		</div>
		<div>
			<button type="button" onclick="fnIteminsert()">저장</button>
		</div>
	
	</form>
		<button onclick="fnHome();" > 되돌아가기 </button>
	
</body>
</html> 

<script type="text/javascript">
	let checkFlg = false;

	function fnCheck(){
		let item = document.item;

		window.open(
			"product-name-check.jsp?item_name=" + item.item_name.value, 
			"check", 
			"width=300, height=300"
		);
	}
	
	function getReturn(flg){
		if(flg == "N"){
			let obj = document.item.item_name;
			checkFlg = true;
			obj.disabled = true;
		}
	}
	
 	function fnIteminsert () {
		let item = document.item;


		if(!checkFlg){
			alert("상품중복체크후 등록바랍니다.");
			return;
		}
		
		if(item.price.value < 0){
			alert("상품값이 0원미만(음수)일수 없습니다.");
			return;
		}
		
		
		if(item.item_name.value == "" || item.price.value == ""){
			alert("모든 값을 채워주세요.");
			return;
		}
		
		item.item_name.disabled = false;
		item.submit();
		
	}
 	

	function fnHome() {
		location.href = "product-list.jsp";
	}

	
	function checkNumber(event) {
		  if(event.key >= 0 && event.key <= 9) {
		    return true;
		  }
		  
		  return false;
	}
	
</script>