<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



		
		<div>
			아이디 : <input id="id" />
		</div>
	
		<div>
			패스워드 : <input id="pwd"  type="password"/>
		</div>
		
		<input type="button" value="Login" onclick="fnLogin();"/>
		
	


</body>
</html>

<script>

	function fnLogin() {
		
		var id = document.querySelector("#id").value;	
		alert(id);
		
	}



</script>
