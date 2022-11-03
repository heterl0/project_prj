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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .container{
                padding-top: 50px;
            }
        </style>
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
                        <th scope="col">Customer ID</th>
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
                    <td><%= rsC.getString("customer_id")%></td>
                    <td><%= rsC.getString("customer_address")%></td>
                    <td><%= rsC.getString("customer_email")%></td>
                    <td><%= rsC.getString("customer_fullName")%></td>
                    <td>
                        <a onclick="return confirm('Are you sure?');" href="/AccountServlet/Delete/<%= rsC.getString("customer_id")%>/<%= rsA.getString("account_id")%>" class="btn btn-danger" role="button">Delete</a>
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
