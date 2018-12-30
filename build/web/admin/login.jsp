<%-- 
    Document   : login
    Created on : Dec 24, 2018, 2:43:37 PM
    Author     : MinhGiang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="adstyle.css">
    </head>
    <body>
        <form action="/Shop/AdminServlet" method="post" class="login">
            <img src="img/lock.png"><h3>Login Administrator</h3>
            <label>Username:</label><br>
            <input type="text" name="username" class="textinput"><br>
            <label>Password:</label><br>
            <input type="password" name="password" class="textinput"><br>
            <%if(request.getAttribute("error")!=null){%>
            <p style="color: red"><%=request.getAttribute("error")%></p>
            <%}%>
            <input type="hidden" value="login" name="command">
            <center><input type="submit" value="Login" class="btnlogin"></center>
        </form>
    </body>
</html>
