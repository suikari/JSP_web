<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "../dbcon.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="stu-update-result.jsp" method="post">
	<%
	
		String stu_no = request.getParameter("stu_no");
	
	
	try{
		
		ResultSet rs = stmt.executeQuery("select * from student where stu_no ='" + stu_no + "'");
		//학번 이름 학과 성별 (남자,여자)
		
		while(rs.next()) {
	%>

		<div>
			이름 : <input name="stu_name" value="<%=rs.getString("stu_name")  %>"/>
		</div>
		
		<div>
			학과 : <input name="stu_dept" value="<%=rs.getString("stu_dept")  %>"/>
		</div>
		
		<input name="stu_no" value="<%=stu_no%>" hidden/>

	<%
		//System.out.print(rs.getString("e.stu_no"));
		//out.print(rs.getString("stu_no_1"));
		
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
	
	%>	

		<button type="submit">저장</button>
	</form>
</body>
</html>