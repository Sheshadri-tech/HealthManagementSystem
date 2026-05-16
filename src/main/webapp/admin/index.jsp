<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | MediCare</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        .admin-dashboard {
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .dashboard-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        
        .stats-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
            height: 100%;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .stats-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #4568dc;
        }
        
        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            color: #2a3f6f;
        }
        
        .stats-label {
            color: #6c757d;
            font-weight: 500;
        }
        
        .modal-content {
            border-radius: 12px;
            border: none;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }
        
        .modal-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            color: white;
            border-radius: 12px 12px 0 0 !important;
        }
        
        .btn-specialist {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            border: none;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-specialist:hover {
            background: linear-gradient(135deg, #3a5acf 0%, #1a6ca8 100%);
            transform: translateY(-2px);
        }
        
        .alert-message {
            border-radius: 8px;
        }
    </style>
</head>
<body class="admin-dashboard">
    <%@include file="navbar.jsp"%>
    
    <!-- Session check -->
    <c:if test="${empty adminObj }">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <!-- Dashboard Header -->
    <div class="dashboard-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">Admin Dashboard</h1>
                    <p class="lead mb-0">Manage your healthcare system efficiently</p>
                </div>
                <div class="col-md-4 text-md-end">
                    <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <i class="fas fa-plus me-2"></i> Add Specialist
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Content -->
    <div class="container">
        <!-- Messages -->
        <c:if test="${not empty successMsg}">
            <div class="alert alert-success alert-message text-center">
                <i class="fas fa-check-circle me-2"></i> ${successMsg}
                <c:remove var="successMsg" scope="session" />
            </div>
        </c:if>
        
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger alert-message text-center">
                <i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
                <c:remove var="errorMsg" scope="session" />
            </div>
        </c:if>
        
        <!-- Statistics Cards -->
        <div class="row">
            <%
            DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
            int totalNumberOfDoctor = docDAO.countTotalDoctor();
            int totalNumberOfUser = docDAO.countTotalUser();
            int totalNumberOfAppointment = docDAO.countTotalAppointment();
            int totalNumberOfSpecialist = docDAO.countTotalSpecialist();
            %>
            
            <div class="col-md-6 col-lg-3">
                <div class="stats-card text-center p-4">
                    <i class="fas fa-user-md stats-icon"></i>
                    <h2 class="stats-number"><%= totalNumberOfDoctor %></h2>
                    <p class="stats-label">Total Doctors</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="stats-card text-center p-4">
                    <i class="fas fa-users stats-icon"></i>
                    <h2 class="stats-number"><%= totalNumberOfUser %></h2>
                    <p class="stats-label">Total Users</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="stats-card text-center p-4">
                    <i class="fas fa-calendar-check stats-icon"></i>
                    <h2 class="stats-number"><%= totalNumberOfAppointment %></h2>
                    <p class="stats-label">Appointments</p>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="stats-card text-center p-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <i class="fas fa-stethoscope stats-icon"></i>
                    <h2 class="stats-number"><%= totalNumberOfSpecialist %></h2>
                    <p class="stats-label">Specialties</p>
                    <small class="text-muted">Click to add new</small>
                </div>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Quick Actions</h5>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="view_doctor.jsp" class="btn btn-outline-primary">
                                <i class="fas fa-user-md me-2"></i> Manage Doctors
                            </a>
                            <a href="patient.jsp" class="btn btn-outline-primary">
                                <i class="fas fa-users me-2"></i> Manage Users
                            </a>
                            <a href="appointments.jsp" class="btn btn-outline-primary">
                                <i class="fas fa-calendar-check me-2"></i> View Appointments
                            </a>
                            <a href="specialist.jsp" class="btn btn-outline-primary">
                                <i class="fas fa-stethoscope me-2"></i> Manage Specialties
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Specialist Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-white" id="exampleModalLabel">
                        <i class="fas fa-plus-circle me-2"></i> Add New Specialist
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../addSpecialist" method="post">
                        <div class="mb-3">
                            <label class="form-label">Specialist Name</label>
                            <input type="text" name="specialistName" 
                                   class="form-control" 
                                   placeholder="Enter specialist name" required>
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn-specialist">
                                <i class="fas fa-save me-2"></i> Add Specialist
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>