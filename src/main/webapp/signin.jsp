<%-- 
    Document   : product
    Created on : Oct 27, 2022, 5:26:00 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
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
        <style>
            .center h1{
                text-align: center;
                padding: 0 0 20px 0;
            }

            .center form {
                padding: 0 40px;
                box-sizing: border-box;
            }
            form .txt_txtfield{
                position: relative;
                border-bottom: 2px solid #adadad;
                margin-top: 20px;
            }
            .txt_txtfield input{
                width : 100%;
                padding: 0px;
                height:40px;
                font-size: 16px;
                border: none;
                background: none ;
                outline: none;
                margin-bottom: 0px;
                padding-left: 10px;
            }
            .txt_txtfield label{
                position: absolute;
                top: 0;
                left: 5px;
                color: black;
                transform: translateY(-50%);
                font-size: 16px;
                pointer-events: none;
                transition: .5s;
            }
            .txt_txtfield input:focus ~ label,
            .txt_txtfield input:valid ~ label{
                top: -5px;
                color:#2691d9 ;
            }

            .txt_txtfield input:focus ~ span::before,
            .txt_txtfield input:valid ~ span::before{
                width: 100%;
            }

            .pass {
                margin: -5px 0 20px 5px;
                color: white;
                cursor: pointer;
            }
            .pass:hover{
                text-decoration: underline;
            }

            input[type="submit"]{

                width: 100%;
                height: 50px;
                border: 1px solid;
                background: #30D7BA;
                border-radius: 25px;
                font-size: 18px;
                color: #000000;
                font-weight: 700;
                cursor: pointer;
                outline: none;
            }

            input[type="submit"]:hover{
                border-color:#30D7BA ;
                transition: .5s;
            }
            .signup_link{
                margin: 30px 0;
                text-align: center;
                font-size: 16px;
                color: black;
            }

            .signup_link a{
                color: black;
                text-decoration: none;
            }
            .signup_link a:hover{
                text-decoration: underline;

            }
            #signin_section {
                padding: 110px 60px;
            }
            .signin_button {
                margin: 30px;
            }



        </style>
        <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#errorPhone').hide();
                $('#errorPass').hide();
                $('#txtPhone').blur(function (event) {
                    var phone = $('#txtPhone').val();
                    $.get('SignInServlet', {
                        checkPhone: phone
                    }, function (responseText) {
                        if (responseText === '') {
                            $('#errorPhone').text("");
                            $('#errorPhone').hide();
                            $('#btnSignUp').removeAttr('disabled');
                        } else {
                            $('#errorPhone').show();
                            $('#errorPhone').text(responseText);
                            $('#btnSignUp').attr('disabled', 'disabled');
                        }
                    });
                });
                $('#txtPass').blur(function (event) {
                    var phone = $('#txtPhone').val();
                    var pass = $('#txtPass').val();
                    $.get('SignInServlet', {
                        checkPass: pass,
                        checkPhonePass: phone
                    }, function (responseText) {
                        if (responseText === '') {
                            $('#errorPass').text("");
                            $('#errorPass').hide();
                            $('#btnSignUp').removeAttr('disabled');
                        } else {
                            $('#errorPass').show();
                            $('#errorPass').text(responseText);
                            $('#btnSignUp').attr('disabled', 'disabled');

                        }
                    });
                });
            });
        </script>
    </head>

    <body class="sub_page">
        <div class="hero_area">
            <!-- header section strats -->
            <%@include file="header.jsp" %>
            <!-- end header section -->
        </div>
        <!-- inner page section -->
        <section id="signin_section"class="container">
            <div  class="row">
                <div class="offset-lg-4 col-lg-4 offset-lg-4">
                    <h1 align="left">Đăng Nhập</h1>
                    <form method="post" action="SignInServlet">
                        <div class="txt_txtfield">
                            <input type="txt" autocapitalize="none" required name="txtPhone" id="txtPhone">
                            <span></span>  
                            <label>Number phone</label>
                        </div>
                        <div class="alert alert-danger" id="errorPhone"></div>
                        <div class="txt_txtfield">
                            <input type="password" required name="txtPass" id="txtPass">
                            <span></span>
                            <label>Password</label>
                        </div>
                        <div class="alert alert-danger" id="errorPass"></div>
                        <div class="signin_button">
                            <input type="submit" value="Sign in" name="btnSignIn" id="btnSignIn">
                        </div>
                        <div class="signup_link">
                            Not a member? <a href="signup.jsp" style="color : red;">Sign up</a>
                        </div>
                    </form>
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
    </body>
</html>
