<%-- 
    Document   : product
    Created on : Oct 27, 2022, 5:26:00 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
--%>

<%@page import="com.models.Order"%>
<%@page import="com.daos.OrderDAO"%>
<%@page import="com.models.Bill"%>
<%@page import="com.daos.BillDAO"%>
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

        .small_image img {
            width: 50px;
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
                            <h3>Thông tin cá nhân</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end inner page section -->
        <!-- product section -->
        <section class="product_section layout_padding">
            <div class="container-fluid">
                <%                    if (!isLogin) {
                %>
                <h1 align="center" style="color: red;   "><strong><a href="signin.jsp">Đăng nhập</a> để xem thông tin!</strong></h1>

                <%
                } else {
                %>

                <div class="small-container cart-page">
                    <form action="AddBillServlet" method="post">
                        <div class="row">
                            <div class="col-md-8">
                                <%
                                    BillDAO billDAO = new BillDAO();
                                    if (billDAO.getBillsByCustomerID(Integer.parseInt(account_id)) == null || billDAO.getBillsByCustomerID(Integer.parseInt(account_id)).length == 0) {
                                %>
                                <h1 align="center" style="color: red;   "><strong>Không có đơn hàng nào <a href="product.jsp">Về trang sản phẩm.</a></strong></h1>
                                <%
                                } else {
                                    int totalMoney = 0;
                                %>
                                <h1 class="text-center">Đơn Hàng</h1>
                                <table>
                                    <tr>
                                        <th>Bill ID</th>
                                        <th>Bill Information</th>
                                    </tr>
                                    <%
                                        Bill[] bills = billDAO.getBillsByCustomerID(Integer.parseInt(account_id));
                                        for (Bill bill : bills) {
                                    %>
                                    <tr>
                                        <td><%= bill.getBill_id()%></td>
                                        <td><div class="dropdown">
                                                <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                                                    <div class="row">
                                                        <div class="col-md-4 border-right-1">Date: <%= bill.getBill_date().toString()%></div>
                                                        <div class="col-md-4 border-right-1">Status: <%= bill.getBill_state()%></div>
                                                        <div class="col-md-4 border-right-1">Tổng tiền: <%= bill.getTotal_money()%></div>
                                                    </div>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <%
                                                        OrderDAO orderDAO = new OrderDAO();
                                                        Order[] orders = orderDAO.getOrderByBillID(bill.getBill_id());
                                                        for (Order order : orders) {
                                                    %>

                                                    <div class="row dropdowm-item">
                                                        <div class="col-md-2 small_image">
                                                            <img src="<%= order.getProduct().getProduct_image()[0]%>" alt="alt"/>
                                                        </div>
                                                        <div class="col-md-6"><%= order.getProduct().getProduct_name()%></div>
                                                        <div class="col-md-1"><%= order.getVolume()%></div>
                                                        <div class="col-md-2"><%= order.getProduct().getPriceByVolumeString(order.getVolume())%> VND</div>
                                                        <div class="col-md-1"><%= order.getQuantity()%></div>
                                                    </div>
                                                    <div class="dropdown-divider"></div>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>
                            <%
                                }
                            %>
                            <div class="offset-md-1 col-md-3">
                                <div class="flex-row">
                                    <h3 class="text-center">Chỉnh sửa thông tin</h3>
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
                                        <input name="txtPhone" type="text" class="form-control" id="txtPhone" aria-describedby="phoneHelp" placeholder="Nhập số điện thoại" value="<%= accountDAO.getAccountBy(account_id).getAccount_phone()%>">
                                        <small id="phoneHelp" class="form-text text-muted"></small>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtPhone">Mật khẩu</label>
                                        <input name="txtPass" type="password" class="form-control" id="txtPhone" aria-describedby="passHelp" placeholder="Nhập số mật khẩu" value="<%= accountDAO.getAccountBy(account_id).getAccount_pass()%>">
                                        <small id="passHelp" class="form-text text-muted"></small>
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
                                    <input type="submit" name="btnSubmit" class="btn btn-primary btn-color" value="Chỉnh sửa">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%
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
