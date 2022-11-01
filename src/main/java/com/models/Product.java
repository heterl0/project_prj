/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.models;

/**
 *
 * @author Heterl0
 */
public class Product {
    private int product_id;
    private int brand_id;
    private String product_sex;
    private String product_concentration;
    private String product_release_year;
    private String product_style;
    private String product_origin;
    private String product_founder;
    private int product_sold;
    private String product_main_scent;
    private String product_fragrance_group;
    private String product_name;
    private String product_image[];
    private ProductVolume product_volumes[];

    public Product() {
    }

    public Product(int product_id, int brand_id, String product_sex, String product_concentration, String product_release_year, String product_style, String product_origin, String product_founder, int product_sold, String product_main_scent, String product_fragrance_group, String product_name, String[] product_image, ProductVolume[] product_volumes) {
        this.product_id = product_id;
        this.brand_id = brand_id;
        this.product_sex = product_sex;
        this.product_concentration = product_concentration;
        this.product_release_year = product_release_year;
        this.product_style = product_style;
        this.product_origin = product_origin;
        this.product_founder = product_founder;
        this.product_sold = product_sold;
        this.product_main_scent = product_main_scent;
        this.product_fragrance_group = product_fragrance_group;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_volumes = product_volumes;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public String getProduct_sex() {
        return product_sex;
    }

    public void setProduct_sex(String product_sex) {
        this.product_sex = product_sex;
    }

    public String getProduct_concentration() {
        return product_concentration;
    }

    public void setProduct_concentration(String product_concentration) {
        this.product_concentration = product_concentration;
    }

    public String getProduct_release_year() {
        return product_release_year;
    }

    public void setProduct_release_year(String product_release_year) {
        this.product_release_year = product_release_year;
    }

    public String getProduct_style() {
        return product_style;
    }

    public void setProduct_style(String product_style) {
        this.product_style = product_style;
    }

    public String getProduct_origin() {
        return product_origin;
    }

    public void setProduct_origin(String product_origin) {
        this.product_origin = product_origin;
    }

    public String getProduct_founder() {
        return product_founder;
    }

    public void setProduct_founder(String product_founder) {
        this.product_founder = product_founder;
    }

    public int getProduct_sold() {
        return product_sold;
    }

    public void setProduct_sold(int product_sold) {
        this.product_sold = product_sold;
    }

    public String getProduct_main_scent() {
        return product_main_scent;
    }

    public void setProduct_main_scent(String product_main_scent) {
        this.product_main_scent = product_main_scent;
    }

    public String getProduct_fragrance_group() {
        return product_fragrance_group;
    }

    public void setProduct_fragrance_group(String product_fragrance_group) {
        this.product_fragrance_group = product_fragrance_group;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String[] getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String[] product_image) {
        this.product_image = product_image;
    }

    public ProductVolume[] getProduct_volumes() {
        return product_volumes;
    }

    public void setProduct_volumes(ProductVolume[] product_volumes) {
        this.product_volumes = product_volumes;
    }
    
    
}
