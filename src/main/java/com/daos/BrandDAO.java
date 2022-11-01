/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
import com.models.Brand;
import com.models.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Heterl0
 */
public class BrandDAO {
    Connection conn;
    public BrandDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Brand");
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public Customer getBrandById(int brand_id) {
        Customer customer = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Brand where brand_id=?");
            pst.setInt(1, brand_id);
            ResultSet rs = pst.executeQuery();
            rs.next();
            Brand brand = new Brand(rs.getInt("brand_id"), "brand_name");
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    } 
    
    
    public int addNew(Brand brand) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Brand values(?,?)");
            pst.setInt(1, brand.getBrand_id());
            pst.setString(2, brand.toString());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int update(Brand brand) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Update Brand set brand_name=? where brand_id=?");
            pst.setInt(2,  brand.getBrand_id());
            pst.setString(1,  brand.getBrand_name());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int delete(int brand_id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Delete from Brand where brand_id=?");
            pst.setInt(1, brand_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Brand");
            while(rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
