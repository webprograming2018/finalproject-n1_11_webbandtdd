<%-- 
    Document   : index
    Created on : Dec 24, 2018, 12:40:48 PM
    Author     : MinhGiang
--%>

<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
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
        ProductDAO productDAO = new ProductDAO();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan;">Products</h2></center>
        <center><a href="/Shop/admin/pinsert.jsp" class="btnad">Add</a></center><br>
        <center><table class="products">
            <tr>
                <th>Product ID</th><th>Category ID</th><th>Name</th><th>Image</th><th>Price</th><th>Description</th><th></th>
            </tr>
           
                <%
                    for(Product p : productDAO.getListProduct()){
                %>
                 <tr>
                <td><%=p.getProductID()%></td><td><%=p.getCategoryID()%></td>
                <td><%=p.getProductName()%></td><td><img class="img" src="<%=p.getProductImage()%>"/></td>
                <td>$<%=p.getProductPrice()%></td><td><%=p.getProductDescription()%></td>
                <td><a href="/Shop/admin/pupdate.jsp?productID=<%=p.getProductID()%>" class="btnad">Update</a>
                    <a href="/Shop/AdminServlet?command=pdelete&id=<%=p.getProductID()%>" class="btnad" style="background-color: red">Delete</a>
                </td>
                 </tr>
                <%
                    }
                %>
           
            </table></center><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
