<%-- 
    Document   : uinsert
    Created on : Dec 29, 2018, 10:25:41 AM
    Author     : MinhGiang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert User</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h2 style="color:darkcyan">Insert User</h2></center>
        <form class="formadd" action="/Shop/AdminServlet" method="post">
            <label>Email:</label>
            <input type="text" name="email">
            <label>Password:</label>
            <input type="password" name="pass">
            <%if(request.getAttribute("error")!=null){%>
            <p style="color: red"><%=request.getAttribute("error")%></p>
            <%}%>
            <input type="hidden" value="uinsert" name="command">
            <input type="submit" value="Insert" id="btn"> 
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
