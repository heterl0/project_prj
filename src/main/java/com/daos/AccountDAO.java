/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.daos;

import com.db.DBConnection;
import com.models.Account;
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
public class AccountDAO {
    Connection conn;
    public AccountDAO() {
        try {
            conn = DBConnection.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Account");
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public Account getStudent(String account_phone) {
        Account account = null;
        try {
            PreparedStatement pst = conn.prepareStatement("Select * from Account where account_phone=?");
            pst.setString(1, account_phone);
            ResultSet rs = pst.executeQuery();
            rs.next();
            account = new Account(rs.getInt(0), rs.getString(1),rs.getString(2),rs.getInt(3));
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    } 
    
    public int addNew(Account account) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Insert into Account values(?,?,?,?)");
            pst.setInt(1, account.getAccount_id());
            pst.setString(2, account.getAccount_phone());
            pst.setString(3, account.getAccount_pass());
            pst.setInt(4, account.getAccount_role());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int update(Account account) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Update Account set account_phone=?, account_pass=?, account_role=? where account_id=?");
            pst.setInt(4, account.getAccount_id());
            pst.setString(1, account.getAccount_phone());
            pst.setString(2, account.getAccount_pass());
            pst.setInt(3, account.getAccount_role());
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int delete(int account_id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Delete from Account where account_id=?");
            pst.setInt(1, account_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
