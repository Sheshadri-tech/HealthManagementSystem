<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login | MediCare</title>
    <%@include file="component/allcss.jsp"%>
    <style>
	        .admin-login-hero {
	            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
	                        url('img/doctor1.jpg');
	            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            color: white;
            margin-bottom: 20px;
        }
        
        .login-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
            max-width: 450px;
            margin: 0 auto;
        }
        
        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        
        .login-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            padding: 25px;
            text-align: center;
        }
        
        .login-body {
            padding: 30px;
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
        
        .btn-login {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
            width: 100%;
            color: white;
        }
        
        .btn-login:hover {
            background: linear-gradient(135deg, #3a5acf 0%, #1a6ca8 100%);
            transform: translateY(-2px);
        }
        
        .alert-message {
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }
        
        .admin-features {
            margin-top: 30px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
        }
        
        .feature-item {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        
        .feature-icon {
            color: var(--primary-color);
            font-size: 1.2rem;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="admin-login-hero">
        <div class="container text-center">
            <h1 class="display-5 fw-bold">Admin Portal</h1>
            <p class="lead">Secure access to healthcare management system</p>
        </div>
    </section>
    
    <!-- Login Form -->
    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="login-card">
                    <div class="login-header">
                        <h3 class="text-white mb-0">
                            <i class="fas fa-lock me-2"></i> Admin Authentication
                        </h3>
                    </div>
                    
                    <div class="login-body">
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
                        
                        <form action="adminLogin" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Email Address</label>
                                <input name="email" type="email" placeholder="Enter admin email" 
                                       class="form-control" required>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Password</label>
                                <input name="password" type="password" placeholder="Enter password" 
                                       class="form-control" required>
                                <div class="form-text">Use your secure admin credentials</div>
                            </div>
                            
                            <button type="submit" class="btn btn-login">
                                <i class="fas fa-sign-in-alt me-2"></i> Login
                            </button>
                        </form>
                        
                        <div class="admin-features mt-4">
                            <h5 class="mb-3 text-center">Admin Portal Features</h5>
                            <div class="feature-item">
                                <i class="fas fa-user-md feature-icon"></i>
                                <span>Doctor Management</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-user feature-icon"></i>
                                <span>User Management</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-calendar-check feature-icon"></i>
                                <span>Appointment Oversight</span>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-chart-line feature-icon"></i>
                                <span>System Analytics</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
</body>
</html>