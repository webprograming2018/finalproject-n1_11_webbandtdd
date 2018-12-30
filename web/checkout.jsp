<%-- 
    Document   : checkout
    Created on : Dec 20, 2018, 1:14:28 PM
    Author     : MinhGiang
--%>

<%@page import="model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
    <%
        Users users = (Users) session.getAttribute("user");
        if(users==null){
            response.sendRedirect("/Shop/login.jsp");
        }
    %>
    <jsp:include page="header.jsp"></jsp:include>
    <center><h1 style="color:deepskyblue;">CHECK OUT</h1></center>
    <form class="modal-content" action="CheckOutServlet" method="post">
            <div class="container">
                <label><b>Address:</b></label>
                <input type="text" name="address" placeholder="Enter your address" required>
                <label><b>Payment:</b></label>
                <select name="payment">
                    <option value="Bank transfer">Bank transfer</option>
                    <option value="Live">Live</option>
                </select><br><br>
                <input type="submit" id="submit" class="buttonsubmit" value="Check out">
            </div>
    </form>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
