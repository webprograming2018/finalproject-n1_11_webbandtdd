<%-- 
    Document   : index
    Created on : Dec 24, 2018, 12:40:48 PM
    Author     : MinhGiang
--%>

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
            if(session.getAttribute("admin")==null){
                response.sendRedirect("/Shop/admin/login.jsp");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <jsp:include page="content.jsp"></jsp:include>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
