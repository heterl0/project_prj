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
      <% 
          int brand_id = 0;
          String brand_name = "";
          if (request.getParameter("brand_id") == null) {
            response.sendRedirect("index.jsp");
          } else {
            brand_id = Integer.parseInt(request.getParameter("brand_id"));
            brand_name = (new BrandDAO()).getBrandName(brand_id);
          }
      %>
      <section class="inner_page_head">
         <div class="container_fuild">
            <div class="row">
               <div class="col-md-12">
                  <div class="full">
                     <h3>Nước hoa của <%= brand_name %></h3>
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
                  <span>Sản phẩm</span>
               </h2>
            </div>
            <div class="row">
               <%
                  ProductDAO pdao = new ProductDAO();
                   Product[] products = pdao.getProductsByBrandID(brand_id);
                   for (Product product: products) {
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
