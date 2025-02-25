<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../dbcon.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String stu_id = request.getParameter("stu_id");
	String stu_name = request.getParameter("stu_name");
	String stu_dept = request.getParameter("stu_dept");
	String subject = request.getParameter("subject");
	String grade = request.getParameter("grade");


	String nosql = "Select * from tbl_stulist where stu_id = '" + stu_id + "'";
	
	try {
		ResultSet rs = stmt.executeQuery(nosql);
		
		if (rs.next()) {
			out.print("학번 검증 오류(겹치는 번호 있음)");
		} else { 
			
			String sql = "INSERT INTO tbl_stulist(stu_id,stu_name,stu_dept) " +
					"  VALUES ('"+ stu_id + "','"+stu_name +"','"+ stu_dept + "') "; 
					
			int data = stmt.executeUpdate(sql);
			out.print(data + "건 학생리스트 추가 완료");
			
			
			sql = "INSERT INTO tbl_grade(stu_id,subject,grade) " +
					"  VALUES ('"+ stu_id + "','"+subject +"','"+ grade + "') "; 
					
			data = stmt.executeUpdate(sql);
			
			out.print(data + "건 학생점수 추가 완료");
			
		}		

	} catch (SQLException e){
		out.print("에러발생");
	}
	
%>
	
	
	
	<div>학생아이디 : <%=stu_id%> </div>
	<div>이름 : <%=stu_name%></div>
	<div>학과 : <%=stu_dept%></div>
	<div>과목 : <%=subject%> </div>
	<div>점수 : <%=grade%> </div>
	
	<button onclick="fnHome();" > 되돌아가기 </button>
	
</body>
</html>



<script>

	function fnHome() {
		location.href = "stu-list.jsp";
	}


</script>
