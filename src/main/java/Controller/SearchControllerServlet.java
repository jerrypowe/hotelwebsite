/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import ModelAdmin.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet(name = "SearchControllerServlet", urlPatterns = {"/Search"})
public class SearchControllerServlet extends HttpServlet {

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
            /* TODO output your pemail here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchControllerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchControllerServlet at " + request.getContextPath() + "</h1>");
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

        response.sendRedirect("search.jsp");
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
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        List<Customer> list = new ArrayList<>();
        CustomerDAO DAO = new CustomerDAO();
        if (!name.isEmpty() && !address.isEmpty() && !email.isEmpty()) {

            list = DAO.SearchUser(name, address, email);
        } else if (!name.isEmpty() && !address.isEmpty() && email.isEmpty()) {
            list = DAO.SearchUserByNameAndAddress(name, address);
        } else if (!address.isEmpty() && !email.isEmpty() && name.isEmpty()) {

            list = DAO.SearchUserByAddressAndAge(address, email);
        } else if (address.isEmpty() && !email.isEmpty() && !name.isEmpty()) {

            list = DAO.SearchUserByNameAndAge(name, email);
        } else if (address.isEmpty() && email.isEmpty() && !name.isEmpty()) {
            list = DAO.SearchUserByName(name);
        } else if (!address.isEmpty() && email.isEmpty() && name.isEmpty()) {
            list = DAO.SearchUserByAddress(address);
        } else if (address.isEmpty() && !email.isEmpty() && name.isEmpty()) {

            list = DAO.SearchUserByAge(email);
        } else {
            list = DAO.GetAll();
        }

        if (list != null) {
            request.setAttribute("data", list);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/Search");
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
