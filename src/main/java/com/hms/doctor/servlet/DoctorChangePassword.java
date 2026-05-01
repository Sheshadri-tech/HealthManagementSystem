package com.hms.doctor.servlet;

import java.io.IOException;

import com.hms.dao.DoctorDAO;
import com.hms.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorChangePassword")
public class DoctorChangePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		String newPassword = req.getParameter("newPassword");
		String oldPassword = req.getParameter("oldPassword");

		DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());

		HttpSession session = req.getSession();

		if (doctorDAO.checkOldPassword(doctorId, oldPassword)) {

			if (doctorDAO.changePassword(doctorId, newPassword)) {
				
				session.setAttribute("successMsg", "Password change successfully.");
				resp.sendRedirect("doctor/edit_profile.jsp");

			} else {
				
				session.setAttribute("errorMsg", "Something went wrong on server!");
				resp.sendRedirect("doctor/edit_profile.jsp");

			}

		} else {
			session.setAttribute("errorMsg", "Old Password not match");
			resp.sendRedirect("doctor/edit_profile.jsp");

		}
	}

}
