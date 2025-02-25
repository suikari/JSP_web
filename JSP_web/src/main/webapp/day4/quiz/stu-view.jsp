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
%>


<table border="1" cellspacing="0" width="600px"  style="text-align: center;">
    <tr style="font-weight: bold;">
        <td>이름</td>
        <td>학과</td>
        <td>과목명</td>
        <td>시험점수</td>
    </tr>
<%
	try{
		String sql =   " select sl.stu_id, stu_name, stu_dept, subject,  grade  from tbl_stulist sl"
				     + " inner join tbl_grade g on sl.stu_id = g.stu_id "
				     + " where sl.stu_id = '" + stu_id + "'";
		//out.print(sql);

		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
%>

    <tr>
        <td><%=rs.getString("stu_name") %></td>
        <td><%=rs.getString("stu_dept") %></td>
        <td><%=rs.getString("subject") %></td>
        <td><%=rs.getInt("grade") %></td>
    </tr>


<%
		//System.out.print(rs.getString("e.stu_no"));
		//out.print(rs.getString("stu_no_1"));
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>	
	<input id="stu_id" name="stu_id"  value="<%=stu_id%>" hidden />
	<button onclick="fnStuupdate();" > 수정 </button>
	<button onclick="fnStudelete();" > 삭제 </button>
	
</body>
</html>


<script>
	function fnStuupdate(){
		let select = document.querySelector('#stu_id').value;
		
		console.log(select);
		location.href = "stu-update.jsp?stu_id=" + select;
		
	}
	
	function fnStudelete(){
		let select = document.querySelector('#stu_id').value;
		
		console.log(select);
		location.href = "stu-delete.jsp?stu_id=" + select;
		
	}
</script>
