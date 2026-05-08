<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Dashboard | HMS</title>
<%@include file="../component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #2a9d8f;
    --secondary-color: #264653;
    --accent-color: #e9c46a;
    --light-color: #f8f9fa;
    --danger-color: #e76f51;
}

.dashboard-card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 6px 30px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
    overflow: hidden;
    background: white;
}

.dashboard-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.card-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    color: var(--primary-color);
}

.card-value {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--secondary-color);
}

.card-label {
    font-size: 1rem;
    color: #6c757d;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.welcome-section {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border-radius: 15px;
    padding: 2rem;
    color: white;
    margin-bottom: 2rem;
    box-shadow: 0 4px 20px rgba(42, 157, 143, 0.3);
}

.welcome-title {
    font-weight: 600;
    margin-bottom: 0.5rem;
}

.welcome-text {
    opacity: 0.9;
    margin-bottom: 0;
}

.doctor-avatar {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid white;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

.dashboard-container {
    padding: 2rem 0;
}

@media (max-width: 768px) {
    .dashboard-card {
        margin-bottom: 1.5rem;
    }
    
    .welcome-section {
        text-align: center;
    }
    
    .doctor-avatar {
        margin: 0 auto 1rem auto;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <!-- Authentication check -->
    <c:if test="${empty doctorObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="dashboard-container">
        <div class="container">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <div class="row align-items-center">
                    <div class="col-md-2 text-center">
                        <img src="../img/doc1.jpg" alt="Doctor" class="doctor-avatar">
                    </div>
                    <div class="col-md-10">
                        <h3 class="welcome-title">Welcome, Dr. ${doctorObj.fullName}</h3>
                        <p class="welcome-text">You have <strong>${doctorObj.specialist}</strong> specialization</p>
                    </div>
                </div>
            </div>
            
            <%
            DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
            int totalNumberOfDoctor = docDAO.countTotalDoctor();
            Doctor currentLoginDoctor = (Doctor)session.getAttribute("doctorObj");
            %>
            
            <!-- Stats Cards -->
            <div class="row">
                <div class="col-md-6">
                    <div class="dashboard-card p-4 text-center mb-4">
                        <div class="card-icon">
                            <i class="fas fa-user-md"></i>
                        </div>
                        <h2 class="card-value"><%= totalNumberOfDoctor %></h2>
                        <p class="card-label">Total Doctors</p>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="dashboard-card p-4 text-center mb-4">
                        <div class="card-icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <h2 class="card-value"><%= docDAO.countTotalAppointmentByDoctorId(currentLoginDoctor.getId()) %></h2>
                        <p class="card-label">Your Appointments</p>
                    </div>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="dashboard-card p-4">
                        <h5 class="mb-3" style="color: var(--secondary-color);">Quick Actions</h5>
                        <div class="row text-center">
                            <div class="col-md-3 mb-3">
                                <a href="appointment.jsp" class="btn btn-outline-primary w-100 py-3">
                                    <i class="fas fa-calendar-plus me-2"></i> View Appointments
                                </a>
                            </div>
                            <div class="col-md-3 mb-3">
                                <a href="patient.jsp" class="btn btn-outline-success w-100 py-3">
                                    <i class="fas fa-users me-2"></i> View Patients
                                </a>
                            </div>
                            <div class="col-md-3 mb-3">
                                <a href="edit_profile.jsp" class="btn btn-outline-info w-100 py-3">
                                    <i class="fas fa-user-edit me-2"></i> Edit Profile
                                </a>
                            </div>
                            <div class="col-md-3 mb-3">
                                <a href="../doctorLogout" class="btn btn-outline-danger w-100 py-3">
                                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    // Simple animation for cards on page load
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.dashboard-card');
        cards.forEach((card, index) => {
            setTimeout(() => {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 100);
        });
    });
    </script>
</body>
</html>