<%-- 
    Document   : category
    Created on : Dec 24, 2018, 10:55:35 PM
    Author     : MinhGiang
--%>

<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>
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
        CategoryDAO categoryDAO = new CategoryDAO();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan;">Products</h2></center>
        <div id="test"></div>
        <center><table class="products">
            <tr>
                <th>Category ID</th><th>Category Name</th><th>Category Image</th><th></th>
            </tr>
           
                <%
                    for(Category p : categoryDAO.getListCategory()){
                %>
                 <tr>
                <td><%=p.getCategoryID()%></td><td><%=p.getCategoryName()%></td><td><img src="<%=p.getCategoryImg()%>"></td>
                <td><a href="/Shop/admin/cupdate.jsp?categoryID=<%=p.getCategoryID()%>" class="btnad">Update</a>
                    <a href="/Shop/AdminServlet?command=cdelete&id=<%=p.getCategoryID()%>" class="btnad" style="background-color: red">Delete</a></td>
                 </tr>
                <%
                    }
                %>
           
            </table></center><br>
            <center><a href="/Shop/admin/cinsert.jsp" class="btnad">+</a></center><br>
        <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
