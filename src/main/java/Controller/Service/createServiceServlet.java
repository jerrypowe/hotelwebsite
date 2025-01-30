/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Service;

import DAO.ServiceDAO;
import ModelAdmin.Service;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.List;

/**
 *
 * @author HP
 */
@WebServlet(name = "createServiceServlet", urlPatterns = {"/createService"})

public class createServiceServlet extends HttpServlet {

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
            out.println("<title>Servlet createServiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet createServiceServlet at " + request.getContextPath() + "</h1>");
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
        ServiceDAO DAO = new ServiceDAO();
        List<Service> list = DAO.GetAll();
        int id = list.size() + 1;
        if (!list.isEmpty()) {
            request.setAttribute("data", id);
            request.getRequestDispatcher("createservice.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/createService");
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
        String service_id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String service_price = request.getParameter("price");
        String Image = "img/service/" + request.getParameter("images");
        if (!service_id.isEmpty() && !name.isEmpty()) {
            ServiceDAO DAO = new ServiceDAO();
            int id = Integer.parseInt(service_id);
            int price = Integer.parseInt(service_price);
            boolean result = DAO.Add(
                    new Service(id, name, description, price, Image)
            );
            if (result) {
                response.sendRedirect(request.getContextPath() + "/readService");
            } else {
            }
        }
//  String service_id = request.getParameter("id");
//    String name = request.getParameter("name");
//    String description = request.getParameter("description");
//    String service_price = request.getParameter("price");
//
//    // Xử lý tệp hình ảnh
//    Part imagePart = request.getPart("images");
//    String imageFileName = imagePart.getSubmittedFileName();
//    String imagePath = "img/service/" + imageFileName;
//
//    if (service_id != null && !service_id.isEmpty() && name != null && !name.isEmpty()) {
//        ServiceDAO DAO = new ServiceDAO();
//        int id = Integer.parseInt(service_id);
//        int price = Integer.parseInt(service_price);
//
//        // Lưu tệp hình ảnh vào thư mục
//        imagePart.write(imagePath); // Lưu tệp vào đường dẫn đã chỉ định
//
//        boolean result = DAO.Add(new Service(id, name, description, price, imagePath));
//        if (result) {
//            response.sendRedirect(request.getContextPath() + "/readService");
//        } else {
//            // Xử lý lỗi
//        }
//    }
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
