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

	String nosql = "Select * from STUDENT where stu_no = '" + stu_no + "'";

	ResultSet rs = stmt.executeQuery(nosql);
	
	if (rs.next()) {
		out.print("사용중인 학번입니다. 다른번호를 사용하세요.");
%>
		<input id="flg" value="Y" hidden/>
<%
	} else {
		out.print("사용가능한 학번입니다.");
%>
		<input id="flg" value="N" hidden/>

<%
	}
%>
	<input type="button" onclick="fnchk('<%=stu_no %>');" value="뒤돌아가기"/>
</body>
</html>

<script>
	function fnchk(no) {
		let flg =  document.getElementById('flg').value;
		
		opener.setstuno(flg);

		window.close();
	}
	
	
	
</script>