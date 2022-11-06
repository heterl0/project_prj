/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
import com.models.CartProduct;
import com.models.Order;
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
public class OrderDAO {
    Connection conn;
    public OrderDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Orders");
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public Order[] getOrderByBillID(int bill_id) {
        Order[] orders = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Orders where bill_id=?");
            pst.setInt(1, bill_id);
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while (rs.next()) {
                count++;
            }
            orders = new Order[count];
            rs = pst.executeQuery();
            count = 0;
            ProductDAO productDAO = new ProductDAO();
            Product product = null;
            while(rs.next()) {
                product = productDAO.getProduct(rs.getInt("product_id"));
                orders[count++] = new Order(product, rs.getInt("bill_id"), rs.getInt("orders_quantity"), rs.getString("product_volume"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
    public int addNew(Order order) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Orders values(?,?,?,?)");
            pst.setInt(1,order.getBill_id());
            pst.setInt(2,order.getProduct().getProduct_id());
            pst.setString(3, order.getVolume());
            pst.setInt(4, order.getQuantity());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
//    public int updateQuatity(CartProduct cart, int quantity) {
//        int count = 0;
//        if (quantity == 0) {
//            delete(cart.getCustomer_id(), cart.getProduct().getProduct_id(), cart.getVolume());
//        } 
//        try {
//            PreparedStatement pst = conn.prepareStatement("Update Cart set orders_quantity=? where customer_id=? And product_volume=? And product_id=?");
//            pst.setInt(1, quantity);
//            pst.setInt(2, cart.getCustomer_id());
//            pst.setString(3, cart.getVolume());
//            pst.setInt(4, cart.getProduct().getProduct_id());
//            count = pst.executeUpdate();
//            
//        } catch (SQLException ex) {
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }
    
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
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
    
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
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return 0;
//    }
    
    public int delete(int bill_id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Delete from Orders where bill_id=?");
            pst.setInt(1, bill_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
//    public int delete(CartProduct cart) {
//        int count = 0;
//        try {
//            PreparedStatement pst = conn.prepareStatement("Delete from Cart where customer_id=? And product_volume=? And product_id=?");
//            pst.setInt(1, cart.getCustomer_id());
//            pst.setString(2, cart.getVolume());
//            pst.setInt(3, cart.getProduct().getProduct_id());
//            count = pst.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return count;
//    }
    
    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Orders");
            while(rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public String formatPrice(int price) {
        DecimalFormat df = new DecimalFormat("###,###");
        return df.format(price);
    }
}
