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
 
 
 a {
 	margin : 5px;
 	border : 1px solid black;
 	text-decoration : none;
 	text-align : center;
 }
 
 
.active {
 
 	background-color : #ddd;
 	color : red;
 }
 
 

</style>
</head>
<body>
<%
	
	int pageSize = 5; // 페이지 사이즈
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentnum"));
	} catch ( Exception e) {
		currentPage = 1;
	}
	
	try {
		pageSize = Integer.parseInt(request.getParameter("selectnum"));
	} catch ( Exception e) {
		pageSize = 5;		
	}	

	int pagetotSize = 0;
	int lastnum = (currentPage-1) * pageSize;

	
	int pagecnt = 0;
	String paginglist = "3,5,10,15,20" ;
	
%>
<select id="board_pagenum" class="board_pagenum" onchange="fnTest(this.value)" >
	

<%
	for (int i=3;i<=20;i++) {
		if (i == pageSize) {
%>

   			<option value="<%=i%>" selected><%=i %>개씩</option>

<%
		} else if ( paginglist.indexOf( Integer.toString(i)) > -1 ) {
%>
			<option value="<%=i%>" ><%=i %>개씩</option>

<%			
		} 
					
	}
%>

</select>
<table border="1" cellspacing="0" width="750px"  style="text-align: center;">
    <tr style="font-weight: bold;">
    	<td>번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>조회수</td>
        <td>작성일</td>
    </tr>
<%

	
	try{
		
		ResultSet rs1 = stmt.executeQuery("Select count(*) cnt from board ");
		
		if(rs1.next()){ 
			pagetotSize = rs1.getInt("cnt");
		} else {
			return ;
		}
		pagecnt = (int)Math.ceil((double)pagetotSize/pageSize);
		
		ResultSet rs = stmt.executeQuery("Select * from board "
				+" OFFSET "+ lastnum +" ROWS FETCH NEXT " + pageSize + " ROWS ONLY   ");
		//학번 이름 학과 성별 (남자,여자)
		
		while(rs.next()) {
%>

    <tr>
    	<td><%=rs.getString("boardno") %>   </td>  
        <td><%=rs.getString("title") %> </td>
        <td><%=rs.getString("userid") %></a></td>
        <td><%=rs.getString("cnt") %></td>
        <td><%=rs.getString("cdatetime") %></td>
    </tr>


<%
	
		}
	
%>
		<table>
		
<%	
		if (currentPage != 1) {
%>
			<a href="?currentnum=<%=currentPage-1%>&selectnum=<%=pageSize%>"><span class="active"> << </span></a>
<%
		}
				
		for (int i=1; i <= (pagecnt); i++ ){
			
			
			
			if (i == currentPage ) {
				%>
					<a href="javascript:;"><span class="active"> <%=i %> </span></a>
				<%							
			} else {
				%>
					<a href="?currentnum=<%=i%>&selectnum=<%=pageSize%>"><span> <%=i %> </span></a>
				<%							
			}

		}
		
		if (currentPage != pagecnt ) {
%>
			<a href="?currentnum=<%=currentPage+1%>&selectnum=<%=pageSize%>"><span class="active"> >> </span></a>
<%
		}		
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
	
	
	
%>



</body>
</html>

<script>
	function fnStuRemover(){
		let select = document.querySelector('input[name="sel"]:checked').value;
		
		console.log(select);
		location.href = "stu-delete.jsp?stu_no=" + select;
		
	}
	
	function fnTest (pageval){
		location.href = "?currentnum=1&selectnum="+pageval ;
		
		console.log(pageval);

		
	}
	
</script>