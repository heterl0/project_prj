/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.daos.CartDAO;
import com.daos.ProductDAO;
import com.models.CartProduct;
import jakarta.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import jakarta.servlet.*;

/**
 *
 * @author Heterl0
 */
public class AddCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        CartDAO cdao = new CartDAO();
        if (request.getParameter("remove_product_id") != null) {
            int customer_id = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("account_id")) {
                    customer_id = Integer.parseInt(cookie.getValue());
                }
            }

            cdao.delete(customer_id, Integer.parseInt(request.getParameter("remove_product_id")), request.getParameter("product_volume"));
            response.sendRedirect("cart.jsp");
        } else {
            boolean isLogin = false;
            int customer_id = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("account_id")) {
                    isLogin = true;
                    customer_id = Integer.parseInt(cookie.getValue());
                }
            }
            if (isLogin) {
                int product_id = Integer.parseInt(request.getParameter("product_id"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                if (quantity > 0) {
                    String volume = request.getParameter("volume");
                    CartProduct cartProduct = null;
                    if (cdao.cartIsExisted(customer_id, product_id, volume)) {

                        int quantity_InDB = cdao.getQuantity(customer_id, product_id, volume);
                        if (quantity + quantity_InDB <= productDAO.getProduct(product_id).getLeftByVolume(volume)) {
                            cartProduct = new CartProduct((new ProductDAO()).getProduct(product_id), customer_id, quantity_InDB, volume);
                            cdao.updateQuatity(cartProduct, quantity + quantity_InDB);
                        }
                    } else {

                        cartProduct = new CartProduct((new ProductDAO()).getProduct(product_id), customer_id, quantity, volume);
                        response.getWriter().append(cartProduct.getCustomer_id() + "" + cartProduct.getProduct().getProduct_id() + volume + quantity);

                        cdao.addNew(cartProduct);
                    }
                }
            } else {
                response.sendRedirect("signin.jsp");
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
