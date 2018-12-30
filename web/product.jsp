<%-- 
    Document   : product
    Created on : Dec 10, 2018, 11:14:45 AM
    Author     : MinhGiang
--%>

<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <%
                ProductDAO productDAO = new ProductDAO();
                CategoryDAO categoryDAO = new CategoryDAO();
                Category category = new Category();
                String category_id = "";
                if(request.getParameter("category")!=null){
                    category_id = request.getParameter("category");
                }
                category = categoryDAO.getCategory(Long.parseLong(category_id));
                Cart cart = (Cart) session.getAttribute("cart");
                if(cart == null){
                    cart = new Cart();
                    session.setAttribute("cart",cart);
                }
            %>
        <br><div class="brand">
          <div class="products-head">
            <center><h3><%=category.getCategoryName()%></h3></center>
            </div>
            <div class="products">
                <%
                    for (Product p : productDAO.getListProductByCategory(Long.parseLong(category_id))) {
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
                %>
            </div>
        </div>
    <br><br><br>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>