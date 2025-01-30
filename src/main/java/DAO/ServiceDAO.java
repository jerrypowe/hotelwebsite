//
///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package DAO;
//
//import Model.Service;
//import Model.Service;
//import Utils.DBContext;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// *
// * @author admin
// */
//public class ServiceDAO extends DBContext {
//    public List<Service> GetAll() {    //lay het service
//        List<Service> sList = new ArrayList<>();
//        String query = "Select * from Services";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Service se = new Service(
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getDouble(3),
//                        rs.getString(4)
//                        
//                );
//                sList.add(se);
//
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return sList;
//    }
//
//    public boolean Insert(Service service) {  //them service
//        String query = "INSERT INTO Services values (ServiceName,Description,Price,IMAGES) VALUES (?, ?, ?, ?, ?)";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, service.getServiceName());
//            ps.setString(2, service.getDescription());
//            ps.setDouble(3, service.getPrice());
//            ps.setString(4, service.getImages());
//
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public boolean UpdateServicePrince(Service service) { //sua gia service dua tren name service
//        String query = "update Services set Price = ? where ServiceName=?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setDouble(1, service.getPrice());
//            ps.setString(2, service.getServiceName());
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public boolean UpdateServiceDescription(Service service) {  //sua thong tin mieu ta service
//        String query = "update Services set Description = ? where ServiceName=?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, service.getDescription());
//            ps.setString(2, service.getServiceName());
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public boolean DeleteService(Service service) {  //xoa serviec dua tren name , co the sua lai id neu thich
//        String query = "Delete from Services where ServiceName=?";
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, service.getServiceName());
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//    
//    public boolean GetServiceByName(Service service) {  //lay het thong tin dua tren service name
//        String query = "Select * from Services where ServiceName=?";
//
//        try {
//            PreparedStatement ps = connection.prepareStatement(query);
//            ps.setString(1, service.getServiceName());
//            int result = ps.executeUpdate();
//            return result > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ModelAdmin.Service;

import Utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HP
 */
public class ServiceDAO extends DBContext {

    public List<Service> GetAll() {
        List<Service> list = new ArrayList<>();
        String query = "Select  *  from Services";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Service s = new Service(
                        rs.getInt("Service_ID"),
                        rs.getString("ServiceName"),
                        rs.getString("Description"),
                        rs.getInt("Price"),
                        rs.getString("IMAGES")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Service Get(int id) {
        Service s = new Service();
        String query = "select * from Services where Service_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("Service_ID"));
                s.setName(rs.getString("ServiceName"));
                s.setDescription("Description");
                s.setPrice(rs.getInt("Price"));
                s.setImages(rs.getString("IMAGES"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return s;
    }
    public Service Get(String id) {
        Service s = new Service();
        String query = "select * from Services where Service_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt("Service_ID"));
                s.setName(rs.getString("ServiceName"));
                s.setDescription("Description");
                s.setPrice(rs.getInt("Price"));
                s.setImages(rs.getString("IMAGES"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return s;
    }
    public void Update(Service ser) {
        String query = "UPDATE Services SET ServiceName = ?, Description = ?,"
                + "Price=?,"
                + "IMAGES=?"
                + " WHERE Service_ID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, ser.getName());
            pstmt.setString(2, ser.getDescription());
            pstmt.setInt(3, ser.getPrice());
            pstmt.setString(4, ser.getImages());
            pstmt.setInt(5, ser.getId());
            pstmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean Add(Service ser) {
        String query = "INSERT INTO Services (Service_ID, ServiceName, Description,Price,IMAGES) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, ser.getId());
            pstmt.setString(2, ser.getName());
            pstmt.setString(3, ser.getDescription());
            pstmt.setInt(4, ser.getPrice());
            pstmt.setString(5, ser.getImages());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public void Delete(String id) {
        String query = "Delete Services WHERE Service_ID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
