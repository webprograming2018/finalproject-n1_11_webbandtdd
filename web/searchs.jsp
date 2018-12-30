<%-- 
    Document   : searchs
    Created on : Dec 29, 2018, 9:19:39 PM
    Author     : khanh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
       <jsp:include page="header.jsp"></jsp:include>
        <%
             ArrayList<Product> l= (ArrayList) session.getAttribute("item_search");
             if(l.size()!=0){
        %>
        <br><div class="brand" >
            <div class="products-head">
            <center><h4> Các kết quả tìm kiếm</h4></center>
       </div>
            <div class="products">
                 <%
                     for (Product p : l) {
                 %>
                 <div class="brandproduct">
                     <a href="single.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" /></a> 
                      <div class="productname">
                          <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                          <div>
                              <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" id="btnaddtocart">ADD TO CART</a>
                              <p><span>$</span><span><%=p.getProductPrice()%></span></p>
                          </div>
                      </div> 
                 </div>                                  
                 <%
                     }
                     }
    //                 session.removeAttribute("item_search");
                 %>
             </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
