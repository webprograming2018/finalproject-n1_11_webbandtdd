<%-- 
    Document   : single
    Created on : Dec 16, 2018, 3:35:32 PM
    Author     : MinhGiang
--%>
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single</title>
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String productID = "";
            if(request.getParameter("productID")!=null){
                productID = request.getParameter("productID");
                product = productDAO.getProduct(Long.parseLong(productID));
            }
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null){
                cart = new Cart();
                session.setAttribute("cart",cart);
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <h3 class="productheader"><em>Product Detail </em></h3>
        <div id="proDuct">
            <table style="width: 100%;">
                <tr>
                    <td valign="top" style="width: 360px;">
                      <div>
                          <img src="<%=product.getProductImage()%>" alt="">
                      </div>
                    </td>
                    <td valign="top">
                      <div>
                          <h1><%=product.getProductName()%></h1>
                      <div>
                          <a href="CartServlet?command=plus&productID=<%=product.getProductID()%>" class="Buybtn">ADD TO CART</a>
                      </div>
                      <div>
                          <span class="productdes">Price: $<%=product.getProductPrice()%></span>
                      </div>
                      </div>
                    </td>
                    <td valign="top">
                        <center><h4>Similar</h4></center>
                        <div id="singlep">
                        <%
                            for(Product p : productDAO.getListProduct()){
                                if(p.getCategoryID()==product.getCategoryID()){
                        %>
                                    <div id="singlepp">
                                        <a href="single.jsp?productID=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>" /></a> 
                                        <div >
                                            <h5><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                            <div>
                                                <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" id="btnaddtocart">ADD TO CART</a>
                                                <p><span>$</span><span><%=p.getProductPrice()%></span></p>
                                            </div>
                                        </div> 
                                    </div>   
                        <%      }
                            }
                        %>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="product-btn">
            <button  onclick="openDes('gioithieu')"><b>Overview</b></button>
            <button  onclick="openDes('thongso')"><b>Specifications</b></button>
            <button  onclick="openDes('binhluan')"><b>Ratings & Reviews</b></button>
        </div>
        <div id="gioithieu" class="product-body">
            <p><%=product.getProductDescription()%></p>
        </div>
            <div id="thongso" class="product-body" style="display: none">
            </div>
            <div id="binhluan" class="product-body" style="display: none">
                <textarea id="textbinhluan" placeholder="Write your comment..."></textarea>
                <input type="submit" id="buttonbinhluan" value="Comment">
            <div id="binhluantruoc"></div>
            </div><br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>