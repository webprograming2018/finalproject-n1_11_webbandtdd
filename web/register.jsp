

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="style.css">
<script src="js/jquery.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <center><h1 style="color:deepskyblue;">REGISTER</h1></center>
        <form class="modal-content" action="UsersServlet" method="post">
            <div class="container">
                <label><b>Email </b></label>
                <input type="text" name="email" id="email" placeholder="Enter your email" required>
                <label><b>Password</b></label>
                <input type="password" name="pass" placeholder="Enter password" required>
                <label><b>Confirm Password</b></label>
                <input type="password" name="passcf" placeholder="Enter password again" required>
                <%if(request.getAttribute("error1")!=null){%>
                <p style="color: red"><%=request.getAttribute("error1")%></p>
                <%}%>
                <input type="hidden" value="insert" name="command">
                <input type="submit" id="submit" class="buttonsubmit" value="Register">
            </div>
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
