<%-- 
    Document   : product
    Created on : Oct 27, 2022, 5:26:00 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
--%>

<%@page import="com.models.CartProduct"%>
<%@page import="com.models.ProductVolume"%>
<%@page import="com.daos.CartDAO"%>
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
        /*      cart items css*/
        .cart-page{
            margin: 80px auto;
        }

        table{
            width: 100%;
            border-collapse: collapse;
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
            height: auto;
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

        .btn-color {
            background: #ff523b;
        }

        tr {
            border-bottom: 1px solid #000;
        }

    </style>
    <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#emailHelper').hide();

            $('#txtEmail').blur(function (event) {
                var email = $('#txtEmail').val();
                $.get('SignUpServlet', {
                    checkEmail: email
                }, function (responseText) {
                    if (responseText === '') {
                        $('#emailHelp').text("");
                        $('#emailHelp').hide();
                    } else {
                        $('#emailHelp').show();
                        $('#emailHelp').text(responseText);

                    }
                });
            });
        });
    </script>
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
                            <h3>Giỏ hàng</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end inner page section -->
        <!-- product section -->
        <section class="product_section layout_padding">
            <div class="container-fluid">
                <%                 if (!isLogin) {
                %>
                <h1 align="center" style="color: red;   "><strong><a href="signin.jsp">Đăng nhập</a> để thêm giỏ hàng!</strong></h1>

                <%
                } else {
                    CartDAO cartDAO = new CartDAO();
                    if (cartDAO.getCartsByCustomerID(Integer.parseInt(account_id)) == null || cartDAO.getCartsByCustomerID(Integer.parseInt(account_id)).length == 0) {
                %>
                <h1 align="center" style="color: red;   "><strong>Giỏ hàng trống! <a href="signin.jsp">Về trang sản phẩm.</a></strong></h1>
                <%
                } else {
                    int totalMoney = 0;
                %>



                <div class="small-container cart-page">
                    <form action="AddBillServlet" method="post">
                        <div class="row">
                            <div class="col-md-8">
                                <table>
                                    <tr>
                                        <th><h3>Sản Phẩm</h3></th>
                                        <th><h3>Số Lượng</h3></th>
                                        <th><h3>Giá</h3></th>
                                    </tr>
                                    <%
                                        for (CartProduct cartProduct : cartDAO.getCartsByCustomerID(Integer.parseInt(account_id))) {
                                            totalMoney += cartProduct.getQuantity() * cartProduct.getProduct().getPriceByVolume(cartProduct.getVolume());
                                            int product_id = cartProduct.getProduct().getProduct_id();
                                            String product_volume = cartProduct.getVolume();
                                            int product_price = cartProduct.getProduct().getPriceByVolume(cartProduct.getVolume());
                                            String id = account_id + '/' + product_id + '/' + product_volume;
                                    %>
                                    <tr>
                                        <td>
                                            <div class="row">
                                                <div class="col-sm-4">
                                                    <img src="<%= cartProduct.getProduct().getProduct_image()[0]%>">
                                                </div>
                                                <div class="col-sm-7">
                                                    <a href="productdetail.jsp?product_id=<%= product_id%>"><h4><%= cartProduct.getProduct().getProduct_name()%></h4></a>
                                                    <p>Dung tích: <%= product_volume%></p>
                                                    <small>Đơn giá: <%= cartDAO.formatPrice(product_price)%> VND</small>
                                                    <br>
                                                    <a href="AddCartServlet?customer_id=<%= account_id%>&remove_product_id=<%= product_id%>&product_volume=<%= cartProduct.getVolume()%>">Remove</a>
                                                </div>
                                            </div>
                                        </td>

                                        <td>
                                            <h3><%= cartProduct.getQuantity()%></h3>
                                        </td>
                                        <td><%= cartDAO.formatPrice(cartProduct.getQuantity() * product_price)%> VND</td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </table></div>
                            <div class="offset-md-1 col-md-3">
                                <div class="flex-row">
                                    <h3 class="total-price-txt">Tổng tiền:</h3>
                                    <h4><%= cartDAO.formatPrice(totalMoney)%> VND</h4>
                                    <%
                                        CustomerDAO customerDAO = new CustomerDAO();
                                        AccountDAO accountDAO = new AccountDAO();
                                        Customer customer = customerDAO.getCustomerByAccountID(Integer.parseInt(account_id));

                                    %>
                                    <div class="form-group">
                                        <label for="txtName">Tên khách hàng</label>
                                        <input name="txtName" type="text" class="form-control" id="txtName" aria-describedby="nameHelp" placeholder="Nhập tên của bạn" value="<%= customer.getCustomer_name()%>" required>
                                        <small id="nameHelp" class="form-text text-muted"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtPhone">Số điện thoại</label>
                                        <input name="txtPhone" type="text" class="form-control" id="txtPhone" aria-describedby="phoneHelp" placeholder="Nhập số điện thoại" value="<%= accountDAO.getAccountBy(account_id).getAccount_phone()%>"readonly>
                                        <small id="phoneHelp" class="form-text text-muted"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtEmail">Địa chỉ Email</label>
                                        <input name="txtEmail" type="email" class="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Nhập Email" value="<%= customer.getCustomer_email()%>">
                                        <small id="emailHelp" class="form-text text-muted"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtAddress">Địa chỉ liên lạc</label>
                                        <input name="txtAddress" type="text" class="form-control" id="txtAddress" aria-describedby="addressHelp" placeholder="Nhập địa chỉ" value="<%= customer.getCustomer_address()%>" required>
                                        <small id="addressHelp" class="form-text text-muted"></small>
                                    </div>
                                    <input type="submit" name="btnSubmit" class="btn btn-primary btn-color" value="Thanh toán">

                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%
                    }
                }
            %>
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
