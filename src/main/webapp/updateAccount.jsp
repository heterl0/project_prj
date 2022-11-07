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
        <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#passHelp').hide();
                $('#emailHelp').hide();

                $('#txtPass').blur(function (event) {
                    var pass = $('#txtPass').val();
                    $.get('SignUpServlet', {
                        checkPass: pass
                    }, function (responseText) {
                        if (responseText === '') {
                            $('#passHelp').text("");
                            $('#passHelp').hide();
                            $('#btnUpdate').removeAttr('disabled');
                        } else {
                            $('#passHelp').show();
                            $('#passHelp').text(responseText);
                            $('#btnUpdate').attr('disabled', 'disabled');

                        }
                    });
                });
                $('#txtEmail').blur(function (event) {
                    var email = $('#txtEmail').val();
                    $.get('SignUpServlet', {
                        checkEmail: email
                    }, function (responseText) {
                        if (responseText === '') {
                            $('#emailHelp').text("");
                            $('#emailHelp').hide();
                            $('#btnUpdate').removeAttr('disabled');
                        } else {
                            $('#emailHelp').show();
                            $('#emailHelp').text(responseText);
                            $('#btnUpdate').attr('disabled', 'disabled');

                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container mt-5 mb-5">
            <h1 class="text-center">Update Information of Account</h1>
            <%            Customer c = (Customer) session.getAttribute("customer");
                Account a = (Account) session.getAttribute("account");
            %>
            <form method="post" action="AccountServlet">
                Account ID: <input type="text" name="txtAccountid" value="<%= a.account_id%>" readonly/>
                <br>
                Account Phone: <input type="text" name="txtPhone" value="<%= a.account_phone%>" readonly/>
                <br><!-- comment -->
                Account Pass: <input type="password" name="txtPass" id="txtPass" value="<%= a.account_pass%>" required pattern="[0-9a-zA-Z]{6,32}"/>
                <br>
                <div class="btn btn-danger" id="passHelp"></div>
                <br>
                Role ID: <select name="txtRole"> 
                    <option value="1" <%= (a.account_role == 1) ? "selected" : ""%>>Admin</option>
                    <option value="2" <%= (a.account_role == 2) ? "selected" : ""%>>User</option>
                </select>
                <br><!-- comment -->
                Customer Address: <input type="text" name="txtAddress" value="<%= c.customer_address%>" required/>
                <br><!-- comment -->
                Customer Email: <input type="mail" name="txtEmail" id="txtEmail" value="<%= c.customer_email%>" required/>
                <br><!-- comment -->
                <div class="btn btn-danger" id="emailHelp"></div>
                <br>
                Customer FullName: <input type="text" name="txtName" value="<%= c.customer_name%>" required/>
                <br><!-- comment -->
                <input type="submit" id="btnUpdate" value="Update" name="btnUpdateAccount"/>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
