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

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
          
            AdminDAO dao = new AdminDAO(DBConnection.getConn());
            Admin admin = dao.login(email, password);
            HttpSession session = req.getSession();
            if (admin != null) {
                session.setAttribute("adminObj", admin);
                resp.sendRedirect("admin/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid Username or Password.");
                resp.sendRedirect("admin_login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
