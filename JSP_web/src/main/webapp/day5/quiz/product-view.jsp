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
	String item_no = request.getParameter("item_no");
%>


<%
	try{
		String sql =  "SELECT pro.item_no,                                              "
				+ "       pro.item_name,                                            "
				+ "       pro.price,                                                "
				+ "       nvl(rev.contents,'/') contents,                            "
				+ "       nvl(rev.score,'0') score                                   "
				+ "FROM tbl_product pro                                             "
				+ "LEFT JOIN                                                        "
				+ "  tbl_review rev ON pro.item_no = rev.item_no                    "
				+ "WHERE pro.item_no = '"  + item_no + "'" ;
		//out.print(sql);

		ResultSet rs = stmt.executeQuery(sql);


		String item_name = "";
		String price = "";
		
		while(rs.next()) {
			
			if (!(item_name.equals(rs.getString("item_name")))) {
				item_name = rs.getString("item_name");
				price =  rs.getString("price");
%>
				<div>
					상품명 : <%=item_name %> </br>
					상품가격 : <%=price %>
				</div>
				<hr>
<%				
			}
			String comment = rs.getString("contents");
			if (!(comment.equals("/"))) {
%>
	
			<div><%=rs.getString("contents") %>        <span><%=rs.getString("score") %> 점 </span>     </div>
<%			
			}
		}
		
	} catch(SQLException e) {
		
		out.print("오류");

		
	}
%>	
	<input id="item_no" name="item_no"  value="<%=item_no%>" hidden />

	<button onclick="fnItemupdate();" > 수정 </button>
	<button onclick="fnItemdelete();" > 삭제 </button>
	<button onclick="fnHome();" > 되돌아가기 </button>
	
</body>
</html>


<script>

	function fnItemupdate(){
		alert("현재 수정은 불가능 합니다.")
		
		location.href = "product-list.jsp";
		
	}
	
	function fnItemdelete(){
		let select = document.querySelector('#item_no').value;
		
		console.log(select);
		
		location.href = "product-delete.jsp?item_no=" + select;
		
	}
	
	function fnHome() {
		location.href = "product-list.jsp";
	}
	
</script>

