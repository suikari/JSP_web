<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dbcon.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="check">
	<%
		String item_name = request.getParameter("item_name");
		
		ResultSet rs = stmt.executeQuery(
			"SELECT * FROM tbl_product WHERE item_name = '" + item_name + "'"
		);
		if(rs.next()){
			out.println("이미 등록된 상품명입니다.<br> 확인 후 다시 등록 바랍니다.");
	%>
			<input name="flg" value="Y" hidden>
	<%
		} else if ( item_name.equals(""))  {
			out.println("값을 넣고 확인체크 해주세요.");
	%>
			<input name="flg" value="Y" hidden>
	<%	
		} else  {
			out.println(item_name+ "은 사용 가능!");
	%>
			<input name="flg" value="N" hidden>
	<%	
		}
	%>
	<div>
		<input type="button" onclick="fnBack()" value="되돌아가기">
	</div>
	</form>

</body>
</html>
<script>
	function fnBack(){
		window.opener.getReturn(document.check.flg.value);
		window.close();
	}

</script>




