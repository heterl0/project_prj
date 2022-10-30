/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
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
public class CustomerDAO {
    Connection conn;
    public CustomerDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Customer");
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public Customer getCustomerById(int customer_id) {
        Customer customer = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Customer where customer_id=?");
            pst.setInt(1, customer_id);
            ResultSet rs = pst.executeQuery();
            rs.next();
            customer = new Customer(rs.getInt("customer_id"), rs.getInt("account_id"),
                    rs.getString("account_fullName"),rs.getString("account_email"), 
                    rs.getString("account_address"));
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    } 
    
    public Customer getCustomerByAccountID(int account_id) {
        Customer customer = null;
        try {
            PreparedStatement pst = conn.prepareStatement("select * from Customer where account_id=?");
            pst.setInt(1, account_id);
            ResultSet rs = pst.executeQuery();
            rs.next();
            customer = new Customer(rs.getInt("customer_id"), rs.getInt("account_id"),
                    rs.getString("customer_fullName"),rs.getString("customer_email"), 
                    rs.getString("customer_address"));
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    } 
    
    public int addNew(Customer customer) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Customer values(?,?,?,?,?)");
            pst.setInt(1, customer.getCustomer_id());
            pst.setString(2, customer.getCustomer_address());
            pst.setString(3, customer.getCustomer_email());
            pst.setString(4, customer.getCustomer_name());
            pst.setInt(5, customer.getAccount_id());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int update(Customer customer) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Update Customer set customer_address=?, customer_email=?, customer_name=?, account_id=? where customer_id=?");
            pst.setInt(5, customer.getCustomer_id());
            pst.setString(1, customer.getCustomer_address());
            pst.setString(2, customer.getCustomer_email());
            pst.setString(3, customer.getCustomer_name());
            pst.setInt(4, customer.getAccount_id());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int delete(int customer_id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Delete from Customer where customer_id=?");
            pst.setInt(1, customer_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Customer");
            while(rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
