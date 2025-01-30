package Controller;

import DAO.DAOAccount;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {

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

        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String birthdayString = request.getParameter("birthday");
        String email = request.getParameter("email");
        Date birthday = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(birthdayString);
            birthday = new java.sql.Date(parsedDate.getTime());
        } catch (Exception e) {

            request.setAttribute("error", "Invalid date format. Please use yyyy-mm-dd.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!password.contains(re_password)) {
            request.setAttribute("messs", "You Must Enter Same Password and Repeat Passowrd!!!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            try {
                User newUser = new User(fullname, address, phone, email, password, birthday);
                DAOAccount signupDAO = new DAOAccount();
                boolean success = signupDAO.signup(newUser);

                if (success) {

                    response.sendRedirect("CombineServlet");
                } else {

                    request.setAttribute("error", "Sign up failed. Please try again.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

            } catch (NumberFormatException e) {

                request.setAttribute("error", "Invalid input.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
        processRequest(request, response);
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
