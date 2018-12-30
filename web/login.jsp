
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
       <link rel="stylesheet" href="style.css">
    </head>
    <body>

        <jsp:include page="header.jsp"></jsp:include>
        <center><h1 style="color:deepskyblue;">LOGIN</h1></center>
        <form class="modal-content" action="UsersServlet" method="post">
            <div class="container">
                <label><b>Email</b></label>
                <input type="text" name="email" placeholder="Enter your email" required>
                <label><b>Password</b></label>
                <input type="password" name="pass" placeholder="Enter password" required>
                <input type="hidden" value="login" name="command">
                <%if(request.getAttribute("error")!=null){%>
                <p style="color: red"><%=request.getAttribute("error")%></p>
                <%}%>
                <input type="submit" id="submit" class="buttonsubmit" value="Login">
            </div>
            <a href="register.jsp" style="margin: 20px;">Don't have any account? Create one!</a>
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
