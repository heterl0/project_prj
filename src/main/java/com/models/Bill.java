/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

import java.sql.Date;

/**
 *
 * @author Heterl0
 */
public class Bill {
    private int bill_id;
    private int customer_id;
    private Date bill_date;
    private String bill_state;
    private int total_money;

    public Bill() {
    }

    public Bill(int bill_id, int customer_id, Date bill_date, String bill_state, int total_money) {
        this.bill_id = bill_id;
        this.customer_id = customer_id;
        this.bill_date = bill_date;
        this.bill_state = bill_state;
        this.total_money = total_money;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Date getBill_date() {
        return bill_date;
    }

    public void setBill_date(Date bill_date) {
        this.bill_date = bill_date;
    }

    public String getBill_state() {
        return bill_state;
    }

    public void setBill_state(String bill_state) {
        this.bill_state = bill_state;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }
    
    
}
