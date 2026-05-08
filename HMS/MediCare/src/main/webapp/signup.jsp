<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Registration | MediCare</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .register-hero {
            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
                        url('img/register-bg.jpg');
            background-size: cover;
            background-position: center;
            height: 300px;
            display: flex;
            align-items: center;
            color: white;
            margin-bottom: 50px;
        }
        
        .register-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .register-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        
        .register-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            padding: 25px;
            text-align: center;
        }
        
        .register-body {
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
        
        .btn-register {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-register:hover {
            background: linear-gradient(135deg, #3a5acf 0%, #1a6ca8 100%);
            transform: translateY(-2px);
        }
        
        .register-footer {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
        
        .register-footer a {
            color: var(--primary-color);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .register-footer a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
        
        .password-strength {
            height: 5px;
            background: #eee;
            border-radius: 3px;
            margin-top: -15px;
            margin-bottom: 15px;
            overflow: hidden;
        }
        
        .password-strength span {
            display: block;
            height: 100%;
            transition: all 0.3s;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="register-hero">
        <div class="container text-center">
            <h1 class="display-5 fw-bold">Join MediCare</h1>
            <p class="lead">Create your account to access healthcare services</p>
        </div>
    </section>
    
    <!-- Registration Form -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="register-card">
                    <div class="register-header">
                        <h3 class="text-white mb-0">
                            <i class="fas fa-user-plus me-2"></i> Patient Registration
                        </h3>
                    </div>
                    
                    <div class="register-body">
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
                        
                        <form action="user_register" method="post" id="registrationForm">
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Full Name</label>
                                <input name="fullName" type="text" placeholder="Enter your full name" 
                                       class="form-control" required>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Email Address</label>
                                <input name="email" type="email" placeholder="Enter your email" 
                                       class="form-control" required>
                                <div class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Password</label>
                                <input name="password" id="password" type="password" 
                                       placeholder="Create a password" class="form-control" required>
                                <div class="password-strength">
                                    <span id="strength-bar"></span>
                                </div>
                                <div class="form-text">Use 8 or more characters with a mix of letters, numbers & symbols</div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label fw-semibold">Confirm Password</label>
                                <input name="confirmPassword" id="confirmPassword" type="password" 
                                       placeholder="Confirm your password" class="form-control" required>
                                <div id="password-match" class="form-text"></div>
                            </div>
                            
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="termsCheck" required>
                                <label class="form-check-label" for="termsCheck">
                                    I agree to the <a href="#" data-bs-toggle="modal" data-bs-target="#termsModal">Terms of Service</a>
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-register text-white w-100">
                                <i class="fas fa-user-plus me-2"></i> Create Account
                            </button>
                            
                            <div class="register-footer mt-4">
                                Already have an account? <a href="user_login.jsp">Sign in</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Terms Modal -->
    <div class="modal fade" id="termsModal" tabindex="-1" aria-labelledby="termsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="termsModalLabel">Terms of Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h6>1. Acceptance of Terms</h6>
                    <p>By registering with MediCare, you agree to comply with and be bound by these terms of service.</p>
                    
                    <h6>2. Patient Responsibilities</h6>
                    <p>You agree to provide accurate and complete information during registration and to update this information as needed.</p>
                    
                    <h6>3. Privacy Policy</h6>
                    <p>Your personal health information will be protected in accordance with our Privacy Policy and applicable laws.</p>
                    
                    <h6>4. Account Security</h6>
                    <p>You are responsible for maintaining the confidentiality of your account credentials.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">I Understand</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <%@include file="component/footer.jsp"%>
    
    <script>
        // Password strength indicator
        document.getElementById('password').addEventListener('input', function() {
            const password = this.value;
            const strengthBar = document.getElementById('strength-bar');
            let strength = 0;
            
            if (password.length >= 8) strength += 1;
            if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength += 1;
            if (password.match(/\d/)) strength += 1;
            if (password.match(/[^a-zA-Z\d]/)) strength += 1;
            
            // Update strength bar
            if (strength === 0) {
                strengthBar.style.width = '0%';
                strengthBar.style.backgroundColor = 'transparent';
            } else if (strength === 1) {
                strengthBar.style.width = '25%';
                strengthBar.style.backgroundColor = '#ff4d4d';
            } else if (strength === 2) {
                strengthBar.style.width = '50%';
                strengthBar.style.backgroundColor = '#ffa64d';
            } else if (strength === 3) {
                strengthBar.style.width = '75%';
                strengthBar.style.backgroundColor = '#66b3ff';
            } else {
                strengthBar.style.width = '100%';
                strengthBar.style.backgroundColor = '#2ecc71';
            }
        });
        
        // Password match verification
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            const matchText = document.getElementById('password-match');
            
            if (confirmPassword === '') {
                matchText.textContent = '';
                matchText.style.color = '';
            } else if (password === confirmPassword) {
                matchText.textContent = 'Passwords match';
                matchText.style.color = '#2ecc71';
            } else {
                matchText.textContent = 'Passwords do not match';
                matchText.style.color = '#e74c3c';
            }
        });
    </script>
</body>
</html>