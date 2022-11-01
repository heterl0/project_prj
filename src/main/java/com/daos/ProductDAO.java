/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
import com.models.Product;
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
public class ProductDAO {

    Connection conn;

    public ProductDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Account");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    public Product getProduct(int product_id) {
        Product product = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Product where product_id=?");
            pst.setInt(1, product_id);
            ResultSet rs = pst.executeQuery();
            rs.next();
            product = new Product(rs.getInt("product_id"), rs.getInt("brand_id"),
                    rs.getNString("product_sex"), rs.getNString("product_concentration"),
                    rs.getString("product_release_year"), rs.getNString("product_style"),
                    rs.getNString("product_origin"), rs.getNString("product_founder"),
                    rs.getInt("product_sold"), rs.getNString("rs.getNString(\"product_origin\")"),
                    rs.getNString("product_fragrance_group"), rs.getNString("product_oname"),
                    getProductImage(product_id), (new VolumeDAO()).getProductVolumesByProductId(product_id));
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public String[] getProductImage(int product_id) {
        String[] productImages = new String[getSizeImage(product_id)];
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Product_Image where product_id=?");
            pst.setInt(1, product_id);
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while (rs.next()) {
                productImages[count++] = rs.getString("product_image_link");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productImages;
    }


//    public int addNew(Account account) {
//        int count = 0;
//        try {
//            PreparedStatement pst = conn.prepareStatement("Insert into Account values(?,?,?,?)");
//            pst.setInt(1, account.getAccount_id());
//            pst.setString(2, account.getAccount_pass());
//            pst.setString(3, account.getAccount_phone());
//            pst.setInt(4, account.getAccount_role());
//            count = pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }

//    public int update(Account account) {
//        int count = 0;
//        try {
//            PreparedStatement pst = conn.prepareStatement("Update Account set account_phone=?, account_pass=?, account_role=? where account_id=?");
//            pst.setInt(4, account.getAccount_id());
//            pst.setString(1, account.getAccount_phone());
//            pst.setString(2, account.getAccount_pass());
//            pst.setInt(3, account.getAccount_role());
//            count = pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }

//    public int delete(int account_id) {
//        int count = 0;
//        try {
//            PreparedStatement pst = conn.prepareStatement("Delete from Account where account_id=?");
//            pst.setInt(1, account_id);
//            count = pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }

    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Account");
            while (rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getSizeImage(int product_id) {
        int count = 0;
        ResultSet rs = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Product_Image where product_id=?");
            pst.setInt(1, product_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
