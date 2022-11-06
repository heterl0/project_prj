/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
import com.models.Bill;
import com.models.CartProduct;
import com.models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Heterl0
 */
public class BillDAO {
    Connection conn;
    public BillDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Bill");
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public Bill[] getBillsByCustomerID(int customer_id) {
        Bill[] bill = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Bill where customer_id=?");
            pst.setInt(1, customer_id);
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            bill = new Bill[count];
            rs = pst.executeQuery();
            count = 0;
            ProductDAO productDAO = new ProductDAO();
            Product product = null;
            while(rs.next()) {
                bill[count++] = new Bill(rs.getInt(1), rs.getInt(2),rs.getDate(3), rs.getString(4), rs.getInt(5));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bill;
    }
    
    public int addNew(Bill bill) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Bill values(?,?,?,?,?)");
            pst.setInt(1,bill.getBill_id());
            pst.setInt(2,bill.getCustomer_id());
            pst.setDate(3,bill.getBill_date());
            pst.setString(4, bill.getBill_state());
            pst.setInt(5, bill.getTotal_money());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int updateTotalMoney(int bill_id, int totalMoney) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Update Bill set total_money=? where bill_id=?");
            pst.setInt(1, totalMoney);
            pst.setInt(2, bill_id);
            count = pst.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
//    
//    public boolean cartIsExisted(int customer_id, int product_id, String product_volume) {
//        
//        try {
//            PreparedStatement pst = conn.prepareStatement("Select * from Cart where customer_id=? And product_volume=? And product_id=?");
//            pst.setInt(1, customer_id);
//            pst.setString(2, product_volume);
//            pst.setInt(3, product_id);
//            ResultSet rs = pst.executeQuery();
//            return rs.next();
//        } catch (SQLException ex) {
//            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
//    
//     public int getQuantity(int customer_id, int product_id, String product_volume) {
//        try {
//            PreparedStatement pst = conn.prepareStatement("Select * from Cart where customer_id=? And product_volume=? And product_id=?");
//            pst.setInt(1, customer_id);
//            pst.setString(2, product_volume);
//            pst.setInt(3, product_id);
//            ResultSet rs = pst.executeQuery();
//            rs.next();
//            return rs.getInt("orders_quantity");
//        } catch (SQLException ex) {
//            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 0;
//    }
//    
//    public int delete(int customer_id, int product_id, String product_volume) {
//        int count = 0;
//        try {
//            PreparedStatement pst = conn.prepareStatement("Delete from Cart where customer_id=? And product_volume=? And product_id=?");
//            pst.setInt(1, customer_id);
//            pst.setString(2, product_volume);
//            pst.setInt(3, product_id);
//            count = pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }
//    
//    public int delete(CartProduct cart) {
//        int count = 0;
//        try {
//            PreparedStatement pst = conn.prepareStatement("Delete from Cart where customer_id=? And product_volume=? And product_id=?");
//            pst.setInt(1, cart.getCustomer_id());
//            pst.setString(2, cart.getVolume());
//            pst.setInt(3, cart.getProduct().getProduct_id());
//            count = pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    } 
    
    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Bill");
            while(rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public String formatPrice(int price) {
        DecimalFormat df = new DecimalFormat("###,###");
        return df.format(price);
    }
}
