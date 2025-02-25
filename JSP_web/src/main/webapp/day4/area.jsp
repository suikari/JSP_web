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

try{
	String sql = " select distinct si from area " ;
	//out.print(count_sql);

	ResultSet rs = stmt.executeQuery(sql);
	
	
	

%>
<label> 시 : 
<select id="area" class="area" onchange="fnSelectSi(this.value);" >
			<option value="" disabled selected > 선택 </option>
	
<%
	  while (rs.next()) {
%>

			<option value="<%=rs.getString("si")%>"> <%=rs.getString("si")%></option>
			
<%	
	  }

%>

</select>
</label>
<label> 구 :
<%

	String sql_gu = " select distinct si,gu from area where gu is not null order by si , gu  " ;
	//out.print(count_sql);
	
	String pre_si = "";
	
	ResultSet rs1 = stmt.executeQuery(sql_gu);

	while (rs1.next()) {
		
		if (!(rs1.getString("si").equals(pre_si))) {
			pre_si = rs1.getString("si");
		%>
			</select>
			
			<select class="<%=rs1.getString("si") %> gusel" onchange="fnSelectGu('<%=rs1.getString("si") %>',this.value);" style="display:none;">
		<%
		}
		
		%>
			<option value="<%=rs1.getString("gu")%>"> <%=rs1.getString("gu")%></option>
		
		<%
				
	}
%>
			</select>
</label>

<label> 동 :
<%

	String sql_dong = " select distinct si,gu,dong , nx, ny from area where gu is not null and dong is not null order by si , gu , dong  " ;
	//out.print(count_sql);
	
	String pre_gu = "";
	
	ResultSet rs2 = stmt.executeQuery(sql_dong);

	while (rs2.next()) {
		
		if (!(rs2.getString("gu").equals(pre_gu))) {
			pre_gu = rs2.getString("gu");
		%>
			</select>
			
			<select class="<%=rs2.getString("si") %>-<%=rs2.getString("gu") %> dongsel" onchange="fnSelectDong(this.value);" style="display:none;">
		<%
		}
		
		%>
			<option value="<%=rs2.getString("nx") %>-<%=rs2.getString("ny") %>"> <%=rs2.getString("dong")%></option>
		
		<%
				
	}
%>
			</select>
</label>
<%	
	} catch(SQLException e) {
		
		out.print("오류");
	
		
	}

%>

	
	<div id="wtest"> </div>


</body>
</html>

<script>

 function fnSelectSi(si) {
	//console.log(si);
	let gudom = document.querySelector("."+si);
	let gudoms = document.querySelectorAll(".gusel");
	let dongdoms = document.querySelectorAll(".dongsel");

	for (let i = 0; i < gudoms.length; i++) { 
		gudoms[i].style.display = "none";
	}
	
	for (let i = 0; i < dongdoms.length; i++) { 
		dongdoms[i].style.display = "none";
	}
	
	gudom.style.display = "inline-block";

 }
 
 function fnSelectGu(si,gu) {
		//console.log(gu);
		let gudom = document.querySelector("."+si+"-"+gu);
		let gudoms = document.querySelectorAll(".dongsel");
		
		for (let i = 0; i < gudoms.length; i++) { 
			gudoms[i].style.display = "none";
		}
		
		
		gudom.style.display = "inline-block";

}
 
 function fnSelectDong(xy) {
		var x =  xy.split('-')[0];
		var y =  xy.split('-')[1];

		var apikey="S3AZfm2Egyrf%2Bp1ufP5MBZEaDoowYupZS0xInJ2xpkPtDO06W7EbQcvOk0eTUmOYgxYf3K4IAOpXSU%2BcarvkfA%3D%3D";

		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+ apikey; /*Service Key*/
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20250225'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1100'); /**/
		queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(x); /**/
		queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(y); /**/
		xhr.open('GET', url + queryParams);
		
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    	let wdom = document.querySelector("#wtest");
		    	wdom.innerHTML = this.responseText;

		    }
		};

		xhr.send('');


}
</script>
