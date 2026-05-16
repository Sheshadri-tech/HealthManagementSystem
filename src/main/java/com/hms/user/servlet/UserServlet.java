package com.hms.user.servlet;

import java.io.IOException;
import java.util.List;

import com.google.gson.JsonObject;
import com.hms.dao.UserDAO;
import com.hms.db.DBConnection;
import com.hms.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userDAO = new UserDAO(DBConnection.getConn());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("view".equals(action) || "get".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                User user = userDAO.getUserById(id);
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                
                JsonObject json = new JsonObject();

             // Add properties (using addProperty instead of put)
             json.addProperty("id", user.getId());
             json.addProperty("fullName", user.getFullName());
             json.addProperty("email", user.getEmail());
             json.addProperty("phone", user.getPhone());
             json.addProperty("status", user.getStatus());
             json.addProperty("regDate", user.getRegDate().toString()); // Convert Date to String

             // Send response
             response.setContentType("application/json");
             response.getWriter().print(json.toString());
                
                response.getWriter().write(json.toString());
            } else if ("list".equals(action)) {
                List<User> users = userDAO.getAllUsers();
                // Implement JSON response for datatables if needed
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("add".equals(action)) {
                User user = new User();
                user.setFullName(request.getParameter("editFullName"));
                System.out.println("abefkjbfkdjbfd======"+request.getParameter("editFullName"));
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("password"));
                user.setPhone(request.getParameter("phone"));
                user.setStatus(request.getParameter("status"));
                user.setRegDate(java.time.LocalDate.now().toString());
                
                boolean success = userDAO.userRegister(user);
                response.setContentType("text/plain");
                response.getWriter().write(success ? "success" : "failed");
                
            } else if ("update".equals(action)) {
                User user = new User();
                user.setId(Integer.parseInt(request.getParameter("id")));
                user.setFullName(request.getParameter("editFullName"));
                user.setEmail(request.getParameter("email"));
                user.setPhone(request.getParameter("phone"));
                user.setStatus(request.getParameter("status"));
                
                boolean success = userDAO.updateUser(user);
                response.setContentType("text/plain");
                response.getWriter().write(success ? "success" : "failed");
                
            } else if ("toggleStatus".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                boolean success = userDAO.toggleUserStatus(id);
                response.setContentType("text/plain");
                response.getWriter().write(success ? "success" : "failed");
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}