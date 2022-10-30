/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.daos.AccountDAO;
import com.models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

/**
 *
 * @author Heterl0
 */
public class SignInServlet extends HttpServlet {

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
            out.println("<title>Servlet SignInServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignInServlet at " + request.getContextPath() + "</h1>");
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
            AccountDAO dao = new  AccountDAO();
            if (dao.getAccount(phone) != null) {
                response.getWriter().append("");
            } else {
                response.getWriter().append("Phone number does not existed!");
            }
        }
        if (request.getParameter("checkPass") != null) {
            String pass = request.getParameter("checkPass");
            String phone = request.getParameter("checkPhonePass");
            AccountDAO dao = new  AccountDAO();
            if (dao.getAccount(phone) != null) {
                if (!dao.getAccount(phone).getAccount_pass().equals(getM5D(pass))) {
                    response.getWriter().append("Password is incorrect!");                    
                }
            } else {
                response.getWriter().append("");
            }
        }
        if (request.getParameter("signout") != null) {
            Cookie cookie = new Cookie("account_id", "");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
            response.sendRedirect("index.jsp"); // Login Successfully!!
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
        if (request.getParameter("btnSignIn") != null) {
            String phone = request.getParameter("txtPhone");
            String pass = request.getParameter("txtPass");
            AccountDAO dao = new AccountDAO();
            Account account = dao.getAccount(phone);
            if (account != null) {
                if (dao.getAccount(phone).getAccount_pass().equals(getM5D(pass))) {
                    Cookie cookie = new Cookie("account_id", account.getAccount_id()+"");
                    cookie.setMaxAge(24 * 60 * 60);
                    response.addCookie(cookie);
                    response.sendRedirect("index.jsp"); // Login Successfully!!
                } else {
                    response.sendRedirect("signin.jsp"); // Login Fail!!
                }
            } else {
                response.sendRedirect("signin.jsp"); // Login Fail!!

            }

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
