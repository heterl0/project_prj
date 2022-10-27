<%-- 
    Document   : product
    Created on : Oct 27, 2022, 5:26:00 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
--%>

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
   <style>
    /*      cart items css*/
    .cart-page{
        margin: 80px auto;
    }
    
    table{
        width: 100%;
        border-collapse: collapse;
    }
    
    .cart-info{
        display: flex;
        flex-wrap: wrap;
    }
    
    th{
        text-align: left;
        padding: 5px;
        color: #fff;
        background: #ff523b;
        font-weight: normal;
    }
    
    td{
        padding: 10px 5px;
    }
    td input{
        width: 40px;
        height: 30px;
        padding: 5px;
    }
    
    .btn-Submit{
        border-radius: 5px;
        width: 200px;
        height: 50px;
        padding: 5;
    }
    
    td a{
        color: #ff523b;
        font-size: 15px;
    }
    
    td img{
        width: 180px;
        height: 180px;
        margin-right: 10px;
    }
    .total-price{
        display: flex;
        justify-content: flex-end;
    }
    
    .total-price table{
        border-top: 3px solid #ff523b;
        width: 100%;
        max-width: 350px;
    }
    
    td:last-child{
        text-align: right;
    }
    
    th:last-child{
        text-align: right;
        
    }
    
    .btn-Submit{
        color: white;
        font-size: 20px;
        background: #ff523b;
    }
    
   </style>
   
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
                     <h3>Cart</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end inner page section -->
      <!-- product section -->
      <section class="product_section layout_padding">
         <div class="container">
             <p align="center" style="color: red;"><strong>Đăng nhập để lưu vỏ hàng!</strong></p>
             
             <div class="small-container cart-page">
                 <table>
                     <tr>
                         <th>Sản Phẩm</th>
                         <th>Số Lượng</th>
                         <th>Giá</th>
                     </tr>
                     <tr>
                         <td>
                             <div class="cart-info">
                                 <img src="Image_Perfume/20614583_1773364176012203_1842498205_n-1-700x850.jpg">
                                 <div>
                                     <p>Versace Eros</p>
                                     <small>Price: 10.000VND</small>
                                     <br>
                                     <a href="#">Remove</a>
                                 </div>
                             </div>
                         </td>
                         
                         <td><input type="number" value="1"></td>
                         <td>10.000VND</td>
                     </tr>
                     <tr>
                         <td>
                             <div class="cart-info">
                                 <img src="Image_Perfume/72582821_2509336859146876_2386418567076642816_n.jpg">
                                 <div>
                                     <p>Versace Eros</p>
                                     <small>Price: 10.000VND</small>
                                     <br>
                                     <a href="#">Remove</a>
                                 </div>
                             </div>
                         </td>
                         
                         <td><input type="number" value="1"></td>
                         <td>10.000VND</td>
                     </tr>
                 </table>
                 <div class="total-price">
                     <table>
                         <tr>
                             <td>Tổng giá</td>
                             <td>20.000VND</td>
                             
                         </tr>
                         
                     </table>
                     <br>
                     <input class="btn-Submit" type="submit" value="Thanh Toán" name="btnSubmit">
                 </div>
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
