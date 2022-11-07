/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.daos.AccountDAO;
import com.daos.CustomerDAO;
import com.models.Account;
import com.models.Customer;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LeThiThuyVy_CE160174
 */
public class AccountServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountServlet at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        if (path.startsWith("/Sawer/AccountServlet/Delete")) {
            String[] s = path.split("/");
            String c_id = s[s.length - 2];
            String a_id = s[s.length - 1];
            CustomerDAO dao = new CustomerDAO();
            AccountDAO dao1 = new AccountDAO();
            int customer_id = Integer.parseInt(c_id);
            int account_id = Integer.parseInt(a_id);
            try {
                dao.delete(customer_id);
            } catch (SQLException ex) {
                Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            dao1.delete(account_id);
            response.sendRedirect("/Sawer/listAccount.jsp");
        } else if (path.startsWith("/Sawer/AccountServlet/Update")) {
            String[] s = path.split("/");
            String c_id = s[s.length - 2];
            String a_id = s[s.length - 1];
            CustomerDAO dao = new CustomerDAO();
            int account_id = Integer.parseInt(a_id);
            Customer c = dao.getCustomerByAccountID(account_id);

            AccountDAO dao1 = new AccountDAO();
            Account a = dao1.getAccountBy(a_id);
            int customer_id = Integer.parseInt(c_id);

            if (a == null || c == null) {
                response.sendRedirect("/listAccount.jsp");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("account", a);
                session.setAttribute("customer", c);
                response.sendRedirect("/Sawer/updateAccount.jsp");
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
        String account_pass, account_phone, customer_address, customer_email, customer_name;
        int account_id, account_role;
        if (request.getParameter("btnUpdateAccount") != null) {
            account_id = Integer.parseInt(request.getParameter("txtAccountid"));
            account_pass = request.getParameter("txtPass");
            account_phone = request.getParameter("txtPhone");
            account_role = Integer.parseInt(request.getParameter("txtRoleId"));
            Account a = new Account(account_id, account_phone, account_pass, account_role);
            AccountDAO dao = new AccountDAO();

            customer_address = request.getParameter("txtAddress");
            customer_email = request.getParameter("txtEmail");
            customer_name = request.getParameter("txtName");
            Customer c = new Customer(account_id, account_id, customer_name, customer_email, customer_address);
            CustomerDAO dao1 = new CustomerDAO();

            try {
                dao.update(a);
            } catch (SQLException ex) {
                Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                dao1.update(c);
            } catch (SQLException ex) {
                Logger.getLogger(AccountServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            response.sendRedirect("/Sawer/listAccount.jsp");
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
