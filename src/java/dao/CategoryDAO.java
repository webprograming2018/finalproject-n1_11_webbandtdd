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
import model.Category;

/**
 *
 * @author MinhGiang
 */
public class CategoryDAO {
    public ArrayList<Category> getListCategory() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while(rs.next()){
            Category category = new Category();
            category.setCategoryID(rs.getLong("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            category.setCategoryImg(rs.getString("category_img"));
            list.add(category);
        }
        return list;
    }
    public Category getCategory(long categoryID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM category WHERE category_id = '"+categoryID+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Category category = new Category();
        while(rs.next()){
            category.setCategoryID(rs.getLong("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            category.setCategoryImg(rs.getString("category_img"));
        }
        return category;
    }
    public boolean insertCategory(Category c){
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO category VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1,c.getCategoryName());
            ps.setString(2,c.getCategoryImg());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            
        }
        return false;
    }
    public boolean updateCategory(Category c) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE category SET category_name = ?, category_img = ? WHERE category_id = ?";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setString(2, c.getCategoryImg());
            ps.setLong(3, c.getCategoryID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            
        }
        return false;
    }
    public boolean deleteCategory(Category u) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM category WHERE category_id=?";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getCategoryID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            
        }
        return false;
    }
}
