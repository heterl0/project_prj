<%-- 
    Document   : header
    Created on : Oct 26, 2022, 10:02:29 PM
    Author     : Heterl0
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.daos.BrandDAO"%>
<%@page import="com.daos.AccountDAO"%>
<%@page import="com.models.Customer"%>
<%@page import="com.daos.CustomerDAO"%>
<%@page import="com.models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/favicon.png" type="">
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
            .header_section {
                margin: 0px;
                padding: 0px;
            }
        </style>
    </head>

    <body>
        <%
            boolean isLogin = false;
            String account_id = "";
            String customer_fullName = "";
            String customer_name = "";
            int role_id = 0;
            if (!session.isNew()) {
                for (Cookie c : request.getCookies()) {
                    if (c.getName().equals("account_id")) {
                        isLogin = true;
                        account_id = c.getValue();
                        Account account = (new AccountDAO()).getAccountBy(account_id);
                        if (account.getAccount_role() == 2) {
                            CustomerDAO dao = new CustomerDAO();
                            Customer customer = dao.getCustomerByAccountID(Integer.parseInt(account_id));

                            customer_fullName = customer.getCustomer_name();
                            String[] s = customer_fullName.split(" ");
                            customer_name = s[s.length - 1];
                            role_id = 2;
                        } else {
                            customer_name = account.getAccount_phone();
                            role_id = 1;
                        }
                    }
                }
            }
        %>
        <header class="header_section">
            <%
                if (role_id != 1) {
            %>
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand" href="index.jsp"><img width="250" src="Assest/Logo.png" alt="#" /></a>
                    <button  class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="product.jsp">Nước hoa</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="newarrival.jsp">New Arrival</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="true"> <span class="nav-label">Nhãn Hiệu<span
                                            class="caret"></span></a>
                                            <%
                                                BrandDAO brandDAO = new BrandDAO();
                                                ResultSet brandSet = brandDAO.getAll();
                                            %>
                                <ul class="dropdown-menu position-absolute">
                                    <% 
                                        while (brandSet.next()) {
                                    %>
                                    <li><a href="productbrand.jsp?brand_id=<%= brandSet.getInt("brand_id")%>"><%= brandSet.getString("brand_name")%></a></li>
                                    <% 
                                        }
                                    %>
                                </ul>
                            </li>
                            <%
                                if (isLogin) {
                            %>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="true"> <span class="nav-label"><%= "Xin chào " + customer_name%><span
                                            class="caret"></span></a>
                                <ul class="dropdown-menu position-absolute">
                                    <li><a href="infor.jsp">Thông tin</a></li>
                                    <li><a onclick="return confirm('Bạn có thật sự muốn đăng xuất?');"href="SignInServlet?signout=true">Đăng xuất</a></li>
                                </ul>
                            </li>
                            <%
                            } else {
                            %>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="true"> <span class="nav-label">Account <span
                                            class="caret"></span></a>
                                <ul class="dropdown-menu position-absolute">
                                    <li><a href="signup.jsp">Đăng ký</a></li>
                                    <li><a href="signin.jsp">Đăng nhập</a></li>
                                </ul>
                            </li>
                            <%
                                }
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="cart.jsp">
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;"
                                         xml:space="preserve">
                                    <g>
                                    <g>
                                    <path
                                        d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                        c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                          C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                          c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                          C457.728,97.71,450.56,86.958,439.296,84.91z" />
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path
                                        d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                        c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                                    </g>
                                    </g>
                                    </svg>
                                </a>
                            </li>
                            <form class="d-flex justify-content-between search-inner" action="product.jsp?sortby=search&">
                                <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </form>
                        </ul>
                    </div>
                </nav>
            </div>
            <%
                } else {
            %>
            
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand" href="index.jsp"><img width="250" src="Assest/Logo.png" alt="#" /></a>
                    <button  class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="listProduct.jsp">Quản lí sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listAccount.jsp">Quản lí tài khoản</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Quản lí đơn hàng</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="true"> <span class="nav-label"><%= "Xin chào " + customer_name%><span
                                            class="caret"></span></a>
                                <ul class="dropdown-menu position-absolute">
                                    <!--<li><a href="#">Thông tin</a></li>-->
                                    <li><a onclick="return confirm('Bạn có thật sự muốn đăng xuất?');"href="SignInServlet?signout=true">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <%
                }
            %>
        </header>
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