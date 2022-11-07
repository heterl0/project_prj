<%-- 
    Document   : list
    Created on : Nov 1, 2022, 1:58:12 PM
    Author     : LeThiThuyVy_CE160174
--%>

<%@page import="com.models.Order"%>
<%@page import="com.daos.OrderDAO"%>
<%@page import="com.daos.BillDAO"%>
<%@page import="com.models.Bill"%>
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
    </head>
    <body>
        <div class="hero_area">
            <!-- header section strats -->
            <%@include file="header.jsp" %>
            <!-- end header section -->
       
        <div class="container"> 
            <h1 align="center">Customer and Account Management</h1>
            <h1 class="text-center">Đơn Hàng</h1>
            <table>
                <tr>
                    <th>Bill ID</th>
                    <th>Bill Information</th>
                    <th></th>
                </tr>
                <%                    BillDAO billDAO = new BillDAO();
                    Bill[] bills = billDAO.getBills();
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
                        <td><a onclick="return confirm('Are you sure?');" href="BillServlet?bill_id=<%= bill.getBill_id() %>" class="btn btn-danger" role="button">Delete</a></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%@include file="footer.jsp" %>
         </div>
    </body>
</html>
