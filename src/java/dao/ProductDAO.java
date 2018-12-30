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
import model.Product;

/**
 *
 * @author MinhGiang
 */
public class ProductDAO {
    public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE category_id = '"+category_id+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while(rs.next()){
            Product product = new Product();
            product.setProductID(rs.getLong("product_id"));
            product.setCategoryID(rs.getLong("category_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getFloat("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            list.add(product);
        }
        return list;
    }
    
    public Product getProduct(long productID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM product WHERE product_id = '"+productID+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while(rs.next()){
            product.setProductID(rs.getLong("product_id"));
            product.setCategoryID(rs.getLong("category_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getDouble("product_price"));
            product.setProductDescription(rs.getString("product_description"));
        }
        return product;
    }
    public ArrayList<Product> getListProduct() throws SQLException{
    Connection connection = DBConnect.getConnection();
    String sql = "SELECT * FROM product";
    PreparedStatement ps = connection.prepareCall(sql);
    ResultSet rs = ps.executeQuery();
    ArrayList<Product> list = new ArrayList<>();
    while(rs.next()){
        Product product = new Product();
        product.setProductID(rs.getLong("product_id"));
        product.setCategoryID(rs.getLong("category_id"));
        product.setProductName(rs.getString("product_name"));
        product.setProductImage(rs.getString("product_image"));
        product.setProductPrice(rs.getDouble("product_price"));
        product.setProductDescription(rs.getString("product_description"));
        list.add(product);
    }
    return list;
    }
    public boolean insertProduct(Product p){
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO product VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1,p.getProductID());
            ps.setLong(2,p.getCategoryID());
            ps.setString(3,p.getProductName());
            ps.setString(4,p.getProductImage());
            ps.setDouble(5,p.getProductPrice());
            ps.setString(6,p.getProductDescription());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            
        }
        return false;
    }
    public boolean updateProduct(Product p) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE product SET category_id = ?,"
                + "product_name = ?, product_image = ?, product_price = ?,"
                + "product_description = ? WHERE product_id = ?";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1,p.getCategoryID());
            ps.setString(2,p.getProductName());
            ps.setString(3,p.getProductImage());
            ps.setDouble(4,p.getProductPrice());
            ps.setString(5,p.getProductDescription());
            ps.setLong(6, p.getProductID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            
        }
        return false;
    }
    public boolean deleteProduct(Product p) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM product WHERE product_id=?";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, p.getProductID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            
        }
        return false;
    }
    //search
    public ArrayList<Product> getSearch(String inputText) throws SQLException{
       ArrayList<Product> list = new ArrayList<>();
       Connection connection = DBConnect.getConnection();
            inputText = inputText.replace("\"", "");
            String sql = "SELECT * FROM product WHERE product_name LIKE '%"+inputText+"%';";
            System.out.println(sql);
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setProductID(rs.getLong("product_id"));
                product.setCategoryID(rs.getLong("category_id"));
                product.setProductName(rs.getString("product_name"));
                product.setProductImage(rs.getString("product_image"));
                product.setProductPrice(rs.getDouble("product_price"));
                product.setProductDescription(rs.getString("product_description"));
                list.add(product);
                
            }
        return list;
    }
}
