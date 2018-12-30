/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author MinhGiang
 */
public class UsersServlet extends HttpServlet {
    
    UsersDAO usersDAO = new UsersDAO();    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch(command){
            case "insert":
                users.setUserEmail(request.getParameter("email"));
                users.setUserPass(request.getParameter("pass"));
                String passcf = request.getParameter("passcf");
                users.setUserRole(false);
                if(usersDAO.emailValidate(users.getUserEmail())==false){
                    request.setAttribute("error1","Email invalid!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                    rd.forward(request,response);
                }
                else if((usersDAO.checkEmail(users.getUserEmail()))){
                    request.setAttribute("error1","This email has already been used!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                    rd.forward(request,response);
                    }
                else if(passcf!=users.getUserPass()){
                    request.setAttribute("error1","Invalid password confirmation!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/register.jsp");
                    rd.forward(request,response);
                }
                else {
                    usersDAO.insertUser(users);
                    session.setAttribute("user",users);
                    url="/index.jsp";
                }
                break;
            case "login":
                users = usersDAO.login(request.getParameter("email"),request.getParameter("pass"));
                if(users!=null){
                    session.setAttribute("user",users);
                    url="/index.jsp";
                } else{
                    request.setAttribute("error","Invalid email or password!");
                    url="/login.jsp";
                }
                break;
            case "logout":
                session.removeAttribute("user");
                url="/index.jsp";
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request,response);
    }
}
