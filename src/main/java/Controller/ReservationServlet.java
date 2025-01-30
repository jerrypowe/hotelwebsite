/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CustomerDAO;
import DAO.DAORevervation;
import DAO.ReservationDAO;
import DAO.RoomDAO;
import DAO.ServiceDAO;
import Model.Room;
import ModelAdmin.Customer;
import ModelAdmin.Reservation;
import ModelAdmin.Room_manage;
import ModelAdmin.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet(name = "ReservationServlet", urlPatterns = {"/ReservationServlet"})
public class ReservationServlet extends HttpServlet {

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
        RoomDAO dao = new RoomDAO();
        List<Room> rList = dao.GetAlluser();

        request.setAttribute("listR", rList);

        ServiceDAO daos = new ServiceDAO();
        List<Service> sList = daos.GetAll();

        request.setAttribute("listS", sList);

        request.getRequestDispatcher("booking.jsp").forward(request, response);

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
        response.setContentType("text/html;charset=UTF-8");
        String username = null;
        Cookie[] cookies = request.getCookies();  // Correctly declare as Cookie array

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    username = cookie.getValue();
                    break;
                }
            }
        }
        CustomerDAO cusDAO = new CustomerDAO();
        String emailcus = username;
        Customer cus = cusDAO.GetCustomerbyEmail(emailcus);
        request.setAttribute("cus", cus);
        RoomDAO dao = new RoomDAO();
        List<Room> rList = dao.GetAlluser();

        request.setAttribute("listR", rList);

        ServiceDAO daos = new ServiceDAO();
        List<Service> sList = daos.GetAll();

        request.setAttribute("listS", sList);

        request.getRequestDispatcher("booking.jsp").forward(request, response);

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
        ReservationDAO reDAO = new ReservationDAO();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String datein = request.getParameter("checkin");
        String dateout = request.getParameter("checkout");
        String roomType = request.getParameter("roomType");
        String[] selectedServices = request.getParameterValues("service");
        RoomDAO roomDAO = new RoomDAO();
        DAORevervation daoRevervation = new DAORevervation();
        ServiceDAO serDAO = new ServiceDAO();
        CustomerDAO cusDAO = new CustomerDAO();
        Date checkin = null;
        Date checkout = null;

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(datein);
            java.util.Date parsedDate2 = dateFormat.parse(dateout);
            checkin = new java.sql.Date(parsedDate.getTime());
            checkout = new java.sql.Date(parsedDate2.getTime());
            if (checkin.after(checkout)) {
                request.setAttribute("error", "Checkin Date cannot after checkoutDate");
                request.getRequestDispatcher("error2.jsp").forward(request, response);
                return;
            }

        } catch (Exception e) {
            request.setAttribute("error", "Invalid date format. Please use yyyy-mm-dd.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }
        Customer cus = cusDAO.GetCustomerbyEmail(email);
        //tra ve cutomer tu email -> se bao gom tat ca thong tin cua khach hang voi email nay
        Room_manage r = roomDAO.getAvailableByType(roomType);
        //lay ra phong trong voi code nho nhat 
        int newid = reDAO.getReservationID() + 1;
        //tao ra id moi cho reservation
        List<Service> listser = new ArrayList<>();
        //tao listservice rong
        if (selectedServices != null) {
            for (String serviceId : selectedServices) {
                listser.add(serDAO.Get(serviceId));
                //them vao list cac dich vu da duoc dat dua tren serviceid
                int id = Integer.parseInt(serviceId);
                reDAO.Addrhs(newid, id, 1, 0);
                //them vao table Reservation Has Service truoc 
                //newid la reservationid moi
                //id la service id
            }
        }
        int price = reDAO.calculateTotalPrice(r.getCode(), checkin, checkout);
        //tinh so tien dua tren ngay checkin va checkout
        reDAO.AddReservation(newid, cus.getID(), r.getCode(), price, checkin, checkout);
        //add reservation moi 
        double roomPrice = reDAO.getRoomPriceByCode(r.getCode());
        //lay ra gia tien phong dua tren id
        float totalcost = reDAO.calculateTotalServiceCost(r.getCode(), checkin, checkout, listser);
        int code = Integer.parseInt(r.getCode());
        reDAO.UpdateReservation(newid, cus.getID(), r.getCode(), (int) totalcost, checkin, checkout);

        // tong so tien roomprice *day + servicePrice
        long numberOfNights = reDAO.calculateNumberOfDaysStayed(newid);
        request.setAttribute("numberofNights", numberOfNights);
        request.setAttribute("checkinTime", checkin);
        request.setAttribute("checkoutTime", checkout);
        request.setAttribute("roomType", roomType);
        request.setAttribute("listser", listser);
        request.setAttribute("cus", cus);
        request.setAttribute("totalcost", totalcost);
        request.setAttribute("roomPrice", roomPrice);
        request.getRequestDispatcher("bill.jsp").forward(request, response);
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
