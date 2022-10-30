/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.daos.AccountDAO;
import com.daos.CustomerDAO;
import com.models.Account;
import com.models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Heterl0
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpSerlvet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpSerlvet at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("checkPhone") != null) {
            String phone = request.getParameter("checkPhone");
            if (phone.matches("^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$")) {
                AccountDAO dao = new AccountDAO();
                if (dao.getAccount(phone) == null) {
                    response.getWriter().append("");
                } else {
                    response.getWriter().append("Phone number has been used!");
                }
            } else {
                response.getWriter().append("Phone number is invalid!");
            }
        }
        if (request.getParameter("checkPass") != null) {
            String pass = request.getParameter("checkPass");
            if (pass.matches("[\\w]{6,32}")) {
                response.getWriter().append("");
            } else {
                response.getWriter().append("Password must be 6 - 32 characters!");
            }
        }
        if (request.getParameter("checkRePass1") != null && request.getParameter("checkRePass2") != null) {
            String pass = request.getParameter("checkRePass1");
            String rePass = request.getParameter("checkRePass2");
            if (pass.equals(rePass)) {
                response.getWriter().append("");
            } else {
                response.getWriter().append("Cofirm Password is not correct!");
            }
        }
        if (request.getParameter("checkEmail") != null) {
            String email = request.getParameter("checkEmail");
            if (email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                response.getWriter().append("");
            } else {
                response.getWriter().append("Email is invalid!");
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
        if (request.getParameter("btnSignUp") != null) {
            String phone = request.getParameter("txtPhone");
            String pass = request.getParameter("txtPass");
            String name = request.getParameter("txtName");
            String email = request.getParameter("txtEmail");
            String address = request.getParameter("txtAddress");
            AccountDAO accountDAO = new AccountDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            int id = accountDAO.getSize() + Integer.parseInt(phone.substring(6));
            accountDAO.addNew(new Account(id, phone, getM5D(pass), 2));
            customerDAO.addNew(new Customer(id, id, name, email, address));
            response.sendRedirect("index.jsp");
        }
    }

    private String getM5D(String pass) {
        String hashtext = null;
        try {
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.reset();
            m.update(pass.getBytes());
            byte[] digest = m.digest();
            BigInteger bigInt = new BigInteger(1, digest);
            hashtext = bigInt.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
                    return hashtext;

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
