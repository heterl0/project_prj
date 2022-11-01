/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
import com.models.Brand;
import com.models.Customer;
import com.models.ProductVolume;
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
public class VolumeDAO {
    Connection conn;
    public VolumeDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(VolumeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VolumeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ProductVolume[] getProductVolumesByProductId(int product_id) {
        ProductVolume[] productVolumes = new ProductVolume[getSize(product_id)];
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Product_Volume where product_id=?");
            pst.setInt(1, product_id);
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()) {
                productVolumes[count++] = new ProductVolume(rs.getInt("product_pcs_left"), rs.getNString("product_price"), rs.getString("product_volume"));
            }            
        } catch (SQLException ex) {
            Logger.getLogger(VolumeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productVolumes;
    }
    
    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Product_Volume");
            while(rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    
    public int getSize(int product_id) {
        int count = 0;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Product_Volume where product_id=?");
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while(rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
