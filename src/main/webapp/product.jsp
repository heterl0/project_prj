<%-- 
    Document   : product
    Created on : Oct 27, 2022, 5:26:00 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
--%>

<%@page import="com.models.ProductVolume"%>
<%@page import="com.models.Product"%>
<%@page import="com.daos.ProductDAO"%>
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
        <title>Famms - Fashion HTML Template</title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
    </head>
    <body class="sub_page">
        <div class="hero_area">
            <!-- header section strats -->
            <%@include file="header.jsp" %>
            <!-- end header section -->
        </div>
        <!-- inner page section -->
        <section class="inner_page_head">
            <div class="container_fuild">
                <div class="row">
                    <div class="col-md-12">
                        <div class="full">
                            <h3>Tất cả sản phẩm</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end inner page section -->
        <!-- product section -->
        <section class="product_section layout_padding">
            <div class="container">
                <div class="heading_container heading_center">
                    <h2>
                        Nước hoa <span>của chúng tôi</span>
                    </h2>
                </div>
                <a class="btn btn-primary dropdown-toggle mr-4" type="button" data-toggle="dropdown" aria-haspopup="true"
                   aria-expanded="false">Sắp xếp</a>

                <div class="dropdown-menu">
                    <a class="dropdown-item" href="product.jsp?sortby=a_z">A-Z</a>
                    <a class="dropdown-item" href="product.jsp?sortby=z_a">Z-A</a>
                    <a class="dropdown-item" href="product.jsp?sortby=low_price">Giá từ thấp tới cao</a>
                    <a class="dropdown-item" href="product.jsp?sortby=high_price">Giá từ cao tới thấp</a>
                    <a class="dropdown-item" href="product.jsp?sortby=most_sold">Nhiều người mua</a>
                </div>
                <div class="row">
                    <%  
                        ProductDAO pdao = new ProductDAO();
                        Product[] products = pdao.getAllProducts();
                        if (request.getParameter("sortby") != null) {
                            switch(request.getParameter("sortby")) {
                                case "a_z":
                                    products = pdao.getProductOrderByAToZ();
                                    break;
                                case "z_a":
                                    products = pdao.getProductOrderByZToA();
                                    break;
                                case "low_price":
                                    products = pdao.getProductOrderByPriceToHigh();
                                    break;
                                case "high_price":
                                    products = pdao.getProductOrderByPriceToLow();
                                    break;    
                            }
                        }
                        for (Product product : products) {
                            ProductVolume[] volumes = product.getProduct_volumes();

                    %>
                    <div class="col-sm-6 col-md-4 col-lg-3">
                        <div class="box">
                            <div class="option_container">
                                <div class="options">
                                    <a href="#" class="option1">
                                        Thêm vào giỏ
                                    </a>
                                    <a href="productdetail.jsp?product_id=<%= product.getProduct_id()%>" class="option2">
                                        Xem chi tiết
                                    </a>
                                </div>
                            </div>
                            <div class="img-box">
                                <img src="<%= product.getProduct_image()[0]%>" alt="">
                            </div>
                            <div class="">
                                <h5>
                                    <%= product.getProduct_name()%>
                                </h5>
                                <h6 style="color:red">
                                    <%= volumes[0].getProduct_price()%> đ
                                    -
                                    <%= volumes[volumes.length - 1].getProduct_price()%> đ
                                </h6>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>  
                </div>
            </div>
        </section>
        <!-- end product section -->
        <!-- footer section -->
        <%@include file="footer.jsp" %>
        <!-- footer section -->
        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>
</html>
