/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UsersDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Product;
import model.Users;

/**
 *
 * @author MinhGiang
 */
public class AdminServlet extends HttpServlet {
    
    UsersDAO usersDAO = new UsersDAO(); 
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO pDAO = new ProductDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        Category category = new Category();
        Product p = new Product();
        switch(command){
            case "udelete":
                users.setUserID(Long.parseLong(request.getParameter("id")));
                {
                    try {
                        usersDAO.deleteUser(users);
                        url="/admin/users.jsp";
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
            case "cdelete":
                category.setCategoryID(Long.parseLong(request.getParameter("id")));
                {
                    try {
                        categoryDAO.deleteCategory(category);
                        url="/admin/category.jsp";
                    } catch (SQLException ex) {
                        
                    }
                }
                break;  
            case "pdelete":
                p.setProductID(Long.parseLong(request.getParameter("id")));
                {
                    try {
                        pDAO.deleteProduct(p);
                        url="/admin/products.jsp";
                    } catch (SQLException ex) {
                        
                    }
                }
                break;  
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request,response);    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        Category category = new Category();
        Product p = new Product();
        switch(command){
            case "login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                HttpSession session = request.getSession();
                if("admin".equals(username) && "admin".equals(password)){
                    session.setAttribute("admin",username);
                    url="/admin";
                }
                else{
                    request.setAttribute("error","Invalid username or password!");
                    url="/admin/login.jsp";
                }
                break;
            case "uinsert":
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter("pass"));
                if(usersDAO.emailValidate(users.getUserEmail())==false){
                    request.setAttribute("error","Email invalid!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/uinsert.jsp");
                    rd.forward(request,response);
                }
                else if((usersDAO.checkEmail(users.getUserEmail()))){
                    request.setAttribute("error","This email has already been used!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/uinsert.jsp");
                    rd.forward(request,response);
                    }
                else {
                    usersDAO.insertUser(users);
                    url="/admin/users.jsp";
                }
                break;
            case "uupdate":
                users.setUserID(Long.parseLong(request.getParameter("userID")));
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter("pass"));
                if(usersDAO.emailValidate(users.getUserEmail())==false){
                    request.setAttribute("error","Email invalid!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/uupdate.jsp?userID="+users.getUserID());
                    rd.forward(request,response);
                }
                else {
                    try {
                        usersDAO.updateUser(users);
                        url="/admin/users.jsp";
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
            case "cinsert":
                category.setCategoryName(request.getParameter("cname"));
                category.setCategoryImg(request.getParameter("cimg"));
                categoryDAO.insertCategory(category);
                url="/admin/category.jsp";
                break;
            case "cupdate":
                category.setCategoryID(Long.parseLong(request.getParameter("categoryID")));
                category.setCategoryName(request.getParameter("cname"));
                category.setCategoryImg(request.getParameter("cimg"));
                    try {
                        categoryDAO.updateCategory(category);
                        url="/admin/category.jsp";
                    } catch (SQLException ex) {
                        
                    }
                break;
            case "pinsert":
                p.setProductID(new Date().getTime());
                p.setCategoryID(Long.parseLong(request.getParameter("categoryid")));
                p.setProductName(request.getParameter("name"));
                p.setProductImage(request.getParameter("img"));
                p.setProductPrice(Double.parseDouble(request.getParameter("price")));
                p.setProductDescription(request.getParameter("des"));
                pDAO.insertProduct(p);
                url="/admin/products.jsp";
                break;
            case "pupdate":
                p.setProductID(Long.parseLong(request.getParameter("productID")));
                p.setCategoryID(Long.parseLong(request.getParameter("categoryid")));
                p.setProductName(request.getParameter("name"));
                p.setProductImage(request.getParameter("img"));
                p.setProductPrice(Double.parseDouble(request.getParameter("price")));
                p.setProductDescription(request.getParameter("des"));
                {
                    try {
                        pDAO.updateProduct(p);
                        url="/admin/products.jsp";
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
        }   
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request,response);
    }
}
