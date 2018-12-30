<%-- 
    Document   : index
    Created on : Dec 24, 2018, 12:40:48 PM
    Author     : MinhGiang
--%>

<%@page import="model.BillDetail"%>
<%@page import="dao.BillDetailDAO"%>
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
        BillDetailDAO billdetailDAO = new BillDetailDAO();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan;">Bill Details</h2></center>
        <center><table class="products">
            <tr>
                <th>Bill Detail ID</th><th>Bill ID</th><th>Product ID</th><th>Price</th><th>Quantity</th>
            </tr>
           
                <%
                    for(BillDetail b : billdetailDAO.getListBillDetail()){
                %>
                 <tr>
                <td><%=b.getBillDetailID()%></td><td><%=b.getBillID()%></td>
                <td><%=b.getProductID()%></td><td>$<%=b.getPrice()%></td>
                <td><%=b.getQuantity()%></td>
                 </tr>
                <%
                    }
                %>
           
            </table></center><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
