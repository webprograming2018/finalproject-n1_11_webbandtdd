<%-- 
    Document   : uinsert
    Created on : Dec 29, 2018, 10:25:41 AM
    Author     : MinhGiang
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <%
            String categoryID = request.getParameter("categoryID");
            CategoryDAO categoryDAO = new CategoryDAO();
            Category c = new Category();
            c = categoryDAO.getCategory(Long.parseLong(categoryID));
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan">Update Category</h2></center>
        <form class="formadd" action="/Shop/AdminServlet" method="post">
            <input type="hidden" name="categoryID" value="<%=c.getCategoryID()%>">
            <label>Category Name:</label>
            <input type="text" name="cname" value="<%=c.getCategoryName()%>">
            <label>Category Image Url:</label>
            <input type="text" name="cimg" value="<%=c.getCategoryImg()%>">
            <input type="hidden" value="cupdate" name="command">
            <input type="submit" value="Update" id="btn"> 
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
