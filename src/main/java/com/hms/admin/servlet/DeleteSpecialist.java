package com.hms.admin.servlet;


import java.io.IOException;

import com.hms.dao.SpecialistDAO;
import com.hms.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteSpecialist")
public class DeleteSpecialist extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        SpecialistDAO specialistDAO = new SpecialistDAO(DBConnection.getConn());
        
        // You'll need to add a delete method in SpecialistDAO
        boolean success = specialistDAO.deleteSpecialist(id);
        
        HttpSession session = request.getSession();
        
        if(success) {
            session.setAttribute("successMsg", "Specialist deleted successfully");
        } else {
            session.setAttribute("errorMsg", "Something went wrong on server");
        }
        
        response.sendRedirect("admin/specialist.jsp");
    }
}