<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login | MediCare</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .login-hero {
            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
                        url('img/login-bg.jpg');
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            color: white;
            margin-bottom: 50px;
        }
        
        .login-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
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
        }
        
        .btn-login:hover {
            background: linear-gradient(135deg, #3a5acf 0%, #1a6ca8 100%);
            transform: translateY(-2px);
        }
        
        .login-footer {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
        
        .login-footer a {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .login-footer a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="login-hero">
        <div class="container text-center">
            <h1 class="display-5 fw-bold">Welcome Back</h1>
            <p class="lead">Login to access your health portal</p>
        </div>
    </section>
    
    <!-- Login Form -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-card">
                    <div class="login-header">
                        <h3 class="text-white mb-0">
                            <i class="fas fa-user-circle me-2"></i> User Login
                        </h3>
                    </div>
                    
                    <div class="login-body">
                        <!-- Success Message -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success text-center fs-6">
                                ${successMsg}
                                <c:remove var="successMsg" scope="session" />
                            </div>
                        </c:if>
                        
                        <!-- Error Message -->
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger text-center fs-6">
                                ${errorMsg}
                                <c:remove var="errorMsg" scope="session" />
                            </div>
                        </c:if>
                        
                        <form action="userLogin" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Email Address</label>
                                <input name="email" type="email" placeholder="Enter your email" 
                                       class="form-control" required>
                                <div class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Password</label>
                                <input name="password" type="password" placeholder="Enter your password" 
                                       class="form-control" required>
                            </div>
                            
                            <button type="submit" class="btn btn-login text-white w-100">
                                <i class="fas fa-sign-in-alt me-2"></i> Login
                            </button>
                            
                            <div class="login-footer mt-4">
                                Don't have an account? <a href="signup.jsp">Create one</a>
                                <div class="mt-2">
                                    <a href="forgot-password.jsp">Forgot password?</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
</body>
</html>