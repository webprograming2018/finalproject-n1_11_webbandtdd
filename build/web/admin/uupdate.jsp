<%-- 
    Document   : uinsert
    Created on : Dec 29, 2018, 10:25:41 AM
    Author     : MinhGiang
--%>

<%@page import="dao.UsersDAO"%>
<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <%
            String userId = request.getParameter("userID");
            UsersDAO uDAO = new UsersDAO();
            Users u = new Users();
            u = uDAO.getUser(Long.parseLong(userId));
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan">Update User</h2></center>
        <form class="formadd" action="/Shop/AdminServlet" method="post">
            <input type="hidden" name="userID" value="<%=u.getUserID()%>">
            <label>Email:</label>
            <input type="text" name="email" value="<%=u.getUserEmail()%>">
            <label>Password:</label>
            <input type="password" name="pass" value="<%=u.getUserPass()%>">
            <%if(request.getAttribute("error")!=null){%>
            <p style="color: red"><%=request.getAttribute("error")%></p>
            <%}%>
            <input type="hidden" value="uupdate" name="command">
            <input type="submit" value="Update" id="btn"> 
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
