/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Room;

import DAO.RoomDAO;
import ModelAdmin.Room;
import ModelAdmin.Room_manage;
import com.nimbusds.jose.crypto.impl.AAD;
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
@WebServlet(name = "UpdateRoomServlet", urlPatterns = {"/UpdateRoom"})

public class UpdateRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateRoomServlet at " + request.getContextPath() + "</h1>");
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
        String code = request.getParameter("RoomCode");
        RoomDAO DAO = new RoomDAO();
        Room_manage room = DAO.GetRoom(code);
        if (!room.getCode().isEmpty()) {
            request.setAttribute("room", room);
            request.getRequestDispatcher("roomUpdateAdmin.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/RoomManageServlet");
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
        String roomCode = request.getParameter("RoomCode");
//        boolean available = request.getParameter("avai_")  != null;
//        boolean booked = request.getParameter("booked_" ) != null;
//        boolean occupied = request.getParameter("occup_") != null;
        String roomStatus = request.getParameter("RoomStatus");
        RoomDAO DAO = new RoomDAO();
        if (roomStatus != null) {

            switch (roomStatus) {
                case "available":
                    DAO.UpdateCustomer("Available", roomCode);
                    response.sendRedirect(request.getContextPath() + "/RoomManageServlet");
                    break;
                case "Booked":
                    DAO.UpdateCustomer("Booked", roomCode);
                    response.sendRedirect(request.getContextPath() + "/RoomManageServlet");
                    break;
                case "Occupied":
                    DAO.UpdateCustomer("Occupied", roomCode);
                    response.sendRedirect(request.getContextPath() + "/RoomManageServlet");
                    break;
                default:
                    break;
            }
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
