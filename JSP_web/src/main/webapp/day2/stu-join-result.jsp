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
	String stu_gender = request.getParameter("stu_gender");
	
	String nosql = "Select * from STUDENT where stu_no = '" + stu_no + "'";
	
	try {
		ResultSet rs = stmt.executeQuery(nosql);
		
		if (rs.next()) {
			out.print("학번 검증 오류(겹치는 번호 있음)");
		} else { 
			
			String sql = "INSERT INTO STUDENT(STU_NO,STU_NAME,STU_DEPT,STU_GENDER) " +
					"  VALUES ('"+ stu_no + "','"+stu_name +"','"+ stu_dept +"','"+ stu_gender +"') "; 
					
			int data = stmt.executeUpdate(sql);
			out.print(data + "건 업데이트 완료");
		}		

	} catch (SQLException e){
		out.print("에러발생");
	}
	
	
	if (stu_gender.equals("M")) {
		stu_gender = "남자";
	} else{
		stu_gender = "여자";
	}	

%>
	
	
	
	<div>학번 : <%=stu_no%> </div>
	<div>이름 : <%=stu_name%></div>
	<div>학과 : <%=stu_dept%></div>
	<div>성별 : <%=stu_gender%> </div>
	
	
</body>
</html>