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
%>


<table border="1" cellspacing="0" width="300px"  style="text-align: center;">
    <tr style="font-weight: bold;">
        <td>학번</td>
        <td>이름</td>
        <td>학과</td>
        <td>학년</td>
        <td>시험점수</td>
    </tr>
<%
	try{
		
		ResultSet rs = stmt.executeQuery("select s.* , e.* from student s left join enrol e on s.stu_no = e.stu_no where s.stu_no ='" + stu_no + "'");
		//학번 이름 학과 성별 (남자,여자)
		
		while(rs.next()) {
%>

    <tr>
        <td><%=rs.getString("stu_no") %></td>
        <td><%=rs.getString("stu_name") %></td>
        <td><%=rs.getString("stu_dept") %></td>
        <td><%=rs.getString("stu_grade") %></td>
        <td><%=rs.getString("enr_grade") %></td>
    </tr>


<%
		//System.out.print(rs.getString("e.stu_no"));
		//out.print(rs.getString("stu_no_1"));
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>	
	<input id="stu_no" name="stu_no"  value="<%=stu_no%>" hidden />
	<button onclick="fnStuupdate();" > 수정 </button>
</body>
</html>


<script>
	function fnStuupdate(){
		let select = document.querySelector('#stu_no').value;
		
		console.log(select);
		location.href = "stu-update.jsp?stu_no=" + select;
		
	}
</script>
