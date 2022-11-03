/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author Heterl0
 */
public class ProductVolume {
    private int product_pcs_left;
    private String product_price;
    private String product_volume;

    public ProductVolume() {
    }

    public ProductVolume(int product_pcs_left, String product_price, String product_volume) {
        this.product_pcs_left = product_pcs_left;
        this.product_price = product_price;
        this.product_volume = product_volume;
    }

    public int getProduct_pcs_left() {
        return product_pcs_left;
    }

    public void setProduct_pcs_left(int product_pcs_left) {
        this.product_pcs_left = product_pcs_left;
    }

    public String getProduct_price() {
        return product_price;
    }

    public void setProduct_price(String product_price) {
        this.product_price = product_price;
    }

    public String getProduct_volume() {
        return product_volume;
    }

    public void setProduct_volume(String product_volume) {
        this.product_volume = product_volume;
    }
    
    
}
