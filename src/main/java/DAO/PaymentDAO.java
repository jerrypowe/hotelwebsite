/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Payment;
import Utils.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
//lay het du lieu cua payment
public class PaymentDAO extends DBContext {

    public List<Payment> GetAll() {
        List<Payment> pList = new ArrayList<>();
        String query = "Select * from Payment";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Payment pa = new Payment(
                        rs.getDate(1),
                        rs.getFloat(2),
                        rs.getString(3)
                );
                pList.add(pa);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return pList;
    }

    public boolean refundPayment(Long paymentId) {  //hoantien thi xoa paymentID( don hang)
        String query = "DELETE FROM Payment WHERE Payment_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setLong(1, paymentId);

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // check thanh toan hay chua bang cach check het database dua tren ID
    public Payment getPaymentStatus(Long paymentId) {
        String query = "SELECT Payment_Date, Total_Amount, Payment_Method FROM Payment WHERE Payment_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setLong(1, paymentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Date paymentDate = rs.getDate("Payment_Date");
                float totalAmount = rs.getFloat("Total_Amount");
                String paymentMethod = rs.getString("Payment_Method");
                return new Payment(paymentDate, totalAmount, paymentMethod);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Payment> listPaymentsByUserId(int userId) { //Payment dua tren ID cua nguoi dung
        List<Payment> payments = new ArrayList<>();
        String query = "SELECT p.Payment_Date, p.Total_Amount, p.Payment_Method "
                + "FROM Payment p "
                + "JOIN Reservation r ON p.Reservation_ID = r.Reservation_ID "
                + "WHERE r.Customer_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Date paymentDate = rs.getDate("Payment_Date");
                float totalAmount = rs.getFloat("Total_Amount");
                String paymentMethod = rs.getString("Payment_Method");
                payments.add(new Payment(paymentDate, totalAmount, paymentMethod));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
}
