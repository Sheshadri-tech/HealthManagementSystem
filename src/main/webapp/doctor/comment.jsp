<%@page import="com.hms.entity.Appointment"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Prescription | HMS</title>
<%@include file="../component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #1976D2;
    --secondary-color: #0D47A1;
    --success-color: #388E3C;
    --light-color: #f8f9fa;
}

.header-banner {
    background: linear-gradient(rgba(25, 118, 210, 0.8), rgba(13, 71, 161, 0.8)),
                url("../img/hospital1.jpg");
    height: 25vh;
    width: 100%;
    background-size: cover;
    background-position: center;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 2rem;
}

.header-title {
    color: white;
    font-size: 2.5rem;
    font-weight: 600;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
}

.prescription-card {
    border: none;
    border-radius: 12px;
    box-shadow: 0 6px 30px rgba(0,0,0,0.08);
    overflow: hidden;
}

.card-header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 1.2rem 1.5rem;
    border-bottom: none;
}

.card-title {
    font-weight: 600;
    margin-bottom: 0;
    display: flex;
    align-items: center;
}

.card-title i {
    margin-right: 10px;
    font-size: 1.4rem;
}

.form-label {
    font-weight: 600;
    color: var(--secondary-color);
    margin-bottom: 0.5rem;
}

.form-control {
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 10px 15px;
    transition: all 0.3s;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.25rem rgba(25, 118, 210, 0.25);
}

.form-control[readonly] {
    background-color: #f8f9fa;
    opacity: 1;
}

.btn-submit {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border: none;
    border-radius: 8px;
    padding: 12px;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s;
}

.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(25, 118, 210, 0.4);
}

.alert-message {
    border-radius: 8px;
    padding: 1rem;
    margin-bottom: 1.5rem;
}

.patient-info {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 1rem;
    margin-bottom: 1.5rem;
}

.patient-info-item {
    display: flex;
    margin-bottom: 0.5rem;
}

.patient-info-label {
    font-weight: 600;
    min-width: 120px;
    color: var(--secondary-color);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .header-title {
        font-size: 2rem;
    }
    
    .patient-info-item {
        flex-direction: column;
    }
    
    .patient-info-label {
        margin-bottom: 0.2rem;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test="${empty doctorObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <!-- Header Banner -->
    <div class="header-banner">
        <h1 class="header-title"><i class="fas fa-comment-medical"></i> Patient Prescription</h1>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="prescription-card">
                    <div class="card-header">
                        <h5 class="card-title"><i class="fas fa-file-prescription"></i> Treatment Details</h5>
                    </div>
                    <div class="card-body p-4">
                        <!-- Success Message -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success alert-message">
                                <i class="fas fa-check-circle me-2"></i>${successMsg}
                            </div>
                            <c:remove var="successMsg" scope="session"/>
                        </c:if>
                        
                        <!-- Error Message -->
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-message">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                            </div>
                            <c:remove var="errorMsg" scope="session"/>
                        </c:if>
                        
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                        Appointment appointment = appDAO.getAppointmentById(id);
                        %>
                        
                        <!-- Patient Information -->
                        <div class="patient-info">
                            <div class="patient-info-item">
                                <span class="patient-info-label"><i class="fas fa-user me-2"></i>Patient Name:</span>
                                <span><%= appointment.getFullName()%></span>
                            </div>
                            <div class="patient-info-item">
                                <span class="patient-info-label"><i class="fas fa-birthday-cake me-2"></i>Age:</span>
                                <span><%= appointment.getAge()%> years</span>
                            </div>
                            <div class="patient-info-item">
                                <span class="patient-info-label"><i class="fas fa-phone me-2"></i>Phone:</span>
                                <span><%= appointment.getPhone()%></span>
                            </div>
                            <div class="patient-info-item">
                                <span class="patient-info-label"><i class="fas fa-disease me-2"></i>Diseases:</span>
                                <span><%= appointment.getDiseases()%></span>
                            </div>
                        </div>
                        
                        <!-- Prescription Form -->
                        <form action="../updateStatus" method="post">
                            <div class="mb-4">
                                <label class="form-label">Prescription Details</label>
                                <textarea name="comment" class="form-control" rows="6" 
                                    placeholder="Enter detailed prescription including medications, dosage, and instructions..." required></textarea>
                            </div>
                            
                            <input type="hidden" name="id" value="<%= appointment.getId()%>">
                            <input type="hidden" name="doctorId" value="<%= appointment.getDoctorId()%>">
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-submit text-white">
                                    <i class="fas fa-paper-plane me-2"></i> Submit Prescription
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    // Auto-resize textarea as user types
    document.querySelector('textarea').addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = (this.scrollHeight) + 'px';
    });
    </script>
</body>
</html>