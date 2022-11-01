<%-- 
    Document   : product
    Created on : Oct 27, 2022, 5:26:00 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
--%>

<%@page import="com.daos.ProductDAO"%>
<%@page import="com.models.Product"%>
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
       /* product detail CSS */
       
       *{
           margin: 0;
           padding: 0;
       }
       
       .flex-box{
           display: flex;
           width: 1000px;
           margin:20px auto;
       }
       
       .left{
           width: 40%;
       }
       
       .big-img{
           width: 300px;
           
       }
       
       .big-img img{
           width: inherit;
           border-radius: 5px;
       }
       
       .images{
           display: flex;
           justify-content: space-between;
           width: 60%;
           margin-top: 15px;
           /* margin-left: 5px; */
       }
       
       .small-img{
            box-sizing: content-box;
           width: 50px;
           height: 50px;
           /* overflow-block: hidden; */
           border: 1px solid;
           transition: all 0.3s ease;
           
       }
       
       .small-img img{
           width: inherit;
           height: inherit;
           cursor: pointer;
           transition: all 0.3s ease;
       }
       

       .small-img:hover img{
           transform:  scale(1.2);
       }
       
       .url{
        font-size: 16px;
        font-weight: 400;
        color: red;
       }

       .pname{
        font-size: 22px;
        font-weight: 600;
        margin-top: 50px;
       }

       .ratings i{
        color: red;
       }

       .price{
        font-size: 20px;
        font-weight: 500;
        margin: 20px 0  ;
       }

       .size{
        display: flex;
        align-items: center;
        margin: 20px 0;
       }

       .size p{
            font-size: 18px;
            font-weight: 500;
       }

       .quantity{
        display: flex;
     }

     .quantity p{
        font-size: 17px;
        font-weight: 500;
     }

     .quantity input{
        width: 40px;
        font-size: 17px;
        font-weight: 500;
        text-align: center;
        margin-left: 15px;
     }
     
     .btn-box{
        display: flex;
        margin-top: 40px;
     }

     .btn-box button{
        font-size: 18px;
        padding: 8px 25px;
        border: none;
        outline: none;
        border-radius: 6px;
        cursor: pointer;
        color: white;
     }

     .cart-btn{
        background-color: #ff5e00;
        margin-right: 20px;
     }

     .buy-btn{
        background-color: #00aaff;
     }

     .cart-btn:hover{
        background-color: #ff3c00;
     }

     .buy-btn:hover{
        background-color: #0066ff;
     }

   </style>
   
   <body class="sub_page">
       <% 
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProduct(product_id);
            String[] productImages = productDAO.getProductImage(product_id);
       %>
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
                     <h3>Product detail</h3>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end inner page section -->
      <!-- product section -->
      <section class="product_section layout_padding">
         <div class="container">
             <div class="flex-box">
                 <div class="left" >
                     <div class="big-img">
                         <img src="<%= productImages[0] %>">
                     </div>
                         <div class="images">
                             <% for (String imageLink : productImages) {
                             %>
                             <div class="small-img">
                                 <img src="<%= imageLink%>" onclick="showImg(this.src)">
                             </div>
                             <% }
                             %>
                         </div>
                 </div>

                 <div class="right">
                    <div class="url">Product > Perfume</div>
                    <div class="pname">Dior Versace Elixir Orchard</div>
                    <div class="price">10.000VND</div>
                    <div class="quantity">
                        <p>Quantity :</p>
                        <input type="number" min="1" max="5" value="1">
                    </div>
                    <div class="btn-box">
                        <button class="cart-btn">Thêm vào vỏ hàng</button>
                        <button class="buy-btn">Mua ngay</button>
                    </div>

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
      <script>
        let bigImg = document.querySelector('.big-img img');
        function showImg(pic) {
            bigImg.src = pic;   
          }
      </script>
   </body>
</html>
