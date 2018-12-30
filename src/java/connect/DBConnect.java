/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author MinhGiang
 */
public class DBConnect {
    
    public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost;databasename=OnlineShopDb;username=sa;password=sa");
        } catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
//    public static void main(String[] args){
//        System.out.println(getConnection());
//    }
}
