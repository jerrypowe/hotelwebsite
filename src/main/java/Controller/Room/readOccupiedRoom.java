/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Room;

import DAO.CustomerDAO;
import DAO.ReservationDAO;
import DAO.RoomDAO;
import ModelAdmin.Customer;
import ModelAdmin.Reservation;
import ModelAdmin.Room_manage;
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
@WebServlet(name = "readOccupiedRoom", urlPatterns = {"/readOccupiedRoom"})
public class readOccupiedRoom extends HttpServlet {

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
        List<Room_manage> list = DAO.getAllOccupied();

        if (list != null) {
            List<Reservation> listre = new ArrayList<>();
            List<Customer> listCus = new ArrayList<>();
            CustomerDAO CustomerDAO = new CustomerDAO();

            for (int i = 0; i < list.size(); i++) {
                listre.add(reservationDAO.GetReservation(list.get(i).getCode()));
                listCus.add(CustomerDAO.GetCustomer(listre.get(i).getCustomer_ID()));
            }

            request.setAttribute("datare", listre);
            request.setAttribute("datacustomer", listCus);
            request.getRequestDispatcher("occupiedRoom.jsp").forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/readOccupiedRoom");
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
