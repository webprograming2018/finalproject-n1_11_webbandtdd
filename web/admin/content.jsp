<%-- 
    Document   : dashboard.jsp
    Created on : Dec 24, 2018, 12:55:34 PM
    Author     : MinhGiang
--%>

<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales</title>
        <script type="text/javascript" src="js/Chart.min.js"></script>
    </head>
    <body>
         <%
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            BillDAO billDAO = new BillDAO();
            String[] daysl = new String[30];
            String[] totall = new String[30];
            for(int i=0;i<30;i++){
                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE,-i);
                String day = dateFormat.format(cal.getTime()).toString();
                daysl[i]=day;
                request.setAttribute("daysl"+i,daysl[i]);
                float tmp=0;
                for(Bill b : billDAO.getListBill()){
                    if(dateFormat.format(b.getDate()).compareTo(dateFormat.format(cal.getTime()))==0){
                        tmp+=b.getTotal();
                    }
                }
                String total = Float.toString(tmp);
                totall[i] = total;
                request.setAttribute("totall"+i,totall[i]);
            }
         %>
        <center><h2 style="color:darkcyan;">Sales In 30 Days</h2></center>
        <canvas id="myChart" width="500px" height="200px;"></canvas>
        <script>
            var daysl = new Array();
            var totall = new Array();
            <%
                for(int i=29;i>=0;i--){
            %>
                daysl.push("<%=request.getAttribute("daysl"+i)%>");
                totall.push("<%=request.getAttribute("totall"+i)%>");
           <%
               }
           %>
            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: daysl,
                    datasets: [{
                        label: 'Total($)',    
                        data: totall,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                }
            });
        </script>
    </body>
</html>
