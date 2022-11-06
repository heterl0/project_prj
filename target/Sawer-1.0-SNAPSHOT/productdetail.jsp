<%-- Document : product Created on : Oct 27, 2022, 5:26:00 PM Author : Nguyen Truong Quoc Duy Ce160380 --%>

    <%@page import="com.daos.VolumeDAO" %>
        <%@page import="com.models.ProductVolume" %>
            <%@page import="com.daos.ProductDAO" %>
                <%@page import="com.models.Product" %>
                    <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                        <style>
                            /* product detail CSS */

                            * {
                                margin: 0;
                                padding: 0;
                            }

                            .flex-box {
                                display: flex;
                                width: 1000px;
                                margin: 20px auto;
                            }

                            .left {
                                width: 40%;
                            }

                            .big-img {
                                width: 400px;
                                height: 400px;

                            }

                            .big-img img {
                                width: inherit;
                                height: inherit;
                                border-radius: 5px;
                            }

                            .images {
                                display: flex;
                                justify-content: space-between;
                                width: 60%;
                                margin-top: 15px;
                                /* margin-left: 5px; */
                            }

                            .small-img {
                                box-sizing: content-box;
                                width: 50px;
                                height: 50px;
                                /* overflow-block: hidden; */
                                border: 1px solid;
                                transition: all 0.3s ease;

                            }

                            .small-img img {
                                width: inherit;
                                height: inherit;
                                cursor: pointer;
                                transition: all 0.3s ease;
                            }


                            .small-img:hover img {
                                transform: scale(1.2);
                            }

                            .url {
                                font-size: 16px;
                                font-weight: 400;
                                color: rgb(251, 152, 152);
                            }

                            .url a {
                                font-size: 20px;
                                font-weight: 500;
                                color: #f7444e;
                            }

                            .pname {
                                font-size: 32px;
                                font-weight: 600;
                                margin-top: 30px;
                            }

                            .ratings i {
                                color: red;
                            }

                            .price {
                                font-size: 20px;
                                font-weight: 500;
                                margin: 20px 0;
                            }

                            .size {
                                display: flex;
                                align-items: center;
                                margin: 20px 0;
                            }

                            .size p {
                                font-size: 18px;
                                font-weight: 500;
                            }

                            .quantity {
                                display: flex;
                            }

                            .quantity p {
                                font-size: 17px;
                                font-weight: 500;
                            }

                            .quantity input {
                                width: 40px;
                                font-size: 17px;
                                font-weight: 500;
                                text-align: center;
                                margin-left: 15px;
                            }

                            .btn-box {
                                display: flex;
                                margin-top: 40px;
                            }

                            .btn-box button {
                                font-size: 18px;
                                padding: 8px 25px;
                                border: none;
                                outline: none;
                                border-radius: 6px;
                                cursor: pointer;
                                color: white;
                            }

                            .cart-btn {
                                background-color: #ff5e00;
                                margin-right: 20px;
                            }

                            .buy-btn {
                                background-color: #00aaff;
                            }

                            .cart-btn:hover {
                                background-color: #f7444e;
                            }

                            .buy-btn:hover {
                                background-color: #0066ff;
                            }

                            .product_price {
                                border-radius: 10px;
                                border: 1px solid rgb(255, 0, 0);
                                padding-top: 10px;
                                cursor: pointer;
                            }   

                            .product_price_active {
                                background-color: #f7444e;
                                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
                            }
                            
                            .product_price_disable {
                                background-color: #858383;
                                border: none;
                            }
                        </style>

                        <body class="sub_page">
                            <% int product_id=Integer.parseInt(request.getParameter("product_id")); ProductDAO
                                productDAO=new ProductDAO(); Product product=productDAO.getProduct(product_id); String[]
                                productImages=productDAO.getProductImage(product_id); VolumeDAO volumeDAO=new
                                VolumeDAO(); ProductVolume[] pv=volumeDAO.getProductVolumesByProductId(product_id);
                                BrandDAO bdao=new BrandDAO(); %>
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
                                        <div class="row">
                                            <div class="col-lg-6 col-xs-12">

                                                <div class="left">
                                                    <div class="big-img img-fluid text-center">
                                                        <img src="<%= productImages[0]%>">
                                                    </div>
                                                    <div class="images">
                                                        <% for (String imageLink : productImages) {%>
                                                            <div class="small-img">
                                                                <img src="<%= imageLink%>" onclick="showImg(this.src)">
                                                            </div>
                                                            <% }%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="right">
                                                    <div class="url">
                                                        <a href="product.jsp">Product</a> >
                                                        <a href="product.jsp?gioitinh=<%= product.getProduct_sex()%>">Nước
                                                            hoa <%= product.getProduct_sex()%></a> >
                                                        <a
                                                            href="productbrand.jsp?brand_id=<%= product.getBrand_id()%>">
                                                            <%= bdao.getBrandName(product.getBrand_id())%>
                                                        </a>
                                                    </div>
                                                    <div class="pname">
                                                        <%= product.getProduct_name()%>
                                                    </div>
                                                    <div class="font-weight-light">Thương hiệu: <a
                                                            href="product.jsp?brand=<%= bdao.getBrandName(product.getBrand_id())%>">
                                                            <%= bdao.getBrandName(product.getBrand_id())%>
                                                        </a></div>
                                                    <div class="price">Chọn dung tích:</div>
                                                    <div class="row mb-2">
                                                        <% for (ProductVolume productVolume :
                                                            product.getProduct_volumes()) { %>
                                                            <div class="col-sm-3 product_price mr-2 <%= (productVolume.getProduct_pcs_left() == 0) ?"product_price_disable" : ""%> "
                                                                onclick="<%= (productVolume.getProduct_pcs_left() > 0) ? "showPrice(this)" : ""%> ">
                                                                <div class="text-hide">
                                                                    <%= productVolume.getProduct_pcs_left() %>
                                                                </div>
                                                                <p class="text-center">EDP <span id="volume-choice"><%=
                                                                    productVolume.getProduct_volume()%></span><br />
                                                                        <b>
                                                                            <%= productVolume.getProduct_price()%>
                                                                        </b>
                                                                </p>
                                                            </div>
                                                            <% } %>
                                                    </div>
                                                    <div class="price" id="main-price" style="color:red"></div>
                                                    <hr />
                                                    <p id="quantity_left"></p>
                                                    <div class="quantity">
                                                        
                                                        <p>Số lượng mua:</p>
                                                        <input id="txtquantity"  type="number" min="0" max="0" value="0">
                                                    </div>
                                                    <div class="btn-box">
                                                        <button class="cart-btn">Thêm vào vỏ hàng</button>
                                                        <script type="text/javascript">
                                                        $(document).ready(function () {
                                                            $('.cart-btn').click(function() {
                                                                $.get('AddCartServlet', {
                                                                    product_id: <%= product.getProduct_id()%>,
                                                                    quantity: $('#txtquantity').val(),
                                                                    volume: $('div#main-price > span').html()
                                                                }, function (responseText) {

                                                                });
                                                            });

                                                        });
                                                        </script>
                                                    </div>

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
                                        let price = document.getElementById('main-price');
                                        let left = document.getElementById('quantity_left');
                                        function showImg(pic) {
                                            bigImg.src = pic;
                                        }
                                        function showPrice(priceChoose) {
                                            let allPrice = document.getElementsByClassName("product_price");
                                            for (let i = 0; i < allPrice.length; i++) {
                                                allPrice[i].classList.remove("product_price_active");
                                            }
                                            price.innerHTML = priceChoose.childNodes[3].innerHTML;
                                            priceChoose.classList.add("product_price_active");
                                            left.innerHTML = "Số lượng còn lại: " + priceChoose.childNodes[1].innerHTML;
                                            let quantity = document.getElementById('txtquantity');
                                            quantity.max =parseInt(priceChoose.childNodes[1].innerHTML);
                                        }
                                    </script>
                        </body>

                        </html>