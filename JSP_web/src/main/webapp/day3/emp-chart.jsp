<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../dbcon.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>연습!!!!!!!!</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/4.3.0/apexcharts.min.js" integrity="sha512-QgLS4OmTNBq9TujITTSh0jrZxZ55CFjs4wjK8NXsBoZb04UYl8wWQJNaS8jRiLq6/c60bEfOj3cPsxadHICNfw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>    <style>
        table, tr, th, td {
            text-align: center;
            border : 2px solid #bbb;
            border-collapse: collapse;
            padding : 5px;
        }
        th {
            color : rgb(132, 39, 219);
            background-color: aliceblue;
            /* font-size: 30px; */
        }
    </style></head>
<body>

<%
	String deptno = request.getParameter("deptno");
	String dname = "";


%>

    <div id="app">
   			<div > 조회 부서명 : {{dname}}</div>
            <div id="chart"></div>
    </div>
</body>
				
<script>
    const app = Vue.createApp({
        data() {
            return {
            	dname : '',
                options : {
                    series: [{
                    data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
                    }],
                    chart: {
                    type: 'bar',
                    height: 350
                    },
                    plotOptions: {
                    bar: {
                        borderRadius: 4,
                        borderRadiusApplication: 'end',
                        horizontal: true,
                    }
                    },
                    dataLabels: {
                    enabled: false
                    },
                    xaxis: {
                    categories: ['South Korea', 'Canada', 'United Kingdom', 'Netherlands', 'Italy', 'France', 'Japan',
                        'United States', 'China', 'Germany'
                    ],
                    }
                },

            }
        },
        methods: {
            fnList : function() { 
                var self = this;

                //console.log(data.list);
                //console.log(data.list.NAME);
                self.options.series[0].data = [];
                self.options.xaxis.categories = [];

                <%


                	try {
                		ResultSet rs = stmt.executeQuery("select e.ename, e.sal , d.dname from emp e inner join dept d on e.deptno = d.deptno " +
                		" where d.deptno = '" + deptno + "'");
                					
                		while(rs.next()) {
                			dname = rs.getString("dname");
                %>
	                self.options.series[0].data.push("<%=rs.getString("sal")%>");
	                self.options.xaxis.categories.push("<%=rs.getString("ename")%>");        
	                
	                self.dname = "<%=dname%>";
                <%

                		}		
					
                	} catch (SQLException e){
                		out.print("에러발생");
                	}
                	
                %>             
				                

                console.log(self.options);
                var chart = new ApexCharts(document.querySelector("#chart"), self.options);
                chart.render();          
            },
        },
        mounted() {
            // 처음 시작할 때 실행되는 부분
            let self = this;
            this.fnList();

        }
    });

    app.mount('#app');



      

</script>

</html>