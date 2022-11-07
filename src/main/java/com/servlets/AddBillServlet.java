/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.daos.BillDAO;
import com.daos.CartDAO;
import com.daos.CustomerDAO;
import com.daos.OrderDAO;
import com.models.Bill;
import com.models.CartProduct;
import com.models.Customer;
import com.models.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Heterl0
 */
public class AddBillServlet extends HttpServlet {

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
            out.println("<title>Servlet AddBillServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBillServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        if (request.getParameter("btnSubmit") != null) {
            int customer_id = 0;       

            String customer_name = request.getParameter("txtName");
            String customer_email = request.getParameter("txtEmail");
            String customer_address = request.getParameter("txtAddress");
            for (Cookie c: request.getCookies()) {
                if (c.getName().equals("account_id")) {
                    customer_id = Integer.parseInt(c.getValue());
                }
            }
            Customer c = new Customer(customer_id, customer_id, customer_name, customer_email, customer_address);
            CustomerDAO cdao = new CustomerDAO();
            try {
                cdao.update(c);
            } catch (SQLException ex) {
                Logger.getLogger(AddBillServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            Bill newBill = new Bill();
            BillDAO billDAO = new BillDAO();
            newBill.setBill_id(billDAO.getSize() + 1);
            newBill.setCustomer_id(customer_id);
            
            newBill.setBill_date(new Date(Calendar.getInstance().getTime().getTime()));
            newBill.setBill_state("processing");
            newBill.setTotal_money(0);
            billDAO.addNew(newBill);
            CartDAO cartDAO = new CartDAO();
            int totalMoney = 0;
            OrderDAO orderDAO = new OrderDAO();
            for (CartProduct cp :  cartDAO.getCartsByCustomerID(customer_id)) {
                Order order = new Order(cp.getProduct(), newBill.getBill_id(), cp.getQuantity(), cp.getVolume());
                orderDAO.addNew(order);
                totalMoney += cp.getProduct().getPriceByVolume(cp.getVolume()) * cp.getQuantity();
                cartDAO.delete(cp);
                
            }
            newBill.setTotal_money(totalMoney);
            billDAO.updateTotalMoney(newBill.getBill_id(), totalMoney);
            response.sendRedirect("infor.jsp");
        }
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
