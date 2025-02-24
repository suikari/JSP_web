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
    </style>
</head>
<body>

<%
	String mgrno = request.getParameter("mgrno");


%>


    <div id="app">
            <div id="chart"></div>
            <div id="chart2"></div>
           
    </div>
</body>
</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
            
                options : {
                    series: [44, 55, 13, 43, 22],
                    chart: {
                    width: 380,
                    type: 'pie',
                    },
                    labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
                    responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                        width: 200
                        },
                        legend: {
                        position: 'bottom'
                        }
                    }
                    }]
                },
                options2 : {
                        series : [{
                        name: 'Inflation',
                        data : [2.3, 3.1, 4.0, 10.1, 4.0, 3.6, 3.2, 2.3, 1.4, 0.8, 0.5, 0.2]
                        }],
                        
                        chart: {
                        height: 350,
                        type: 'bar',
                      },
                      plotOptions: {
                        bar: {
                          borderRadius: 10,
                          dataLabels: {
                            position: 'top', // top, center, bottom
                          },
                        }
                      },
                      dataLabels: {
                        enabled: true,
                        formatter: function (val) {
                          return val + "명";
                        },
                        offsetY: -20,
                        style: {
                          fontSize: '12px',
                          colors: ["#304758"]
                        }
                      },
                      
                      xaxis: {
                        categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                        position: 'top',
                        axisBorder: {
                          show: false
                        },
                        axisTicks: {
                          show: false
                        },
                        crosshairs: {
                          fill: {
                            type: 'gradient',
                            gradient: {
                              colorFrom: '#D8E3F0',
                              colorTo: '#BED1E6',
                              stops: [0, 100],
                              opacityFrom: 0.4,
                              opacityTo: 0.5,
                            }
                          }
                        },
                        tooltip: {
                          enabled: true,
                        }
                      },
                      yaxis: {
                        axisBorder: {
                          show: false
                        },
                        axisTicks: {
                          show: false,
                        },
                        labels: {
                          show: false,
                          formatter: function (val) {
                            return val + "%";
                          }
                        }
                      
                      },
                      title: {
                        text: '사원별 부하직원 수',
                        floating: true,
                        offsetY: 330,
                        align: 'center',
                        style: {
                          color: '#444'
                        }
                      }
            }}
        },
        methods: {
            fnList : function() { 
                var self = this;
                
            	//console.log(self.options2.series);
            	//console.log(self.options2.series[0].data);

                self.options.series = [];
                self.options.labels = [];
                self.options2.series[0].data = [];
                self.options2.xaxis.categories = [];

                <%


            	try {
            		ResultSet rs = stmt.executeQuery("select count(e2.empno) as cnt , e2.ename from emp e1 " +
            				" inner  join emp e2 on e1.mgr= e2.empno " +
            				" group by e2.empno , e2.ename ");
            					
            		while(rs.next()) {
            %>
                    self.options.series.push(<%=rs.getString("cnt")%>);
		            self.options.labels.push("<%=rs.getString("ename")%>");
		            self.options2.series[0].data.push(<%=rs.getString("cnt")%>);
                    self.options2.xaxis.categories.push("<%=rs.getString("ename")%>");
            <%

            		}		
				
            	} catch (SQLException e){
            		out.print("에러발생");
            	}
            	
            %>        
            
                var chart = new ApexCharts(document.querySelector("#chart"), self.options);
                chart.render();

                var chart2 = new ApexCharts(document.querySelector("#chart2"), self.options2);
                chart2.render();
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
