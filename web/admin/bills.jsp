<%-- 
    Document   : index
    Created on : Dec 24, 2018, 12:40:48 PM
    Author     : MinhGiang
--%>

<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Mobile E-Shop</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <%
        BillDAO billDAO = new BillDAO();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan;">Bills</h2></center>
        <center><table class="products">
            <tr>
                <th>Bill ID</th><th>User ID</th><th>Total</th><th>Payment</th><th>Address</th><th>Date</th>
            </tr>
           
                <%
                    for(Bill b : billDAO.getListBill()){
                %>
                 <tr>
                <td><%=b.getBillID()%></td><td><%=b.getUserID()%></td>
                <td>$<%=b.getTotal()%></td><td><%=b.getPayment()%></td>
                <td><%=b.getAddress()%></td><td><%=b.getDate()%></td>
                 </tr>
                <%
                    }
                %>
           
            </table></center><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
