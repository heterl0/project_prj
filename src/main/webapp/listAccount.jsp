<%-- 
    Document   : list
    Created on : Nov 1, 2022, 1:58:12 PM
    Author     : LeThiThuyVy_CE160174
--%>

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
        <%@include file="header.jsp" %>
        <div class="container"> 
            <h1 align="center">Customer and Account Management</h1>
            <table class="table table-striped" border="1">
                <thead>
                    <tr>
                        <th scope="col">Account ID</th>
                        <th scope="col">Account Pass</th>
                        <th scope="col">Account Phone</th>
                        <th scope="col">Role ID</th> 
                        <th scope="col">Customer Address</th>
                        <th scope="col">Customer Email</th>
                        <th scope="col">Customer FullName</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <%                    
                    AccountDAO daoA = new AccountDAO();
                    CustomerDAO daoC = new CustomerDAO();
                    ResultSet rsA = daoA.getAll();
                    ResultSet rsC = daoC.getAll();
                    while (rsA.next() && rsC.next()) {
                %>
                <tr>
                    <td><%= rsA.getString("account_id")%></td>
                    <td><%= rsA.getString("account_pass")%></td>
                    <td><%= rsA.getString("account_phone")%></td>
                    <td><%= rsA.getString("role_id")%></td>
                    <td><%= rsC.getString("customer_address")%></td>
                    <td><%= rsC.getString("customer_email")%></td>
                    <td><%= rsC.getString("customer_fullName")%></td>
                    <td>
                            <a onclick="return confirm('Are you sure?');" href="AccountServlet/Delete/<%= rsC.getString("customer_id")%>/<%= rsA.getString("account_id")%>" class="btn btn-danger" role="button">Delete</a>
                            <a href="AccountServlet/Update/<%= rsC.getString("customer_id")%>/<%= rsA.getString("account_id")%>" class="btn btn-success" role="button">Update</a>
                        
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
