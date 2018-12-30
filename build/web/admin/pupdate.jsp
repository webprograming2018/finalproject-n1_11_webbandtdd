<%-- 
    Document   : uinsert
    Created on : Dec 29, 2018, 10:25:41 AM
    Author     : MinhGiang
--%>

<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <%
            String productID = request.getParameter("productID");
            ProductDAO pDAO = new ProductDAO();
            Product p = new Product();
            p = pDAO.getProduct(Long.parseLong(productID));
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan">Update Product</h2></center>
        <form class="formadd" action="/Shop/AdminServlet" method="post">
            <input type="hidden" name="productID" value="<%=p.getProductID()%>">
            <label>Category:</label>
            <select name="categoryid">
                <%
                    CategoryDAO cDAO = new CategoryDAO();
                    for(Category c : cDAO.getListCategory()){
                        if(c.getCategoryID()==p.getCategoryID()){
                %>
                <option value="<%=c.getCategoryID()%>" selected="selected"><%=c.getCategoryName()%></option>
                <%
                    } else{
                %>
                <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                <%
                        }
                    }
                %>
            </select><br>
            <label>Name:</label>
            <input type="text" name="name" value="<%=p.getProductName()%>">
            <label>Image Url:</label>
            <input type="text" name="img" value="<%=p.getProductImage()%>">
            <label>Price:</label>
            <input type="double" name="price" value="<%=p.getProductPrice()%>">
            <label>Description:</label>
            <input type="text" name="des" value="<%=p.getProductDescription()%>">
            <input type="hidden" value="pupdate" name="command">
            <input type="submit" value="Update" id="btn"> 
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
