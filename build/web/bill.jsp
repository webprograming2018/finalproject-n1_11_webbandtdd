<%-- 
    Document   : bill
    Created on : Dec 20, 2018, 5:07:56 PM
    Author     : MinhGiang
--%>

<%@page import="model.Users"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.BillDetailDAO"%>
<%@page import="model.BillDetail"%>
<%@page import="model.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
<%
    Users users = null;
    if(session.getAttribute("user")!=null){
        users = (Users) session.getAttribute("user");
    }
    ProductDAO productDAO = new ProductDAO();
    BillDetailDAO billDetailDAO = new BillDetailDAO();
    Bill bill = (Bill) session.getAttribute("bill");
    if(bill == null){
        bill = new Bill();
        session.setAttribute("bill",bill);
    }
    Long bill_id = bill.getBillID();
%>
        <div class="invoice">
            <em><p>Envoice ID: <%=bill_id%></p></em>
            <center><h1 style="color:darkcyan;">INVOICE</h1></center>
            <p><b>Account:</b> <%=users.getUserEmail()%></p>
            <p><b>Payment Method:</b> <%=bill.getPayment()%></p>
            <p><b>Address:</b> <%=bill.getAddress()%></p>
            <p><b>Date:</b> <%=bill.getDate()%></p>
            <p><b>Bill Detail:</b></p>
            <center><table class="invoicetb">
                <tr>
                    <th></th><th>Product ID</th><th>Product Name</th><th>Price</th><th>Quantity</th>
                </tr>
                <%
                    int count=0;
                    for (BillDetail bd : billDetailDAO.getListBillDetailByBill(bill_id)){
                        count++;
                        Product product = new Product();
                        product = productDAO.getProduct(bd.getProductID());
                %>
                <tr>
                    <td><p><%=count%></p></td>
                    <td><p><%=bd.getProductID()%></p></td>
                    <td><p><%=product.getProductName()%></p></td>
                    <td><p>$<%=bd.getPrice()%></p></td>
                    <td><p><%=bd.getQuantity()%></p></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="5"><b><p class="invoicett">Total: $<%=bill.getTotal()%></p></b></td>
                </tr>
            </table><br>
        <a href="/Shop/index.jsp">Home</a>
        <a href="./invoice/invoice.html" download="invoice">Download HTML</a>
        <a href="./invoice/invoice.pdf" download="invoice">Download PDF</a>
        </center>
        </div>
    </body>
</html>
