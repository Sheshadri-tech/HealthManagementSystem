package com.hms.admin.servlet;

import java.io.IOException;

import com.hms.dao.AdminDAO;
import com.hms.db.DBConnection;
import com.hms.entity.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String newPassword = req.getParameter("newPassword");
            HttpSession session = req.getSession();
            Admin admin = (Admin) session.getAttribute("adminObj");

            AdminDAO dao = new AdminDAO(DBConnection.getConn());
            boolean changed = dao.changePassword(admin.getId(), newPassword);

            if (changed) {
                session.setAttribute("successMsg", "Password updated successfully.");
            } else {
                session.setAttribute("errorMsg", "Failed to update password.");
            }

            resp.sendRedirect("profile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
