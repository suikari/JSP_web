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
	String item_name = request.getParameter("item_name");
	String price = request.getParameter("price");

	String nosql = "Select * from tbl_product where item_name = '" + item_name + "'";

	try {
		ResultSet rs = stmt.executeQuery(nosql);
		
		if (rs.next()) {
			out.print("상품명 오류(겹치는 이름 있음)");
		} else { 
			
			String sql = "INSERT INTO tbl_product(item_no,item_name,price) " +
					"  VALUES (PRODUCT_SEQ.NEXTVAL,'"+ item_name + "','"+price + "') "; 

			int data = stmt.executeUpdate(sql);
			out.print(data + "건 상품 리스트 추가 완료");
			
		}		

	} catch (SQLException e){
		out.print("에러발생");
	}
	
%>
	
	
	
	<div>상품이름 : <%=item_name%> </div>
	<div>가격 : <%=price%></div>
	
	<button onclick="fnHome();" > 되돌아가기 </button>
	
</body>
</html>



<script>

	function fnHome() {
		location.href = "product-list.jsp";
	}

</script>
