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
        <td>사번</td>
        <td>이름</td>
        <td>급여</td>
        <td>급여등급</td>
        <td>팀장명</td>
        <td>부서명</td>
        
    </tr>
<%
	try{
		
		ResultSet rs = stmt.executeQuery("select e.empno , e.ename, e.sal , sal.grade , nvl(e2.empno,0) as mgrno , nvl(e2.ename,'none') as mgr , d.dname, e.deptno " + 
				" from emp e "+
				" left join salgrade sal on e.sal between sal.Losal and sal.hisal "+
				" left join emp e2 on e.mgr = e2.empno "+
				" left join dept d on e.deptno = d.deptno " +
				" order by sal.grade desc ");
		//학번 이름 학과 성별 (남자,여자)
		
		while(rs.next()) {
%>

    <tr>
   		
	        <td><%=rs.getString("empno") %> </td>
	        <td><%=rs.getString("ename") %>  </td>
	        <td><%=rs.getString("sal") %></td>
	        <td><%=rs.getString("grade") %></td>
	        <td><a href="emp-t-chart.jsp?mgrno=<%=rs.getString("mgrno")%>"><%=rs.getString("mgr") %></a></td>
	        <td><a href="emp-chart.jsp?deptno=<%=rs.getString("deptno")%>"><%=rs.getString("dname") %></a></td>
       
    </tr>


<%
	
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>
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