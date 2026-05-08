package com.hms.admin.servlet;

import java.io.IOException;

import com.hms.dao.SpecialistDAO;
import com.hms.db.DBConnection;
import com.hms.entity.Specialist;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateSpecialist")
public class UpdateSpecialistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String specialistName = request.getParameter("specialistName");
        
        Specialist specialist = new Specialist(id, specialistName);
        SpecialistDAO specialistDAO = new SpecialistDAO(DBConnection.getConn());
        
        // You'll need to add an update method in SpecialistDAO
        boolean success = specialistDAO.updateSpecialist(specialist);
        
        HttpSession session = request.getSession();
        
        if(success) {
            session.setAttribute("successMsg", "Specialist updated successfully");
        } else {
            session.setAttribute("errorMsg", "Something went wrong on server");
        }
        
        response.sendRedirect("admin/specialist.jsp");
    }
}