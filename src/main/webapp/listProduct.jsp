<%-- 
    Document   : list
    Created on : Nov 1, 2022, 1:58:12 PM
    Author     : LeThiThuyVy_CE160174
--%>

<%@page import="com.models.ProductVolume"%>
<%@page import="com.models.Product"%>
<%@page import="com.daos.ProductDAO"%>
<%@page import="com.daos.CustomerDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.daos.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="Assest/Logo.png" type="">
        <title>Sawer - Website bán nước hoa hàng đầu</title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
    </head>
    <body>
         <div class="hero_area">
         <!-- header section strats -->
         <%@include file="header.jsp" %>
         <!-- end header section -->
        
        <div class="container"> 
            <h1 align="center">Customer and Account Management</h1>
            <table class="table table-striped" border="1">
                <thead>
                    <tr>
                        <th scope="col">Product ID</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Release Year</th> 
                        <th scope="col">Origin</th>
                        <th scope="col">Sex</th>
                        <th scope="col">Style</th>
                        <th scope="col">Number Sold</th>
                        <th scope="col">Volume</th>
                        <th scope="col">Price</th>
                        <th scope="col">Left Product</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <%                    
                    
                    ProductDAO dao = new ProductDAO();
                    Product[] products = dao.getAllProducts();
                    BrandDAO bdao = new BrandDAO();
                    for (Product product : products) {
                        ProductVolume[] volumes = product.getProduct_volumes();

                %>
                <tr>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_id()%></td>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_name()%></td>
                    <td rowspan="<%= volumes.length%>"><%= bdao.getBrandName(product.getBrand_id())%></td>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_release_year()%></td>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_origin()%></td>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_sex()%></td>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_style()%></td>
                    <td rowspan="<%= volumes.length%>"><%= product.getProduct_sold()%></td>

                    <td><%= volumes[0].getProduct_volume()%></td>
                    <td><%= volumes[0].getProduct_price()%></td>
                    <td><%= volumes[0].getProduct_pcs_left()%></td>
                    <td rowspan="<%= volumes.length%>"
                        <a onclick="return confirm('Are you sure?');" href="/AccountServlet/DeleteProduct/<%= product.getProduct_id() %>" class="btn btn-danger" role="button">Delete</a>
                    </td>
                </tr>
                <% if (volumes.length > 1) {
                        for (int i = 1; i < volumes.length; i++) {
                %>
                <tr>
                    <td><%= volumes[i].getProduct_volume()%></td>
                    <td><%= volumes[i].getProduct_price()%></td>c
                    <td><%= volumes[i].getProduct_pcs_left()%></td>
                </tr>


                <%
                            }
                        }
                    }
                %>
            </table>
        </div>
        <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
