<%-- 
    Document   : paying
    Created on : Nov 1, 2022, 1:38:14 PM
    Author     : Nguyen Truong Quoc Duy Ce160380
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Paying</title>
        <link rel="stylesheet" href="css/bootstrap.css" />
        <link
            rel="stylesheet"
            href="css/font-awesome.min.css"
            />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/paying.css" />
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form class="form-paying" action="ordersHander" method="get">
            <div class="container">
                <div class="row padding">
                    <!--1.  Customer information -->
                    <div class="col-xs-12 col-lg-4">
                        <div class="form-customer-info">
                            <div class="form-heading-group">
                                <h4 class="form-heading">THÔNG TIN KHÁCH HÀNG</h4>
                                <div class="form-heading-logo">
                                    <a href="index.html">
                                        <img
                                            src="https://bizweb.dktcdn.net/100/318/614/themes/667160/assets/checkout_logo.png?1655706741253"
                                            alt="logo"
                                            />
                                    </a>
                                </div>
                            </div>

                            <div class="form-control">
                                <h4 class="form-label">Họ và tên:</h4>
                                <input
                                    type="text"
                                    name="name"
                                    id="name"
                                    placeholder="VD: Trần Đăng Khoa"
                                    required
                                    />
                                <div class="form-error"></div>
                            </div>

                            <div class="form-control">
                                <h4 class="form-label">Điện thoại:</h4>
                                <input
                                    type="text"
                                    name="phone"
                                    id="phone"
                                    placeholder="VD: 0352016906"
                                    required
                                    />
                                <div class="form-error"></div>
                            </div>

                            <div class="form-control">
                                <h4 class="form-label">Email:</h4>
                                <input
                                    type="email"
                                    name="email"
                                    id="email"
                                    placeholder="VD: abcdef123@gmail.com"
                                    required
                                    />
                                <div class="form-error"></div>
                            </div>

                            <div class="form-control">
                                <h4 class="form-label">Địa chỉ</h4>
                                <input
                                    type="text"
                                    name="address"
                                    id="address"
                                    placeholder="VD: 123/5 Nguyễn Văn Trỗi, Ninh Kiều, Cần Thơ"
                                    required
                                    />
                                <div class="form-error"></div>
                            </div>

                            <div class="form-control">
                                <h4 class="form-label">Ghi chú:</h4>
                                <input
                                    class="form-customer-note"
                                    type="text"
                                    name="note"
                                    id="note"
                                    placeholder="VD: Hỗ trợ ship nhanh shop nhé"
                                    />
                                <div class="form-error"></div>
                            </div>

                            <div class="form-control">
                                <div class="form-group">
                                    <h4 class="form-label form-label-paying">Thanh toán:</h4>
                                    <div class="form-group-img">
                                        <img
                                            src="https://cf.shopee.vn/file/2c46b83d84111ddc32cfd3b5995d9281"
                                            alt=""
                                            />
                                        <img
                                            src="https://cf.shopee.vn/file/d4bbea4570b93bfd5fc652ca82a262a8"
                                            alt=""
                                            />
                                        <img
                                            src="https://cf.shopee.vn/file/a0a9062ebe19b45c1ae0506f16af5c16"
                                            alt=""
                                            />
                                        <img
                                            src="https://cf.shopee.vn/file/38fd98e55806c3b2e4535c4e4a6c4c08"
                                            alt=""
                                            />
                                    </div>
                                </div>

                                <div class="form-group form-customer-paying">
                                    <div class="form-group">
                                        <input
                                            id="ship-code"
                                            type="radio"
                                            name="form-transport"
                                            value="0"
                                            required
                                            />
                                        <label for="ship-code">Thanh toán khi nhận</label>
                                    </div>

                                    <div class="form-group">
                                        <input
                                            id="bank"
                                            type="radio"
                                            name="form-transport"
                                            value="1"
                                            disabled
                                            />
                                        <label for="bank">Chuyển khoản</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-note-register">
                                <span>Nếu bạn chưa có tài khoản hãy đăng kí</span>
                                <a href="">Tại đây.</a>
                            </div>
                        </div>
                    </div>

                    <!--2. Product information -->
                    <div class="col-xs-12 col-lg-8">
                        <div class="form-heading-group">
                            <h4 class="form-heading">THÔNG TIN SẢN PHẨM</h4>
                        </div>
                        <table class="table table-bordered align-middle table-product">
                            <thead>
                                <tr>
                                    <th scope="col" class="table-product-header">STT</th>
                                    <th scope="col" class="table-product-header">TITLE</th>
                                    <th scope="col" class="table-product-header">IMAGE</th>
                                    <th scope="col" class="table-product-header">SIZE</th>
                                    <th scope="col" class="table-product-header">QUANTITY</th>
                                    <th scope="col" class="table-product-header">PRICE</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="product-paying-order">1</td>
                                    <td class="product-paying-title">HG POLO SHIRTS - TASMAN</td>
                                    <td class="product-paying-img">
                                        <img src="./assert/img/cart-img.png" alt="" />
                                    </td>
                                    <td class="product-paying-size">XL</td>
                                    <td class="product-paying-quantity">1</td>
                                    <td class="product-paying-price">297.000đ</td>
                                </tr>
                                <tr>
                                    <td class="product-paying-order">1</td>
                                    <td class="product-paying-title">HG POLO SHIRTS - TASMAN</td>
                                    <td class="product-paying-img">
                                        <img src="./assert/img/cart-img.png" alt="" />
                                    </td>
                                    <td class="product-paying-size">XL</td>
                                    <td class="product-paying-quantity">1</td>
                                    <td class="product-paying-price">297.000đ</td>
                                </tr>
                            </tbody>
                        </table>

                        <table class="table table-bordered align-middle table-paying">
                            <tbody>
                                <tr>
                                    <td class="table-paying-label">MÃ GIẢM GIÁ:</td>
                                    <td>
                                        <input
                                            class="table-paying-vourcher"
                                            type="text"
                                            placeholder="Nhập mã Vourcher"
                                            />
                                        <button
                                            type="button"
                                            class="btn primary-btn table-paying-vourcher-btn"
                                            >
                                            SỬ DỤNG
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-paying-label">TẠM TÍNH:</td>
                                    <td class="table-paying-price">297.000đ</td>
                                </tr>
                                <tr>
                                    <td class="table-paying-label">VOUCHER:</td>
                                    <td class="table-paying-tax">- 0đ</td>
                                </tr>
                                <tr>
                                    <td class="table-paying-label">PHÍ SHIP:</td>
                                    <td class="table-paying-ship">+ 30,000đ</td>
                                </tr>
                                <tr>
                                    <td class="table-paying-label">TỔNG TIỀN:</td>
                                    <td class="table-paying-total">320.000đ</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="form-paying-btn">
                            <p>
                                <strong>Note:</strong> Quý khách vui lòng kiểm tra lại đúng
                                thông tin khách hàng và thông tin sản phẩm trước khi tiến hành
                                đặt hàng. Rất cảm ơn quí khách đã quan đặt hàng tại
                                <strong>NowSaiGon</strong> store. Chúc quí khách may mắn.
                            </p>
                            <div class="form-paying-btn-group">
                                <button type="button" class="btn primary-btn">
                                    <a href="">TIẾP TỤC MUA HÀNG</a>
                                </button>
                                <button type="submit" class="btn main-btn btn-order">
                                    ĐẶT HÀNG
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%@include file="footer.jsp" %>
    </body>
</html>

