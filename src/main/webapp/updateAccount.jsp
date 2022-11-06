<%-- 
    Document   : updateAccount
    Created on : Nov 6, 2022, 12:46:55 PM
    Author     : LeThiThuyVy_CE160174
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
        <h1>Update Information of Account</h1>
        <%            
            Customer c = (Customer) session.getAttribute("customer");
            Account a = (Account) session.getAttribute("account");
        %>
        <form method="post" action="AccountServlet">
            Account ID: <input type="text" name="txtAccountid" value="<%= a.account_id%>"/>
            <br>
            Account Pass: <input type="text" name="txtpass" value="<%= a.account_pass%>"/>
            <br>
            Account Phone: <input type="text" name="txtphone" value="<%= a.account_phone%>"/>
            <br><!-- comment -->
            Role ID: <input type="text" name="txtRoleid" value="<%= a.account_role%>"/>
            <br><!-- comment -->
            Customer Address: <input type="text" name="txtAddr" value="<%= c.customer_address%>"/>
            <br><!-- comment -->
            Customer Email: <input type="text" name="txtEmail" value="<%= c.customer_email%>"/>
            <br><!-- comment -->
            Customer FullName: <input type="text" name="txtFullname" value="<%= c.customer_name%>"/>
            <br><!-- comment -->
            <input type="submit" value="Update" name="btnUpdateAccount"/>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>
