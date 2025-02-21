<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../dbcon.jsp" %>

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


<table border="1" cellspacing="0" width="300px"  style="text-align: center;">
    <tr style="font-weight: bold;">
    	<td>선택</td>
        <td>학번</td>
        <td>이름</td>
        <td>학과</td>
        <td>성별</td>
    </tr>
<%
	try{
		
		ResultSet rs = stmt.executeQuery("Select * from student");
		//학번 이름 학과 성별 (남자,여자)
		
		while(rs.next()) {
%>

    <tr>
    	<td><input type="radio" name="sel" value="<%=rs.getString("stu_no")  %>" /> </td>  
        <td><%=rs.getString("stu_no") %></td>
        <td><a href="stu-view.jsp?stu_no=<%=rs.getString("stu_no")%>"><%=rs.getString("stu_name") %></a></td>
        <td><%=rs.getString("stu_dept") %></td>
        <td><%if(rs.getString("stu_gender").equals("M")){ out.print("남자"); } else { out.print("여자");} %></td>
    </tr>


<%
	
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>
	<button onclick="fnStuRemover();"> 삭제 </button>
<table>

</body>
</html>

<script>
	function fnStuRemover(){
		let select = document.querySelector('input[name="sel"]:checked').value;
		
		console.log(select);
		location.href = "stu-delete.jsp?stu_no=" + select;
		
	}
</script>