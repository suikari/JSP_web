<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="stu-join-result.jsp" name="stu" method="post" >
		<div>
			학번 : <input name="stu_no"> <input onclick="fnPopup();" type="button" value="중복체크"/> 
		</div>
		
		<div>
			이름 : <input name="stu_name">
		</div>
		
		<div>
			학과 : <input name="stu_dept">
		</div>
		
		<div>
			성별 : 
			<label><input type="radio" name="stu_gender" value="M" checked="checked" /> 남자</label>
			<label><input type="radio" name="stu_gender" value="F"/> 여자</label>
		</div>
		<div>
			<button type="button" onclick="fnStuinsert()">저장</button>
		</div>
	
	</form>
	
</body>
</html> 

<script type="text/javascript">

 	function fnStuinsert () {
		let stu = document.stu;

		if ( !(stu.stu_no.disabled) ) {
			alert("중복체크 완료해주3.");
			return;			
		}
		
		if(stu.stu_no.value.length !=8) {
			alert("학번은 8자리 여야 함");
			return;
		}
		
		if (stu.stu_name.value== "" || stu.stu_dept.value =="" ){
			alert("모든값을 다 넣어주세요");
			return;		
			
		}
		
		stu.stu_no.removeAttribute("disabled"); 		
		stu.submit();
	}
 	
 	function fnPopup() {
		let stu_no = document.stu.stu_no.value;
		
		if(stu_no.length !=8) {
			alert("학번은 8자리 여야 함");
			return;
		}
		

		
 		window.open('stu-join-numchk.jsp?stu_no='+stu_no, '_blank', 'width=300, height=300');
	}
 	
 	function setstuno(flg){
 		let stu = document.stu;
 		
 		console.log(flg);
 		
 		if (flg == 'N') {
 			stu.stu_no.setAttribute('disabled',true); 			
 		} else {
 			stu.stu_no.removeAttribute("disabled"); 		
 		}
 		
 		
 		
 	}

</script>