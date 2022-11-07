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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author Heterl0
 */
public class ProductDAO {

    private Product[] products;

    public Product[] getProducts() {
        return products;
    }
    
    Connection conn;

    public ProductDAO() {
        try {
            conn = DBConnection.getConnection();
            products = getAllProducts();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Product[] getProductsWithKeyword(String keyword) {
        ArrayList<Product> arr = new ArrayList<>();
        for (Product product : products) {
            if (product.getProduct_name().toLowerCase().contains(keyword.toLowerCase())) {
                arr.add(product);
            }
        }
        Product[] pdts = new Product[arr.size()];
        for (int i = 0; i < arr.size();i++) {
            pdts[i] = arr.get(i);
        }
        return pdts;
    }
    
    public Product[] getAllProducts() {
        Product[] products = new Product[getSize()];
        ResultSet rs = getAll();
        int count = 0;
        try {
            while (rs.next()) {
                products[count++] = getProduct(rs.getInt("product_id"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ResultSet getAll() {
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Product");
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
                    rs.getInt("product_sold"), rs.getNString("product_main_scent"),
                    rs.getNString("product_fragrance_group"), rs.getNString("product_name"),
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

    public int delete(int product_id) {
        int count = 0;
        try {
            PreparedStatement pst = conn.prepareStatement("Delete from Product_Image where product_id=?");
            pst.setInt(1, product_id);
            count = pst.executeUpdate();
            pst = conn.prepareStatement("Delete from Product_Volume where product_id=?");
            pst.setInt(1, product_id);
            count = pst.executeUpdate();
            pst = conn.prepareStatement("Delete from Cart where product_id=?");
            pst.setInt(1, product_id);
            count = pst.executeUpdate();
            pst = conn.prepareStatement("Delete from Orders where product_id=?");
            pst.setInt(1, product_id);
            count = pst.executeUpdate();
            pst = conn.prepareStatement("Delete from Product where product_id=?");
            pst.setInt(1, product_id);
            count = pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getSize() {
        int count = 0;
        ResultSet rs = null;
        try {
            Statement st = conn.createStatement();
            rs = st.executeQuery("Select * from Product");
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
    
    public Product[] getProductOrderByReleaseYear() {
        Product[] products = this.products;
        Arrays.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return   Integer.parseInt(o2.getProduct_release_year()) - Integer.parseInt(o1.getProduct_release_year()); 
            }
        });
        return products;
    }
    
    public Product[] getProductOrderByPriceToHigh() {
        Product[] products = this.products;
        Arrays.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                ProductVolume[] pv1 = o1.getProduct_volumes();
                ProductVolume[] pv2 = o2.getProduct_volumes();
                return Integer.parseInt(getIntString(pv1[0].getProduct_price())) - Integer.parseInt(getIntString(pv2[0].getProduct_price().replaceAll("[.]", ""))); 
            }
        });
        return products;
    }
    
     public Product[] getProductOrderByPriceToLow() {
        Product[] products = this.products;
        Arrays.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                ProductVolume[] pv1 = o1.getProduct_volumes();
                ProductVolume[] pv2 = o2.getProduct_volumes();
                return 0 - Integer.parseInt(getIntString(pv1[0].getProduct_price())) + Integer.parseInt(getIntString(pv2[0].getProduct_price().replaceAll("[.]", ""))); 
            }
        });
        return products;
    }
    
    private String getIntString(String value) {
        String s = "";
        for (Character c : value.toCharArray()) {
            if (c >= '0' && c <= '9') {
                s += c;
            }
        }
        return s;
    }
    
    public Product[] getProductOrderByMostSold() {
        Product[] products = this.products;
        Arrays.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return  o2.getProduct_sold() - o1.getProduct_sold(); 
            }
        });
        return products;
    }
    
    public Product[] getProductOrderByAToZ() {
        Product[] products = this.products;
        Arrays.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return  o1.getProduct_name().compareTo(o2.getProduct_name()); 
            }
        });
        return products;
    }
    
    public Product[] getProductOrderByZToA() {
        Product[] products = this.products;
        Arrays.sort(products, new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return  o2.getProduct_name().compareTo(o1.getProduct_name()); 
            }
        });
        return products;
    }
    
    public Product[] getProductsByBrandID(int brand_id) {
        ArrayList<Product> products = new ArrayList<>();
        for (Product product : this.products) {
            if (product.getBrand_id() == brand_id) {
                products.add(product);
            }
        }
        Product[] pds = new Product[products.size()];
        for (int i = 0; i < products.size(); i++) {
            pds[i] = products.get(i);
        }
        return pds;
    }
}
