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
<%
	String stu_no = request.getParameter("stu_no");
	String stu_name = request.getParameter("stu_name");
	String stu_dept = request.getParameter("stu_dept");

	try {
		String sql = "UPDATE STUDENT SET " +
					"  stu_name = '"+stu_name +"',"+
					"  stu_dept = '"+ stu_dept +"'" + 
					" where stu_no = '" + stu_no + "'"; 
					
			int data = stmt.executeUpdate(sql);
			out.print(data + "건 업데이트 완료");
			

	} catch (SQLException e){
		out.print("에러발생");
	}
	
%>


</body>
</html>