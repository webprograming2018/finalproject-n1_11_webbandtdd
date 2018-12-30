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
import java.util.ArrayList;
import model.BillDetail;

/**
 *
 * @author MinhGiang
 */
public class BillDetailDAO {
    public void insertBillDetail(BillDetail bd) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO bill_detail VALUES(?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1,bd.getBillID());
        ps.setLong(2,bd.getProductID());
        ps.setDouble(3,bd.getPrice());
        ps.setInt(4,bd.getQuantity());
        ps.executeUpdate();
    }
    
    public ArrayList<BillDetail> getListBillDetailByBill(long bill_id) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM bill_detail WHERE bill_id = '"+bill_id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<BillDetail> list = new ArrayList<>();
        while(rs.next()){
            BillDetail billdetail = new BillDetail();
            billdetail.setBillDetailID(rs.getLong("bill_detail_id"));
            billdetail.setBillID(rs.getLong("bill_id"));
            billdetail.setProductID(rs.getLong("product_id"));
            billdetail.setPrice(rs.getDouble("price"));
            billdetail.setQuantity(rs.getInt("quantity"));
            list.add(billdetail);
        }
        return list;
    }
    public ArrayList<BillDetail> getListBillDetail() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM bill_detail";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<BillDetail> list = new ArrayList<>();
        while(rs.next()){
            BillDetail billdetail = new BillDetail();
            billdetail.setBillDetailID(rs.getLong("bill_detail_id"));
            billdetail.setBillID(rs.getLong("bill_id"));
            billdetail.setProductID(rs.getLong("product_id"));
            billdetail.setPrice(rs.getDouble("price"));
            billdetail.setQuantity(rs.getInt("quantity"));
            list.add(billdetail);
        }
        return list;
    }
//    public static void main(String[] args) throws SQLException{
//        new BillDetailDAO().insertBillDetail(new BillDetail(0,0,0,0));
//    }
}
