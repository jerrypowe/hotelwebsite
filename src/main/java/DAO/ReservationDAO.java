/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Bill;
import ModelAdmin.Reservation;
import ModelAdmin.ReservationHasService;
import ModelAdmin.Room;
import ModelAdmin.Service;
import Utils.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class ReservationDAO extends DBContext {

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

    public Reservation GetReservationByReservationID(int rm) {
        Reservation re = new Reservation();
        String query = "SELECT * FROM Reservation WHERE Reservation_ID = ? ";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, rm);
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

    public List<ReservationHasService> getAllreHasServices() {
        List<ReservationHasService> list = new ArrayList<>();
        String query = "select rhs.*, rm.Room_Code,r.TotalPrice,r.Check_In_Date,r.CheckOutDate,c.Customer_Name,c.PhoneNumber, s.ServiceName  from Reservation_Has_Services as rhs\n"
                + "join Reservation as r on r.Reservation_ID  = rhs.Reservation_ID\n"
                + "join Customers as c on r.Customer_ID = c.Customer_ID\n"
                + "join Services as s on s.Service_ID = rhs.Service_ID\n"
                + "join Room_Manage as rm on rm.Room_Code = r.Room_Code\n"
                + "join Room as ro on ro.Room_ID = rm.Room_ID\n";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, a);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReservationHasService re = new ReservationHasService(
                        rs.getInt("Reservation_ID"),
                        rs.getInt("Service_ID"),
                        rs.getInt("Quantity"),
                        rs.getFloat("Sales")
                );
                re.setRoomCode(rs.getString("Room_Code"));
                re.setCheckin(rs.getDate("Check_In_Date"));
                re.setCheckOut(rs.getDate("CheckOutDate"));
                re.setCusName(rs.getString("Customer_Name"));
                re.setTotalPrice(rs.getInt("TotalPrice"));
                re.setPhoneNumber(rs.getString("PhoneNumber"));
                re.setServiceName(rs.getString("ServiceName"));
                list.add(re);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<ReservationHasService> getAllreHasServices(String a) {
        List<ReservationHasService> list = new ArrayList<>();
        String query = "select rhs.*, rm.Room_Code,r.TotalPrice,r.Check_In_Date,r.CheckOutDate,c.Customer_Name,c.PhoneNumber, s.ServiceName  from Reservation_Has_Services as rhs\n"
                + "join Reservation as r on r.Reservation_ID  = rhs.Reservation_ID\n"
                + "join Customers as c on r.Customer_ID = c.Customer_ID\n"
                + "join Services as s on s.Service_ID = rhs.Service_ID\n"
                + "join Room_Manage as rm on rm.Room_Code = r.Room_Code\n"
                + "join Room as ro on ro.Room_ID = rm.Room_ID\n"
                + "where rm.Status like ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, a);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReservationHasService re = new ReservationHasService(
                        rs.getInt("Reservation_ID"),
                        rs.getInt("Service_ID"),
                        rs.getInt("Quantity"),
                        rs.getFloat("Sales")
                );
                re.setRoomCode(rs.getString("Room_Code"));
                re.setCheckin(rs.getDate("Check_In_Date"));
                re.setCheckOut(rs.getDate("CheckOutDate"));
                re.setCusName(rs.getString("Customer_Name"));
                re.setTotalPrice(rs.getInt("TotalPrice"));
                re.setPhoneNumber(rs.getString("PhoneNumber"));
                re.setServiceName(rs.getString("ServiceName"));
                list.add(re);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNextReservationId(String email) {

        String sql = "SELECT MAX(Reservation_ID) FROM Reservation WHERE Customer_ID = (SELECT Customer_ID FROM Customers WHERE Email = ?)";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 1;
    }

    public void insertService(int reservationId, int serviceId) {
        String sql = "INSERT INTO Reservation_Has_Services (Reservation_ID, Service_ID) VALUES (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, reservationId);
            statement.setInt(2, serviceId);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertReservation(int reservationId, String name, String email, Date checkin, Date checkout, String roomType) {
        String sql = "INSERT INTO Reservation (Reservation_ID, Name, Email, Check_In_Date, CheckOutDate, Room_Type) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, reservationId);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setDate(4, checkin);
            pstmt.setDate(5, checkout);
            pstmt.setString(6, roomType);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Room> getRoomsByType(String roomType) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room WHERE Room_Type like ? AND Room_ID IN (SELECT Room_ID FROM Room_Manage where Status like 'Available')";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, roomType);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setID(rs.getInt("Room_ID"));
                room.setType(rs.getString("Room_Type"));

                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public void insertReservation(int reservationId, int customerId, String roomCode, double totalPrice, Date checkin, Date checkout) {
        String sql = "INSERT INTO Reservation (Reservation_ID, Customer_ID, Room_Code, TotalPrice, Check_In_Date, Check_Out_Date) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, reservationId);
            pstmt.setInt(2, customerId);
            pstmt.setString(3, roomCode);
            pstmt.setDouble(4, totalPrice);
            pstmt.setDate(5, checkin);
            pstmt.setDate(6, checkout);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int calculateTotalPrice(String roomCode, Date checkin, Date checkout) {
        RoomDAO roomDAO = new RoomDAO();
        int roomPrice = (int) getRoomPriceByCode(roomCode);

        long duration = checkout.getTime() - checkin.getTime();
        int days = (int) duration / (1000 * 60 * 60 * 24);

        return roomPrice * days;
    }

    public double getRoomPriceByCode(String roomCode) {
        double price = 0.0;
        String query = "SELECT * FROM Room WHERE Room_ID IN (SELECT Room_ID FROM Room_Manage WHERE Room_Code like ?)";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, roomCode);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                price = rs.getDouble("Price");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return price;
    }

    public Reservation getLastReservationByEmail(String email) {
        Reservation reservation = null;
        String sql = "	SELECT TOP 1 r.*, c.*\n"
                + "FROM Reservation r\n"
                + "JOIN Customers c ON c.Customer_ID = r.Customer_ID\n"
                + "WHERE c.Email like ? \n"
                + "ORDER BY r.Check_In_Date DESC;";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                reservation = new Reservation();
                reservation.setReservation_ID(rs.getInt("ReservationID"));
                reservation.setCustomer_ID(rs.getInt("Customer_ID"));
                reservation.setRoomCode(rs.getString("Room_Code"));
                reservation.setTotalPrice(rs.getInt("TotalPrice"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservation;
    }

//    public int getTOPReservationID() {
//        String query = "SELECT TOP 1 Reservation_ID FROM Reservation ORDER BY Reservation_ID DESC";
//        int reservationID = 0;
//
//        try {
//            PreparedStatement pstmt = connection.prepareStatement(query);
//            ResultSet rs = pstmt.executeQuery();
//            if (rs.next()) {
//                reservationID = rs.getInt("Reservation_ID");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return reservationID;
//    }
public int getTOPReservationID() {
    String query = "SELECT TOP 1 Reservation_ID FROM Reservation ORDER BY Reservation_ID DESC";
    int reservationID = 0;

    // Sử dụng try-with-resources để tự động đóng tài nguyên
    try (PreparedStatement pstmt = connection.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery()) {
        
        if (rs.next()) {
            reservationID = rs.getInt("Reservation_ID");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return reservationID;
}
public int getReservationID() {
    String query = "SELECT  * FROM Reservation";
    int reservationID = 0;
    List <Reservation> list = new ArrayList<>();
    
    
    try (PreparedStatement pstmt = connection.prepareStatement(query);
         ResultSet rs = pstmt.executeQuery()) {
        
        while (rs.next()) {
            Reservation r = new Reservation(rs.getInt("Reservation_ID"), 
                    rs.getInt("Customer_ID"), 
                    rs.getString("Room_Code"),
                    rs.getInt("TotalPrice"), 
                    rs.getDate("Check_In_Date"),
                    rs.getDate("CheckOutDate")
            );
            list.add(r);
        }
        reservationID = list.size()+1;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return reservationID;
}
    public void Addrhs(int id, int serid, int a, float sale) {
        String query = "INSERT INTO Reservation_Has_Services VALUES (?,?,?,?)";
        a = 1;

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            pstmt.setInt(2, serid);
            pstmt.setInt(3, 1);
            pstmt.setFloat(4, sale);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void AddReservation(int reserid, int cusid, String roomCode, int price, Date checkin, Date checkout) {
        String query = "INSERT INTO Reservation VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, reserid);
            pstmt.setInt(2, cusid);
            pstmt.setString(3, roomCode);

            pstmt.setInt(4, price);
            pstmt.setDate(5, checkin);
            pstmt.setDate(6, checkout);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    
    public void UpdateReservation(int reserid, int cusid, String roomCode, int price, Date checkin, Date checkout) {
    String query = "UPDATE Reservation SET Customer_ID = ?, Room_Code = ?, Price = ?, Check_In_Date = ?, CheckOutDate = ? WHERE Reservation_ID = ?";
    try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        pstmt.setInt(1, cusid);
        pstmt.setString(2, roomCode);
        pstmt.setInt(3, price);
        pstmt.setDate(4, checkin);
        pstmt.setDate(5, checkout);
        pstmt.setInt(6, reserid); // Điều kiện WHERE để xác định bản ghi cần cập nhật

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Reservation updated successfully.");
        } else {
            System.out.println("No reservation found with the given ID.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    public int calculateNumberOfDaysStayed(int reservationId) {
        String query = "SELECT Check_In_Date, CheckOutDate FROM Reservation WHERE Reservation_ID = ?";
        int numberOfDays = 0;

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, reservationId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Date checkInDate = rs.getDate("Check_In_Date");
                Date checkOutDate = rs.getDate("CheckOutDate");

                
                LocalDate checkIn = checkInDate.toLocalDate();
                LocalDate checkOut = checkOutDate.toLocalDate();

        
                numberOfDays =(int) ChronoUnit.DAYS.between(checkIn, checkOut);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numberOfDays;
    }
    public float CalculationHasService(String email) {
        float totalPrice = 0;
        String query = "SELECT \n"
                + "    r.Reservation_ID,\n"
                + "    c.Customer_ID,\n"
                + "    rm.Room_Code,\n"
                + "    room.Price,\n"
                + "    r.TotalPrice,\n"
                + "    r.Check_In_Date,\n"
                + "    r.CheckOutDate,\n"
                + "    DATEDIFF(DAY, r.Check_In_Date, r.CheckOutDate) AS NumberOfDaysStayed,\n"
                + "    ISNULL(SUM(s.Price), 0) AS TotalServiceCost, \n"
                + "    (DATEDIFF(DAY, r.Check_In_Date, r.CheckOutDate) * room.Price + \n"
                + "     ISNULL(SUM(s.Price), 0)) AS TotalCost \n"
                + "FROM \n"
                + "    Reservation r\n"
                + "JOIN \n"
                + "    Reservation_Has_Services rhs ON rhs.Reservation_ID = r.Reservation_ID\n"
                + "JOIN \n"
                + "    Customers c ON r.Customer_ID = c.Customer_ID\n"
                + "JOIN \n"
                + "    Room_Manage rm ON r.Room_Code = rm.Room_Code\n"
                + "JOIN \n"
                + "    Room room ON room.Room_ID = rm.Room_ID\n"
                + "LEFT JOIN \n"
                + "    Services s ON rhs.Service_ID = s.Service_ID\n"
                + "WHERE \n"
                + "    c.Email LIKE ? \n"
                + "    AND r.Check_In_Date = (\n"
                + "        SELECT MAX(Check_In_Date) \n"
                + "        FROM Reservation \n"
                + "        WHERE Customer_ID = c.Customer_ID\n"
                + "    )\n"
                + "GROUP BY \n"
                + "    r.Reservation_ID, \n"
                + "    c.Customer_ID, \n"
                + "    rm.Room_Code, \n"
                + "    room.Price, \n"
                + "    r.TotalPrice, \n"
                + "    r.Check_In_Date, \n"
                + "    r.CheckOutDate;";

        try ( PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, email);
            try ( ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    totalPrice = rs.getFloat("TotalCost");
                } else {
                    System.out.println("No records found for email: " + email);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalPrice;
    }

    public float calculateTotalServiceCost(String roomCode, Date checkin, Date checkout, List<Service> list) {
  
    int rprice = calculateTotalPrice(roomCode, checkin, checkout);
  float  totalServiceCost = 0;
      for(Service s : list){
        totalServiceCost+= s.getPrice();
    }
float total = totalServiceCost + rprice;
    return total;
}

}
