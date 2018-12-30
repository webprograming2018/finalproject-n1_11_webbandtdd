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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Users;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class UsersDAO {
    public boolean emailValidate(String email){
        try {
            InternetAddress internetAddress = new InternetAddress(email);
            internetAddress.validate();
            return true;
        } catch (AddressException e) {
        
        }
        return false;
    }
    
    public boolean checkEmail(String email){
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM users WHERE user_email = '"+email+"'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean insertUser(Users u){
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO users VALUES(?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1,u.getUserEmail());
            ps.setString(2,u.getUserPass());
            ps.setBoolean(3,u.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Users login(String email, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "select * from users where user_email='" + email + "' and user_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setUserID(rs.getLong("user_id"));
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPass(rs.getString("user_pass"));
                u.setUserRole(rs.getBoolean("user_role"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Users> getListUser() throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM users";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Users> list = new ArrayList<>();
        while(rs.next()){
            Users user = new Users();
            user.setUserID(rs.getLong("user_id"));
            user.setUserEmail(rs.getString("user_email"));
            user.setUserPass(rs.getString("user_pass"));
            list.add(user);
        }
        return list;
    }
    public Users getUser(long userID) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM users WHERE user_id = '"+userID+"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Users user = new Users();
        while(rs.next()){
            user.setUserID(rs.getLong("user_id"));
            user.setUserEmail(rs.getString("user_email"));
            user.setUserPass(rs.getString("user_pass"));
        }
        return user;
    }
    public boolean updateUser(Users u) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE users SET user_email = ?, user_pass = ? WHERE user_id = ?";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, u.getUserEmail());
            ps.setString(2, u.getUserPass());
            ps.setLong(3, u.getUserID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean deleteUser(Users u) throws SQLException{
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM users WHERE user_id=?";
        try{
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
