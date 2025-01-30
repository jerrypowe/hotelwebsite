/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ModelAdmin.Customer;
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
public class CustomerDAO extends DBContext {

    public CustomerDAO() {
        super();
    }

    public List<Customer> GetAll() {
        List<Customer> list = new ArrayList<>();
        String query = "Select  *  from Customers";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer(
                        rs.getInt("Customer_ID"),
                        rs.getString("Customer_Name"),
                        rs.getString("Address"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getDate("Birthday")
                );
                list.add(cus);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean AddCustomer(Customer cus) {
        String query = "INSERT INTO Customers (Customer_ID, "
                + "Customer_Name, "
                + "Address,"
                + "PhoneNumber,"
                + "Email,"
                + "Password"
                + ",Birthday) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, cus.getID());
            pstmt.setString(2, cus.getName());
            pstmt.setString(3, cus.getAddress());
            pstmt.setString(4, cus.getPhoneNumber());
            pstmt.setString(5, cus.getEmail());
            pstmt.setString(6, cus.getPassword());
            pstmt.setDate(7, cus.getAge());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public Customer GetCustomer(String id) {
        Customer cus = new Customer();
        String query = "select * from Customers where Customer_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Age"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cus;
    }
      public Customer GetCustomerbyEmail(String email) {
        Customer cus = new Customer();
        String query = "select * from Customers where Email LIKE ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Age"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cus;
    }
    public Customer GetCustomer(int id) {
        Customer cus = new Customer();
        String query = "select * from Customers where Customer_ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Age"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return cus;
    }
    public void UpdateCustomer(Customer cus) {
        String query = "UPDATE Customers SET Customer_Name = ?, "
                + "Address= ?,"
                + "PhoneNumber=?,"
                + "Email=?,"
                + "Password=?,"
                + "Birthday=?"
                + " WHERE Customer_ID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);

            pstmt.setString(1, cus.getName());
            pstmt.setString(2, cus.getAddress());
            pstmt.setString(3, cus.getPhoneNumber());
            pstmt.setString(4, cus.getEmail());
            pstmt.setString(5, cus.getPassword());
            pstmt.setDate(6, cus.getAge());
            pstmt.setInt(7, cus.getID());
            pstmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void DeleteCustomer(int id) {
        String query = "Delete Customer WHERE Customer_ID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Customer> SearchUserByName(String name) {
        List<Customer> list = new ArrayList<>();
        String query = "SELECT * FROM Customers WHERE Customer_Name LIKE ? ";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + name + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUserByAddress(String Address) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Address LIKE ? ";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + Address + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUserByEmail(String Email) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Email LIKE ? ";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + Email + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUserByAge(String email) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Email  LIKE ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + email + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUserByNameAndAddress(String name, String address) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Customer_Name LIKE ? AND Address LIKE ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + name + "%");
            pstmt.setString(2, "%" + address + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUserByNameAndAge(String name, String email) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Customer_Name LIKE ? AND Email LIKE ? '";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + name + "%");
            pstmt.setString(2, "%" + email + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUserByAddressAndAge(String address, String email) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Address LIKE ? AND Email LIKE  ? '";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + address + "%");
            pstmt.setString(2, "%" + email + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Customer> SearchUser(String name, String address, String email) {
        List<Customer> list = new ArrayList<>();

        String query = "SELECT * FROM Customers WHERE Customer_Name LIKE ? AND Address LIKE ? AND Email LIKE ? '";
        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, "%" + name + "%");
            pstmt.setString(2, "%" + address + "%");
            pstmt.setString(3, "%" + email + "%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setID(rs.getInt("Customer_ID"));
                cus.setName(rs.getString("Customer_Name"));
                cus.setAddress(rs.getString("Address"));
                cus.setPhoneNumber(rs.getString("PhoneNumber"));
                cus.setEmail(rs.getString("Email"));
                cus.setPassword(rs.getString("Password"));
                cus.setAge(rs.getDate("Birthday"));
                list.add(cus);
            }
        } catch (Exception e) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public boolean VerifyAccount(String name, String pass) {
        boolean status = false;
        Customer cus = new Customer();
        String query = "SELECT * FROM Customers WHERE Email=? AND Password=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
            status = rs.next();
//                     cus.setID(rs.getInt("Customer_ID"));
//                cus.setName(rs.getString("Customer_Name"));
//                cus.setAddress(rs.getString("Address"));
//                cus.setPhoneNumber(rs.getString("PhoneNumber"));
//                cus.setEmail(rs.getString("Email"));
//                cus.setPassword(rs.getString("Password"));
//                cus.setAge(rs.getInt("Age"));

//            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

}
