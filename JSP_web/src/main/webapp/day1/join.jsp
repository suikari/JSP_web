<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<form action="join-result.jsp" method="get">
		<div> 
			아이디 : <input name="id" />
		</div>
		<div> 
			비밀번호 : <input name="pwd" type="password" />
		</div>
		<div> 
			비밀번호재확인 : <input name="pwd2" type="password" />
		</div>
		<div> 
			이름 : <input name="name" />
		</div>
		<div> 
			핸드폰 : 
			<select name ='phone1'>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>								
			</select>
			<input name="phone2" />
			
		</div>
		<div> 
			성별 : 
			<label> 남<input type="radio" value="M"  name="gender" /></label>
			<label> 여<input type="radio"  value="F" name="gender" /></label>
		
		</div>
		
		<div> 
			취미 : 
		<label> <input type="checkbox"  value="독서" name="hobby" />독서</label>
		<label> <input type="checkbox"  value="영화감상" name="hobby" />영화감상</label>
		<label><input type="checkbox"  value="코딩" name="hobby" />코딩</label>
		<label> <input type="checkbox"  value="운동" name="hobby" />운동</label>
		<label> <input type="checkbox"  value="게임" name="hobby" />게임</label>
		
		</div>		
		<input type="submit" value="제출"/>
	</form>
	
</body>
</html>