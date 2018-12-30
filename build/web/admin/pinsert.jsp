<%-- 
    Document   : uinsert
    Created on : Dec 29, 2018, 10:25:41 AM
    Author     : MinhGiang
--%>

<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Product</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan">Insert Product</h2></center>
        <form class="formadd" action="/Shop/AdminServlet" method="post">
            <label>Category:</label>
            <select name="categoryid">
                <%
                    CategoryDAO cDAO = new CategoryDAO();
                    for(Category c : cDAO.getListCategory()){
                %>
                        <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                <%
                    }
                %>
            </select><br>
            <label>Name:</label>
            <input type="text" name="name">
            <label>Image Url:</label>
            <input type="text" name="img">
            <label>Price:</label>
            <input type="double" name="price">
            <label>Description:</label>
            <input type="text" name="des">
            <input type="hidden" value="pinsert" name="command">
            <input type="submit" value="Insert" id="btn"> 
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
