package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hms.entity.Admin;

public class AdminDAO {

    private Connection conn;

    public AdminDAO(Connection conn) {
        this.conn = conn;
    }

    public Admin login(String email, String password) {
        Admin admin = null;
        try {
            String sql = "SELECT * FROM admin_details WHERE admin_email=? AND admin_password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("admin_name"));
                admin.setEmail(rs.getString("admin_email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }

    public boolean changePassword(int id, String newPassword) {
        boolean success = false;
        try {
            String sql = "UPDATE admin_details SET admin_password=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, id);

            int rows = ps.executeUpdate();
            success = rows == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}
