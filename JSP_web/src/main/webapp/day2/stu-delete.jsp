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
		
		//out.print(stu_no);
		
		
		try {
		
			String sql = "DELETE STUDENT WHERE stu_no ='" + stu_no + "'" ; 
					
			int data = stmt.executeUpdate(sql);
			out.print(data + "건 삭제 완료");
			

		} catch (SQLException e){
			out.print("에러발생");
		}
			
	%>
</body>
</html>