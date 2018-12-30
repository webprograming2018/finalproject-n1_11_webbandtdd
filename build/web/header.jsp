<%-- 
    Document   : header
    Created on : Dec 4, 2018, 9:43:22 AM
    Author     : MinhGiang
--%>
<%@page import="model.Cart"%>
<%@page import="model.Users"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE jsp>
<jsp>
    <head>
        <meta http-equiv="Content-Type" content="text/jsp; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
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
       <div class="header">
           <br>
           <ul class="headerlist">
               <%if(users!=null){%>
               <li><b><a class="welcometext" href="#"><%=users.getUserEmail()%></a></b></li>
               <li><form action="UsersServlet" method="post" style="margin-top:-20px;">
                   <input type="submit" id="submit" class="buttonhead" value="Logout">
                   <input type="hidden" value="logout" name="command">
               </form></li>
               <%} else{%>
               <li><a href="login.jsp" class="buttonhead">Login</a></li>
               <%}%>
               <li><a href="cart.jsp" class="buttonhead">Cart(<span><%=cart.countItem()%></span>)</a></li>
           </ul><br><br><br><br>
            <a href="index.jsp" style="color: black">
                <h1>MOBILE E-STORE</h1>         
            </a>
       </div>
        <ul class="nav">
            <%
                for(Category c : categoryDAO.getListCategory()){
            %>
            <li class="nav-item"><a href="product.jsp?category=<%=c.getCategoryID()%>"><img class="img_brand" src="<%=c.getCategoryImg()%>"></a></li>
            <%
                }
            %>
        </ul>
        <%
            int c= request.getRequestURL().indexOf("login");
            int d =request.getRequestURL().indexOf("register");
           if((c<0&&d<0)||(c>0&&d>0)){
        %>
            <div class="mysearch">
                <jsp:include page="search.jsp"></jsp:include>
            </div>
        <% } %>
    </body>
</jsp>