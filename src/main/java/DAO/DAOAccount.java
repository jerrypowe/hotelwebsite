/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import Utils.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DAOAccount extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<User> GetAll() { //lay het thong tin user
        List<User> uList = new ArrayList<>();
        String query = "Select * from Customers";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User us = new User(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDate(6)
                );
                uList.add(us);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return uList;
    }

    public boolean validate(String username, String password) {  //login
        boolean status = false;
        try {

            String query = "SELECT * FROM Customers WHERE Email = ? AND Password = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean signup(User user) {  //dangky ghi thong tin vao database
        String query = "INSERT INTO Customers (Customer_Name, Address, PhoneNumber, Email, Password, Birthday) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);

            ps.setString(1, user.getCustomerName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setDate(6, user.getBirthday());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean DeleteByID(User user) {   //xoataikhoan dua tren ID
        String query = "DELETE FROM Customers WHERE Email = ?;";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user.getId());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean GetUserByID(User user) {  //lay thong tin User dua trn ID
        String query = "Select * from Customer where Customer_ID=?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user.getId());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean Insert(User user) {  //THem user ( tuong tu signup)
        String query = "INSERT INTO Customers (Customer_ID, Customer_Name, Address, PhoneNumber, Email, Password, Age) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, user.getId());
            ps.setString(2, user.getCustomerName());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getPassword());
            ps.setDate(7, user.getBirthday());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public User GetUserByEmail(String email) {
        String query = "SELECT * FROM Customers WHERE Email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String customerName = rs.getString("Customer_Name");
                String address = rs.getString("Address");
                String phoneNumber = rs.getString("PhoneNumber");
                String password = rs.getString("Password");
                Date birthday = rs.getDate("Birthday");

                return new User(customerName, address, phoneNumber, email, password, birthday);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateByEmail(User user) {
        String query = "UPDATE Customers SET Customer_Name = ?, Address = ?, PhoneNumber = ?, Password = ?, Birthday = ? WHERE Email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, user.getCustomerName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getPhoneNumber());
            ps.setString(4, user.getPassword());
            ps.setDate(5, user.getBirthday());
            ps.setString(6, user.getEmail());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
