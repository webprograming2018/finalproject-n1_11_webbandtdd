<%-- 
    Document   : cart
    Created on : Dec 2, 2018, 9:01:49 PM
    Author     : MinhGiang
--%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="style.css">
    </head>
    <body>
    <%
        Users users = null;
        if(session.getAttribute("user")!=null){
            users = (Users) session.getAttribute("user");
        }
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null){
            cart = new Cart();
            session.setAttribute("cart",cart);
        }
    %>
    <jsp:include page="header.jsp"></jsp:include>
    <center><h1 style="color:darkcyan">Shopping Cart</h1></center>
    <div class="cart">
    <center><table class="carttb">
        <tr>
            <th style="width: 160px">Image</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th></th>
        </tr>
        <%for(Map.Entry<Long,Item> list:cart.getCartItems().entrySet()){%>
        <tr>
            <td><a href="single.jsp?productID=<%=list.getValue().getProduct().getProductID()%>"><img src="<%=list.getValue().getProduct().getProductImage()%>"</a></td>
            <td><a href="single.jsp?productID=<%=list.getValue().getProduct().getProductID()%>"><p><%=list.getValue().getProduct().getProductName()%></p></a></td>
            <td>
                <a href="CartServlet?command=plus&productID=<%=list.getValue().getProduct().getProductID()%>" class="btnquan">+</a>
                <p><%=list.getValue().getQuantity()%></p>
                <a href="CartServlet?command=sub&productID=<%=list.getValue().getProduct().getProductID()%>" class="btnquan">-</a>
            </td>
            <td><p>$<%=list.getValue().getProduct().getProductPrice()%></p></td>
            <td><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>" class="cartx">X</a></td>
        </tr>
        <%}%>
        <tr>
            <td colspan="5">
                <h4 class="carttt">Total: $<%=cart.totalCart()%></h4>
                <a href="checkout.jsp" class="cartcheck">Check out</a>
            </td>
        </tr>
    </table></center><br>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
