/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenrms/licenrm-default.txt to change this licenrm
 * Click nbfs://nbhost/SystemFileSystem/Templates/Clasrms/Class.java to edit this template
 */
package DAO;

import Model.RoomManagement;
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
public class RoomManagementDAO extends DBContext {

    public List<RoomManagement> GetAll() {    //lay het rmrvice
        List<RoomManagement> rmList = new ArrayList<>();
        String query = "Select * from Room_Manage";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RoomManagement rm = new RoomManagement(
                        rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3)
                );
                rmList.add(rm);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return rmList;
    }

    public boolean InsertRoomManage(RoomManagement Rm) {  //them phong managent dua tren id
        String query = "INSERT INTO Room_Manage (Room_Code,Room_ID,Status) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Rm.getRoom_code());
            ps.setInt(2, Rm.getRoom_id());
            ps.setString(3, Rm.getStatus());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean DeleteRoomManageByRoomCode(RoomManagement Rm) {  //xoa phong quan ly dua tren ROOMCODE
        String query = "Delete Room_Manage WHERE Room_Code = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Rm.getRoom_code());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean GetRoomManageByRoomtype(RoomManagement Rm) {  //lay thong tin phong dua tren room_id
        String query = "Select * from Room_Manage where Room_ID=?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, Rm.getRoom_id());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean UpdateStatusRoomManage(RoomManagement Rm) {  //thay doi thong tin dua tren roomtype
        String query = "update Room_Manage set Status = ? where Room_Code='?'";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, Rm.getStatus());
            ps.setString(2, Rm.getRoom_code());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
