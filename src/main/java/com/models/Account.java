/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author Heterl0
 */
public class Account {
    private int account_id;
    private String account_phone;
    private String account_pass;
    private int account_role;

    public Account() {
    }

    public Account(int account_id, String account_phone, String account_pass, int account_role) {
        this.account_id = account_id;
        this.account_phone = account_phone;
        this.account_pass = account_pass;
        this.account_role = account_role;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getAccount_phone() {
        return account_phone;
    }

    public void setAccount_phone(String account_phone) {
        this.account_phone = account_phone;
    }

    public String getAccount_pass() {
        return account_pass;
    }

    public void setAccount_pass(String account_pass) {
        this.account_pass = account_pass;
    }

    public int getAccount_role() {
        return account_role;
    }

    public void setAccount_role(int account_role) {
        this.account_role = account_role;
    }
    
    
}
