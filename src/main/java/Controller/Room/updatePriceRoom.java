/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Room;

import DAO.RoomInfomationDAO;
import ModelAdmin.Room;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "updatePriceRoom", urlPatterns = {"/updatePriceRoom"})

public class updatePriceRoom extends HttpServlet {

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
            out.println("<title>Servlet updatePriceRoom</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updatePriceRoom at " + request.getContextPath() + "</h1>");
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
        String room_id = request.getParameter("room_id");
        RoomInfomationDAO DAO = new RoomInfomationDAO();
        Room r = DAO.GetCustomer(room_id);
        if (!room_id.isEmpty()) {
            request.setAttribute("data", r);
            request.getRequestDispatcher("updatePriceRoom.jsp").forward(request, response);
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
        String room_id = request.getParameter("id");
        String type = request.getParameter("type");
        String room_capacity = request.getParameter("capacity");
        String room_price = request.getParameter("price");
        String description = request.getParameter("description");
        if (!room_id.isEmpty() && !room_price.isEmpty()) {
            int id = Integer.parseInt(room_id);
            int price = Integer.parseInt(room_price);
            int capacity = Integer.parseInt(room_capacity);
            RoomInfomationDAO DAO = new RoomInfomationDAO();
            DAO.Update(
                    new Room(id, type, capacity, price, description)
            );
            response.sendRedirect(request.getContextPath() + "/readPriceRoom");
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
