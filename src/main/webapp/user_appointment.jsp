<%@page import="com.hms.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment | MediCare</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        .appointment-hero {
            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
                        url('img/hospital4.jpg');
            background-size: cover;
            background-position: center;
            height: 250px;
            display: flex;
            align-items: center;
            color: white;
            margin-bottom: 20px;
        }
        
        .appointment-container {
            background-color: #f8f9fa;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .appointment-image {
            background: url('img/doc3.jpg') center/cover no-repeat;
            min-height: 500px;
        }
        
        .appointment-form {
            padding: 40px;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-header h2 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            margin-bottom: 20px;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(69, 104, 220, 0.25);
            border-color: var(--primary-color);
        }
        
        .btn-appointment {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
            width: 100%;
            color: white;
        }
        
        .btn-appointment:hover {
            background: linear-gradient(135deg, #3a5acf 0%, #1a6ca8 100%);
            transform: translateY(-2px);
        }
        
        .alert-message {
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        @media (max-width: 768px) {
            .appointment-image {
                min-height: 300px;
            }
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="appointment-hero">
        <div class="container text-center">
            <h1 class="display-5 fw-bold">Book Your Appointment</h1>
            <p class="lead">Schedule your visit with our specialist doctors</p>
        </div>
    </section>
    
    <!-- Appointment Form Section -->
    <div class="container mb-5">
        <div class="appointment-container">
            <div class="row g-0">
                <!-- Image Column -->
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="appointment-image h-100"></div>
                </div>
                
                <!-- Form Column -->
                <div class="col-lg-6">
                    <div class="appointment-form">
                        <div class="form-header">
                            <h2><i class="fas fa-calendar-check me-2"></i> Appointment Form</h2>
                            <p>Fill out the form to book your appointment</p>
                        </div>
                        
                        <!-- Success Message -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success alert-message">
                                <i class="fas fa-check-circle me-2"></i> ${successMsg}
                                <c:remove var="successMsg" scope="session" />
                            </div>
                        </c:if>
                        
                        <!-- Error Message -->
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-message">
                                <i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
                                <c:remove var="errorMsg" scope="session" />
                            </div>
                        </c:if>
                        
                        <form action="addAppointment" method="post">
                            <!-- Hidden user ID field -->
                            <input type="hidden" name="userId" value="${userObj.id}">
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Full Name</label>
                                    <input name="fullName" type="text" placeholder="Enter full name"
                                           class="form-control" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Gender</label>
                                    <select class="form-control" name="gender" required>
                                        <option selected disabled>Select Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                        <option value="other">Other</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Age</label>
                                    <input name="age" type="number" placeholder="Enter your age"
                                           class="form-control" min="1" max="120" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Appointment Date</label>
                                    <input name="appointmentDate" type="date" 
                                           class="form-control" min="${java.time.LocalDate.now()}" required>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Email</label>
                                    <input name="email" type="email" placeholder="Enter email"
                                           class="form-control" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Phone</label>
                                    <input name="phone" type="tel" placeholder="Enter mobile number"
                                           class="form-control" pattern="[0-9]{10}" required>
                                    <small class="text-muted">Format: 1234567890</small>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Diseases</label>
                                    <input name="diseases" type="text" placeholder="Enter symptoms/diseases"
                                           class="form-control" required>
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold">Doctor</label>
                                    <select class="form-control" name="doctorNameSelect" required>
                                        <option selected disabled>Select Doctor</option>
                                        <%
                                        DoctorDAO doctorDAO = new DoctorDAO(DBConnection.getConn());
                                        List<Doctor> listOfDoctor = doctorDAO.getAllDoctor();
                                        for(Doctor d : listOfDoctor) {
                                        %>
                                        <option value="<%= d.getId() %>">
                                            Dr. <%= d.getFullName() %> (<%= d.getSpecialist() %>)
                                        </option>
                                        <%
                                        }
                                        %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Full Address</label>
                                <textarea name="address" class="form-control" rows="3" 
                                          placeholder="Enter your complete address" required></textarea>
                            </div>
                            
                            <c:choose>
                                <c:when test="${empty userObj}">
                                    <a href="user_login.jsp" class="btn btn-appointment">
                                        <i class="fas fa-sign-in-alt me-2"></i> Login to Book Appointment
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" class="btn btn-appointment">
                                        <i class="fas fa-calendar-plus me-2"></i> Book Appointment
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="component/footer.jsp"%>
    
    <script>
        // Set minimum date for appointment (today)
        document.querySelector('input[name="appointmentDate"]').min = new Date().toISOString().split('T')[0];
        
        // Phone number validation
        document.querySelector('input[name="phone"]').addEventListener('input', function() {
            this.value = this.value.replace(/[^0-9]/g, '');
        });
    </script>
</body>
</html>