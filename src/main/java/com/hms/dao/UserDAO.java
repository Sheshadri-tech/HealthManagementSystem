package com.hms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hms.db.DBConnection;
import com.hms.entity.User;

public class UserDAO {

    private final Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    /**
     * Registers a new user in the database
     * @param user User object containing registration details
     * @return true if registration successful, false otherwise
     */
    public boolean userRegister(User user) {
        final String sql = "INSERT INTO user(fullName, email, password, phone, status, regDate) VALUES(?,?,?,?,?,?)";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getFullName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getStatus());
            pstmt.setString(6, user.getRegDate());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            handleSQLException("Error registering user", e);
            return false;
        }
    }

    /**
     * Authenticates a user with email and password
     * @param email User's email
     * @param password User's password
     * @return User object if authentication successful, null otherwise
     */
    public User loginUser(String email, String password) {
        final String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return extractUserFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            handleSQLException("Error during user login", e);
        }
        return null;
    }

    /**
     * Retrieves all users from the database
     * @return List of all User objects
     */
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        final String sql = "SELECT * FROM user ORDER BY regDate DESC";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                users.add(extractUserFromResultSet(rs));
            }
        } catch (SQLException e) {
            handleSQLException("Error retrieving all users", e);
        }
        return users;
    }

    /**
     * Verifies if the old password matches for a user
     * @param userId User ID to verify
     * @param oldPassword Password to check
     * @return true if password matches, false otherwise
     */
    public boolean checkOldPassword(int userId, String oldPassword) {
        final String sql = "SELECT 1 FROM user WHERE id = ? AND password = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            pstmt.setString(2, oldPassword);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            handleSQLException("Error checking old password", e);
            return false;
        }
    }

    /**
     * Updates a user's password
     * @param userId User ID to update
     * @param newPassword New password to set
     * @return true if update successful, false otherwise
     */
    public boolean changePassword(int userId, String newPassword) {
        final String sql = "UPDATE user SET password = ? WHERE id = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, newPassword);
            pstmt.setInt(2, userId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            handleSQLException("Error changing password", e);
            return false;
        }
    }

    /**
     * Extracts user data from ResultSet and creates User object
     * @param rs ResultSet containing user data
     * @return User object populated with data
     * @throws SQLException if database access error occurs
     */
    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setFullName(rs.getString("fullName"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setPhone(rs.getString("phone"));
        user.setStatus(rs.getString("status"));
        user.setRegDate(rs.getString("regDate"));
        return user;
    }

    /**
     * Handles SQL exceptions with consistent logging
     * @param message Error message
     * @param e SQLException
     */
    private void handleSQLException(String message, SQLException e) {
        // Use proper logging framework in production (e.g., SLF4J)
        System.err.println(message + ": " + e.getMessage());
        e.printStackTrace();
    }
    
    public User getUserById(int id) throws SQLException {
        final String sql = "SELECT * FROM user WHERE id = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return extractUserFromResultSet(rs);
                }
            }
        }
        return null;
    }

    public boolean updateUser(User user) throws SQLException {
        final String sql = "UPDATE user SET fullName = ?, email = ?, phone = ?, status = ? WHERE id = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, user.getFullName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhone());
            pstmt.setString(4, user.getStatus());
            pstmt.setInt(5, user.getId());
            
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean toggleUserStatus(int userId) throws SQLException {
        final String sql = "UPDATE user SET status = CASE WHEN status = 'active' THEN 'inactive' ELSE 'active' END WHERE id = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;
        }
    }
    public List<User> getUniquePatientsByDoctor(int doctorId) {
        List<User> list = new ArrayList<User>();
        try {
            Connection conn = DBConnection.getConn();
            String sql = "SELECT DISTINCT p.id, p.fullName, p.email " +
                         "FROM user p " +
                         "JOIN appointment a ON p.id = a.userId " +
                         "WHERE a.doctorId = ? " +
                         "ORDER BY p.fullName";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, doctorId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                User p = new User();
                p.setId(rs.getInt("id"));
                p.setFullName(rs.getString("fullName"));
                p.setEmail(rs.getString("email"));
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}