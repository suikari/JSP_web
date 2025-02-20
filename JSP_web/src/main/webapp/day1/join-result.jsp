<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Arrays"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone1");
	String gender = request.getParameter("gender");
	
	if (gender.equals("M")) {
		gender = "남자";
	} else{
		gender = "여자";
	}
	
	String hobby[] = request.getParameterValues("hobby");

%>
	
	
	
	<div>이름 : <%=id%> </div>
	<div>비번 : <%=pwd%></div>
	<div>이름 : <%=name%></div>
	<div>전번 : <%=phone%></div>
	<div>성별 : <%=gender%> </div>
	<div>취미 : <%=Arrays.toString(hobby)%> </div>
	
</body>
</html>