<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Appointments | Admin</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        .appointment-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        
        .appointment-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        
        .appointment-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .appointment-table thead th {
            background-color: #4568dc;
            color: white;
            padding: 15px;
            font-weight: 600;
            position: sticky;
            top: 0;
        }
        
        .appointment-table tbody tr {
            transition: all 0.3s;
        }
        
        .appointment-table tbody tr:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .appointment-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .status-completed {
            background-color: #d4edda;
            color: #155724;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .table-container {
            max-height: 600px;
            overflow-y: auto;
        }
        
        .action-btn {
            border: none;
            background: transparent;
            padding: 5px;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            transition: all 0.3s;
        }
        
        .action-btn:hover {
            background-color: #e9ecef;
        }
        
        @media (max-width: 768px) {
            .table-container {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <!-- Header Section -->
    <div class="appointment-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">Patient Appointments</h1>
                    <p class="lead mb-0">View and manage all patient appointments</p>
                </div>
                <div class="col-md-4 text-md-end">
                    <button class="btn btn-light">
                        <i class="fas fa-download me-2"></i> Export
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Appointment Table -->
    <div class="container mb-5">
        <div class="appointment-card">
            <div class="card-body p-0">
                <div class="table-container">
                    <table class="appointment-table">
                        <thead>
                            <tr>
                                <th>Patient Name</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th>Appointment Date</th>
                                <th>Contact</th>
                                <th>Condition</th>
                                <th>Doctor</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                            DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                            List<Appointment> list = appDAO.getAllAppointment();
                            for(Appointment appList : list) {
                                Doctor doctor = docDAO.getDoctorById(appList.getDoctorId());
                                String statusClass = "";
                                switch(appList.getStatus().toLowerCase()) {
                                    case "pending": statusClass = "status-pending"; break;
                                    case "completed": statusClass = "status-completed"; break;
                                    case "cancelled": statusClass = "status-cancelled"; break;
                                    default: statusClass = "";
                                }
                            %>
                            <tr>
                                <td><%= appList.getFullName() %></td>
                                <td><%= appList.getGender() %></td>
                                <td><%= appList.getAge() %></td>
                                <td><%= appList.getAppointmentDate() %></td>
                                <td>
                                    <div><%= appList.getEmail() %></div>
                                    <div class="text-muted small"><%= appList.getPhone() %></div>
                                </td>
                                <td><%= appList.getDiseases() %></td>
                                <td>
                                    <div class="fw-bold"><%= doctor.getFullName() %></div>
                                    <div class="text-muted small"><%= doctor.getSpecialist() %></div>
                                </td>
                                <td>
                                    <span class="<%= statusClass %>">
                                        <i class="fas fa-circle me-1" style="font-size: 8px;"></i>
                                        <%= appList.getStatus() %>
                                    </span>
                                </td>
                                <td>
                                    <button class="action-btn" title="View Details">
                                        <i class="fas fa-eye text-primary"></i>
                                    </button>
                                    <button class="action-btn" title="Edit">
                                        <i class="fas fa-edit text-info"></i>
                                    </button>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>