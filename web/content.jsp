<%-- 
    Document   : products
    Created on : Dec 4, 2018, 10:02:18 AM
    Author     : MinhGiang
--%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Cart"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Content</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%
            ProductDAO productDAO = new ProductDAO();
            Random rand = new Random();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null){
                cart = new Cart();
                session.setAttribute("cart",cart);
            }
        %>
        <div class="wrap">
            <div class="hot">
                <div class="fill" draggable="true" id="keo_hot" ondragstart="dragStart(event);" ondragend="dragEnd(event)" >
                    <div class="products-head">
                      <h4>HOT PRODUCTS</h4>
                    </div>
                    <div class="products" id="HOT">
                        <%
                            for (int i=1;i<9;i++) {
                                int n = rand.nextInt(60)+1;
                                Product p = productDAO.getProduct(n);
                        %>
                            <div class="product">
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
            </div>
            <div class="body-content">
                <%
                    CategoryDAO categoryDAO = new CategoryDAO();
                    for(Category c : categoryDAO.getListCategory()){
                %>
                <div class="block" >
                    <div class="fill" draggable="true" id="keo_iphone" ondragstart="dragStart(event);" ondragend="dragEnd(event)" >
                        <div class="products-head">
                            <a href="product.jsp?category=1" id="headlink">>></a>
                            <div>
                                <h4><%=c.getCategoryName()%></h4>
                            </div>
                        </div>
                        <div class="products">
                            <%
                                int i=0;
                                for(Product p : productDAO.getListProductByCategory(c.getCategoryID())){
                            %>
                                <div class="product">
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
                                    i++;
                                    if(i>=4){
                                        break;
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>