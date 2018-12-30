/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import model.Bill;

/**
 *
 * @author MinhGiang
 */
public class BillDAO {
    public void insertBill(Bill bill) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO bill VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1,bill.getBillID());
        ps.setLong(2,bill.getUserID());
        ps.setDouble(3,bill.getTotal());
        ps.setString(4,bill.getPayment());
        ps.setString(5,bill.getAddress());
        ps.setTimestamp(6,bill.getDate());
        ps.executeUpdate();
    }
    public ArrayList<Bill> getListBill() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM bill";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Bill> list = new ArrayList<>();
        while(rs.next()){
            Bill bill = new Bill();
            bill.setBillID(rs.getLong("bill_id"));
            bill.setUserID(rs.getLong("user_id"));
            bill.setTotal(rs.getDouble("total"));
            bill.setPayment(rs.getString("payment"));
            bill.setAddress(rs.getString("address"));
            bill.setDate(rs.getTimestamp("date"));
            list.add(bill);
        }
        return list;
    }
//    public static void main(String[] args) throws SQLException{
//        new BillDAO().insertBill(new Bill(0,0,0,"payment","address", new Timestamp(new Date().getTime())));
//    }
}
