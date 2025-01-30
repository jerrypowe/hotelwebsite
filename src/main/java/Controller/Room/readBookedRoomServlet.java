/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Room;

import DAO.CustomerDAO;
import DAO.ReservationDAO;
import DAO.RoomDAO;
import DAO.ServiceDAO;
import ModelAdmin.Customer;
import ModelAdmin.Reservation;
import ModelAdmin.ReservationHasService;
import ModelAdmin.Room;
import ModelAdmin.Room_manage;
import ModelAdmin.Service;
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
@WebServlet(name = "readBookedRoomServlet", urlPatterns = {"/readBookedRoom"})

public class readBookedRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet readBookedRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet readBookedRoomServlet at " + request.getContextPath() + "</h1>");
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
        RoomDAO DAO = new RoomDAO();
        ReservationDAO reservationDAO = new ReservationDAO();
        List<Room_manage> list = DAO.getAllBooked();
        if (list != null) {
            List<Reservation> listre = new ArrayList<>();
            List<Customer> listCus = new ArrayList<>();
            CustomerDAO CustomerDAO = new CustomerDAO();
            ServiceDAO serDAO = new ServiceDAO();

            for (int i = 0; i < list.size(); i++) {
                listre.add(reservationDAO.GetReservation(list.get(i).getCode()));
                listCus.add(CustomerDAO.GetCustomer(listre.get(i).getCustomer_ID()));
            }
            request.setAttribute("data", listre);
            request.setAttribute("datacus", listCus);
            request.getRequestDispatcher("bookedRoom.jsp").forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/readBookedRoom");
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
