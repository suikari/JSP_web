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


<%

	int pageSize = 5; // 한 페이지에 몇개씩 보여줄지
	
	int currentPage = 1;
	
	String keyword = "";
	String where_sql = "";
	
	if(request.getParameter("page") != null){
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	
	if(request.getParameter("size") != null){
		pageSize = Integer.parseInt(request.getParameter("size"));
	}
	
	if(request.getParameter("keyword") != null){
		keyword = request.getParameter("keyword");
		where_sql = "WHERE pro.item_name like '%"+ keyword  +"%' ";
	}
	
	int offset = (currentPage - 1) * pageSize;
	ResultSet rs = null;

		
	String sqlcnt =  "SELECT count(*) as cnt                                            "
					+ "FROM tbl_product pro                                             "
					+ "LEFT JOIN                                                        "
					+ "  (SELECT item_no,                                               "
					+ "          round(avg(score), 2) AS avgs                           "
					+ "   FROM tbl_review                                               "
					+ "   GROUP BY item_no) rev ON pro.item_no = rev.item_no           "
					+ where_sql;
	//out.print(sqlcnt);

	ResultSet rsCnt = stmt.executeQuery(sqlcnt);
	rsCnt.next();
	int total = rsCnt.getInt("cnt");
	
	int pageList = (int) Math.ceil((double) total / pageSize); 
	
%>

<div>
	<input placeholder="검색어" onkeypress="inputkeyword(event)" id="keyword" value="<%=keyword %>"><button onclick="fnSearch()">검색</button>
</div>

<select id="number" onchange="fnNumber(this.value)">
<%
	int arr[] = {3,5,10,15,20};
	for(int i=0; i<arr.length; i++){
		
		if ( arr[i] == pageSize) {
%>
		<option value="<%= arr[i] %>" selected><%= arr[i] + "개씩" %></option>

<%
		} else {
%>
		<option value="<%= arr[i] %>"><%= arr[i] + "개씩" %></option>
<%
		}
	}
%>
</select>

<table border="1" cellspacing="0" width="600px"  style="text-align: center;">
    <tr style="font-weight: bold;">
        <td>제품번호</td>
        <td>제품이름</td>
        <td>가격</td>
        <td>평점</td>
    </tr>
<%
try{
		String sql =  "SELECT pro.item_no,                                              "
					+ "       pro.item_name,                                            "
					+ "       pro.price,                                                "
					+ "       nvl(cast(rev.avgs AS varchar(10)), '평점없음') AS avg_score "
					+ "FROM tbl_product pro                                             "
					+ "LEFT JOIN                                                        "
					+ "  (SELECT item_no,                                               "
					+ "          round(avg(score), 2) AS avgs                           "
					+ "   FROM tbl_review                                               "
					+ "   GROUP BY item_no) rev ON pro.item_no = rev.item_no           "
					+ where_sql
					+ "ORDER BY item_no "
					+ "OFFSET "+ offset +" ROWS FETCH NEXT " + pageSize + " ROWS ONLY ";
		//out.print(sql);

		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
%>

    <tr>
        <td><%=rs.getString("item_no") %></td>
        <td><a href="product-view.jsp?item_no=<%= rs.getString("item_no") %>"><%=rs.getString("item_name") %></a></td>
        <td><%=rs.getString("price") %></td>
        <td><%=rs.getString("avg_score") %></td>
    </tr>


<%
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>

<table>

	<div class="page">
	
	<%	
		if(currentPage != 1){
			out.println("<a href='?page=" + (currentPage-1) + "&size=" + pageSize + "&keyword=" + keyword +"'>◀</a>");
		}
		for (int i = 1; i <= pageList; i++) {
			if(currentPage == i){
				out.println(
						"<a href='?page=" + i + "&size=" + pageSize + "&keyword=" + keyword +"' class='active'>" + i + "</a>"
				);
			} else {
				out.println(
						"<a href='?page=" + i + "&size=" + pageSize +"&keyword=" + keyword +"'>" + i + "</a>"
				);
			}
		}
		if(currentPage != pageList){
			out.println("<a href='?page=" + (currentPage+1) + "&size=" + pageSize + "&keyword=" + keyword +"'>▶</a>");
		}
	%>
	</div>
	<input hidden id="pageSize" value="<%= pageSize %>">
	
	<div>
		<button onclick="fnItemAdd()">제품추가</button>
	</div>

</body>
</html>



<script>

	function fnItemAdd() {
		location.href = "product-add.jsp";
	}
	
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		let pageSize = document.querySelector("#pageSize").value;
		location.href="?size=" + pageSize + "&keyword=" + keyword
	}
	
	function fnNumber(num){
		let keyword = document.querySelector("#keyword").value;
		
		location.href="?size="+num + "&keyword=" + keyword;
	}
	
	function inputkeyword(e){
        
		if(e.keyCode == 13){
            fnSearch();
        }	
	}
	
	
</script>