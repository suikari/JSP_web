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
		
		//out.print(stu_no);
		
		
		try {
		
			String sql = "DELETE tbl_stulist WHERE stu_id ='" + stu_id + "'" ; 
					
			int data = stmt.executeUpdate(sql);
			out.print(data + "건 학생 리스트에서 삭제 완료");
	
			sql = "DELETE tbl_grade WHERE stu_id ='" + stu_id + "'" ; 
			
			data = stmt.executeUpdate(sql);
			
			out.print(data + "건 학생 점수표에서 삭제 완료");

		} catch (SQLException e){
			out.print("에러발생");
		}
			
	%>
		<button onclick="fnHome();" > 되돌아가기 </button>
	
	
</body>
</html>


<script>

	function fnHome() {
		location.href = "stu-list.jsp";
	}


</script>