package Controller;

import DAO.DAOAccount;
import Model.User;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateController", urlPatterns = {"/update"})
public class UpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userEmail = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    userEmail = cookie.getValue();
                    break;
                }
            }
        }

        if (userEmail == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        DAOAccount daoAccount = new DAOAccount();
        User user = daoAccount.GetUserByEmail(userEmail);

        if (user != null) {
            request.setAttribute("data", user);
            request.getRequestDispatcher("update.jsp").forward(request, response);
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userEmail = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    userEmail = cookie.getValue();
                    break;
                }
            }
        }

        String formEmail = request.getParameter("email");  //tra be khi khong co email hoac kh dien mail
        if (userEmail == null || !userEmail.equals(formEmail)) {
            response.sendRedirect("error.jsp");
            return;
        }

        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String password = request.getParameter("password");
        String birthdayString = request.getParameter("birthday");

        Date birthday = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(birthdayString);
            birthday = new java.sql.Date(parsedDate.getTime());
        } catch (Exception e) {
            request.setAttribute("error", "Invalid date format.");
            request.getRequestDispatcher("personal.jsp").forward(request, response);
            return;
        }

        User user = new User(customerName, address, phoneNumber, password, birthday, formEmail);
        DAOAccount acc = new DAOAccount();
        boolean update = acc.updateByEmail(user);

        if (update) {
            response.sendRedirect("CombineServlet");
        } else {
            request.setAttribute("error", "Update failed. Please try again.");
            request.getRequestDispatcher("personal.jsp").forward(request, response);
        }
    }
}
