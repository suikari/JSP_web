<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../../dbcon.jsp" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 td, th {
  /* border: 1px solid black; */
  padding : 5px 5px;
 }
 
 

</style>
</head>
<body>


<table border="1" cellspacing="0" width="600px"  style="text-align: center;">
    <tr style="font-weight: bold;">
        <td>학번</td>
        <td>이름</td>
        <td>학과</td>
        <td>평균점수</td>
    </tr>
<%
	try{
		String sql =  "select sl.stu_id, stu_name, stu_dept, avg(grade) as avgg from tbl_stulist sl "
					+ " inner join tbl_grade g on sl.stu_id = g.stu_id "
					+ " group by sl.stu_id, stu_name, stu_dept " 
					+ " order by avg(grade) desc ";
		//out.print(sql);
		ResultSet rs = stmt.executeQuery(sql);
		//학번 이름 학과 성별 (남자,여자)
		
		while(rs.next()) {
%>

    <tr>
        <td><%=rs.getString("stu_id") %></td>
        <td><a href="stu-view.jsp?stu_id=<%= rs.getString("stu_id") %>"><%=rs.getString("stu_name") %></a></td>
        <td><%=rs.getString("stu_dept") %></td>
        <td><%=rs.getInt("avgg") %></td>
    </tr>


<%
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>

<table>


	<div>
		<button onclick="fnStuAdd()">추가</button>
	</div>

</body>
</html>



<script>

	function fnStuAdd() {
		location.href = "stu-join.jsp";
	}


</script>