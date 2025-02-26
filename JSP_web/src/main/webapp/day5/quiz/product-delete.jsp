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
		
		//out.print(stu_no);
		
		
		try {
		
			String sql = "DELETE tbl_product WHERE item_no ='" + item_no + "'" ; 
					
			int data = stmt.executeUpdate(sql);
			out.print(data + "건 상품 리스트에서 삭제 완료");
	
			sql = "DELETE tbl_review WHERE item_no ='" + item_no + "'" ; 
			
			data = stmt.executeUpdate(sql);
			
			out.print(data + "건 리뷰리스트에서 삭제 완료");

		} catch (SQLException e){
			out.print("에러발생");
		}
			
	%>
		<button onclick="fnHome();" > 되돌아가기 </button>
	
	
</body>
</html>


<script>

	function fnHome() {
		location.href = "product-list.jsp";
	}


</script>