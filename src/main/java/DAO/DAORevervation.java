/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Booking;
import ModelAdmin.Reservation;
import ModelAdmin.ReservationHasService;
import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DAORevervation extends DBContext{
    public List<Booking> GetAll() {  //lay het thong tin dat phong
        List<Booking> bList = new ArrayList<>();  
        String query = "Select * from Reservation";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking boo = new Booking(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDouble(4),           
                        rs.getDate(5),
                        rs.getDate(6)
                        
                );
                bList.add(boo);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return bList;
    }
    
    
      public boolean Insert(Booking booking) {  //them don dat phong
        String query = "insert into Reservation( Reservation_ID,Customer_ID,Room_Code,TotalPrice,Check_In_Date,CheckOutDate) values (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, booking.getRevervation_ID());
            ps.setInt(2, booking.getCustomerID());
            ps.setString(3,booking.getRoom_code());
            ps.setDouble(4,booking.getTotalPrice());
          
            ps.setDate(6, booking.getCheck_in_date());
            ps.setDate(7, booking.getCheck_out_date());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    }  
      
//       public boolean Insert( Reservation re , String service) {  //them don dat phong
//        String query = "insert into Reservation_Has_Services values (?,?,?,?);";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setInt(1, re.getReservation_ID());
//            ps.setString(2, service);
//            ps.setString(3,1);
//            ps.setDouble(4,booking.getTotalPrice());
//          
//          
//
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false; 
//    }  
       public boolean DeleteByID(Booking booking) {  //xoa don dua tren id
        String query = " delete from Reservation where Reservation_ID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, booking.getRevervation_ID());
          
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; 
    } 
       
//    public boolean UpdateReverveseStatus(Booking booking) { //cancelROOM
//        String query = " update Reservation set Status = ? where Reservation_ID=?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, booking.getStatus());
//            ps.setInt(2, booking.getRevervation_ID());
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
    public boolean UpdateRevervesePrince(Booking booking) {  //update gia ca cua don
        String query = " update Reservation set TotalPrice = ? where Reservation_ID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setDouble(1, booking.getTotalPrice());
            ps.setInt(2, booking.getRevervation_ID());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
       
       public Reservation GetReservation(String rm) {
        Reservation re = new Reservation();
        String query = "SELECT * FROM Reservation WHERE Room_Code = ? ";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, rm);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                re.setReservation_ID(rs.getInt("Reservation_ID"));
                re.setCustomer_ID(rs.getInt("Customer_ID"));
                re.setRoom_Code(rs.getString("Room_Code"));
                re.setTotalPrice(rs.getInt("TotalPrice"));
                re.setCheck_Out_Date(rs.getDate("CheckOutDate"));
                re.setCheck_In_Date(rs.getDate("Check_In_Date"));
            }
        } catch (Exception e) {
        }
        return re;
    }


//    public List<Reservation> GetReservationByReservationID(String email) {
//        ReservationHasService re = new ReservationHasService();
//        List<Reservation> list = new ArrayList<>();
//        String query = "  Select * from Reservation      as r \n" +
//"  left join Reservation_Has_Services as rhs on rhs.Reservation_ID = r.Reservation_ID\n" +
//"   left join Customers as c on c.Customer_ID = r.Customer_ID\n" +
//"  where c.Email =?";
//
//        try {
//            PreparedStatement pstmt = connection.prepareStatement(query);
//            pstmt.setString(1, email);
//            ResultSet rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                 re = new ReservationHasService(
//                rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getInt(3),
//                                  
//                      rs.getFloat(4)
//                
//                );
//               list.add(re);
//            };
//        } catch (Exception e) {
//        }
//        return list;
//    }

    public List<ReservationHasService> GetAllReserationHasService() {
        List<ReservationHasService> list = new ArrayList<>();
        String query = "SELECT * FROM Reservation_Has_Services ";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ReservationHasService re = new ReservationHasService(rs.getInt("Reservation_ID"), rs.getInt("Service_ID"), rs.getInt("Quantity"), rs.getInt("Sales"));
                list.add(re);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    
    public ReservationHasService GetReservationHasServices(int reservationid) {
        ReservationHasService re = new ReservationHasService();
        String query = "SELECT * FROM Reservation_Has_Services WHERE Reservation_ID = ? ";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, reservationid);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                re.setReservationid(rs.getInt("Reservation_ID"));
                re.setServiceid(rs.getInt("Service_ID"));
                re.setQuantity(rs.getInt("Quantity"));
                re.setSales(rs.getInt("Sales"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return re;
    }

    public List<ReservationHasService> GetAllReservationHasService() {

        List<ReservationHasService> list = new ArrayList<>();
        String query = "SELECT * FROM Reservation_Has_Services";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReservationHasService re = new ReservationHasService(
                        rs.getInt("Reservation_ID"),
                        rs.getInt("Service_ID"),
                        rs.getInt("Quantity"),
                        rs.getFloat("Sales")
                );

                list.add(re);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
       
    
}
