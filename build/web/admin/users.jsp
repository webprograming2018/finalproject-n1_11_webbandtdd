<%-- 
    Document   : index
    Created on : Dec 24, 2018, 12:40:48 PM
    Author     : MinhGiang
--%>

<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
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
        UsersDAO usersDAO = new UsersDAO();
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan;">Users</h2></center>
        <center><table class="products">
            <tr>
                <th>User ID</th><th>User Email</th><th>User Password</th><th></th>
            </tr>
           
                <%
                    for(Users b : usersDAO.getListUser()){
                %>
                 <tr>
                <td><%=b.getUserID()%></td><td><%=b.getUserEmail()%></td>
                <td><%=b.getUserPass()%></td>
                <td><a href="/Shop/admin/uupdate.jsp?userID=<%=b.getUserID()%>" class="btnad">Update</a>
                    <a href="/Shop/AdminServlet?command=udelete&id=<%=b.getUserID()%>" class="btnad" style="background-color: red">Delete</a>
                </td>
                 </tr>
                <%
                    }
                %>
           
            </table></center><br>
            <center><a href="/Shop/admin/uinsert.jsp" class="btnad">+</a></center><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
