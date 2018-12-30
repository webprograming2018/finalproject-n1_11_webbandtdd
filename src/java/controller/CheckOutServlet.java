/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import createFileInvoice.createFileInvoice;
import dao.BillDAO;
import dao.BillDetailDAO;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;
import model.Users;
import tools.SendMail;


public class CheckOutServlet extends HttpServlet {

    private BillDAO billDAO = new BillDAO();
    private BillDetailDAO billDetailDAO = new BillDetailDAO();
    private createFileInvoice invoice = new createFileInvoice();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Users users = (Users) session.getAttribute("user");
        try{
            Bill bill = new Bill();
            long ID = new Date().getTime();
            bill.setBillID(ID);
            bill.setAddress(address);
            bill.setPayment(payment);
            bill.setUserID(users.getUserID());
            bill.setDate(new Timestamp(new Date().getTime()));
            bill.setTotal(cart.totalCart());
            billDAO.insertBill(bill);
            for(Map.Entry<Long,Item> list : cart.getCartItems().entrySet()){
                BillDetail billdetail = new BillDetail();
                billdetail.setBillID(ID);
                billdetail.setProductID(list.getValue().getProduct().getProductID());
                billdetail.setPrice(list.getValue().getProduct().getProductPrice());
                billdetail.setQuantity(list.getValue().getQuantity());
                billDetailDAO.insertBillDetail(billdetail);
            }
            SendMail sm = new SendMail();
            sm.sendMail(users.getUserEmail(),"[Mobile E-Shop]",
                    "Hello "+users.getUserEmail()+"\n"
                            + "Bill id: "+bill.getBillID()+"\n"
                            + "Your invoice detail:\n"
                            + "\tPayment method: "+bill.getPayment()+"\n"
                            +"\tAddress: "+bill.getAddress()+"\n"
                            +"\tDate: "+bill.getDate()+"\n"
                            +"\tTotal: $"+bill.getTotal()+"\n"
                            +"Thank you for ordering our product, it will be delivered to you soon!");
            sm.sendMail(users.getUserEmail(),"[Mobile E-Shop]",
                    "Hello "+users.getUserEmail()+"\n"
                    + "Bill id: "+bill.getBillID()+"\n"
                    +"Your product has been delivered successfully, please check and take it!");
            cart=new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("bill",bill);
            
            //create file for user download
            ServletContext servletContext = getServletContext();
            String path = servletContext.getRealPath("/invoice/");
            path =path.replace("\\build", "");
            invoice.createHtml(path,bill, users);
            invoice.createPdf(path,bill, users);

        } catch(Exception e){
        }
        response.sendRedirect("/Shop/bill.jsp");
    }

}
