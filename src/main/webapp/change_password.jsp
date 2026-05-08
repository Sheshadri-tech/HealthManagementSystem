<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password | Patient Portal</title>
<%@include file="component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #1976D2;
    --secondary-color: #0D47A1;
    --success-color: #388E3C;
    --danger-color: #D32F2F;
    --light-color: #f8f9fa;
}

.password-container {
    max-width: 500px;
    margin: 2rem auto;
    padding: 0 1rem;
}

.password-card {
    border: none;
    border-radius: 12px;
    box-shadow: 0 6px 30px rgba(0,0,0,0.08);
    overflow: hidden;
}

.card-header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 1.5rem;
    border-bottom: none;
    text-align: center;
}

.card-title {
    font-weight: 600;
    margin-bottom: 0;
    display: flex;
    align-items: center;
    justify-content: center;
}

.card-title i {
    margin-right: 10px;
    font-size: 1.5rem;
}

.form-label {
    font-weight: 600;
    color: var(--secondary-color);
    margin-bottom: 0.5rem;
}

.form-control {
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 12px 15px;
    transition: all 0.3s;
}

.form-control:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.25rem rgba(25, 118, 210, 0.25);
}

.btn-submit {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border: none;
    border-radius: 8px;
    padding: 12px;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s;
    width: 100%;
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

.password-toggle {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #6c757d;
}

.input-group {
    position: relative;
}

.password-strength {
    height: 4px;
    background: #e9ecef;
    border-radius: 2px;
    margin-top: 8px;
    overflow: hidden;
}

.strength-bar {
    height: 100%;
    width: 0;
    transition: width 0.3s;
}

/* Responsive adjustments */
@media (max-width: 576px) {
    .password-container {
        padding: 0 0.5rem;
    }
    
    .card-header {
        padding: 1rem;
    }
}
</style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <c:if test="${empty userObj}">
        <c:redirect url="/user_login.jsp"></c:redirect>
    </c:if>

    <div class="password-container">
        <div class="password-card">
            <div class="card-header">
                <h5 class="card-title"><i class="fas fa-key"></i> Change Password</h5>
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
                
                <form action="userChangePassword" method="post" id="passwordForm">
                    <div class="mb-3">
                        <label class="form-label">Current Password</label>
                        <div class="input-group">
                            <input name="oldPassword" type="password" id="currentPassword" 
                                class="form-control" placeholder="Enter your current password" required>
                            <span class="password-toggle" onclick="togglePassword('currentPassword')">
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">New Password</label>
                        <div class="input-group">
                            <input name="newPassword" type="password" id="newPassword" 
                                class="form-control" placeholder="Create a new password" required
                                oninput="checkPasswordStrength(this.value)">
                            <span class="password-toggle" onclick="togglePassword('newPassword')">
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>
                        <div class="password-strength">
                            <div class="strength-bar" id="strengthBar"></div>
                        </div>
                        <div class="form-text">Password must be at least 8 characters with numbers</div>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label">Confirm New Password</label>
                        <div class="input-group">
                            <input type="password" id="confirmPassword" 
                                class="form-control" placeholder="Re-enter your new password" required>
                            <span class="password-toggle" onclick="togglePassword('confirmPassword')">
                                <i class="fas fa-eye"></i>
                            </span>
                        </div>
                        <div id="passwordMatch" class="form-text"></div>
                    </div>
                    
                    <input type="hidden" value="${userObj.id}" name="userId">
                    
                    <button type="submit" class="btn btn-submit text-white">
                        <i class="fas fa-save me-2"></i> Update Password
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
    // Toggle password visibility
    function togglePassword(id) {
        const input = document.getElementById(id);
        const icon = input.nextElementSibling.querySelector('i');
        
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
    
    // Check password strength
    function checkPasswordStrength(password) {
        const strengthBar = document.getElementById('strengthBar');
        let strength = 0;
        
        if (password.length >= 8) strength += 1;
        if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 1;
        if (password.match(/([0-9])/)) strength += 1;
        if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) strength += 1;
        
        switch(strength) {
            case 0:
                strengthBar.style.width = '0%';
                strengthBar.style.backgroundColor = '#dc3545';
                break;
            case 1:
                strengthBar.style.width = '25%';
                strengthBar.style.backgroundColor = '#dc3545';
                break;
            case 2:
                strengthBar.style.width = '50%';
                strengthBar.style.backgroundColor = '#fd7e14';
                break;
            case 3:
                strengthBar.style.width = '75%';
                strengthBar.style.backgroundColor = '#ffc107';
                break;
            case 4:
                strengthBar.style.width = '100%';
                strengthBar.style.backgroundColor = '#28a745';
                break;
        }
    }
    
    // Confirm password match
    document.getElementById('confirmPassword').addEventListener('input', function() {
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = this.value;
        const matchText = document.getElementById('passwordMatch');
        
        if (confirmPassword === '') {
            matchText.textContent = '';
            matchText.style.color = '';
        } else if (newPassword === confirmPassword) {
            matchText.textContent = 'Passwords match';
            matchText.style.color = '#28a745';
        } else {
            matchText.textContent = 'Passwords do not match';
            matchText.style.color = '#dc3545';
        }
    });
    
    // Form validation
    document.getElementById('passwordForm').addEventListener('submit', function(e) {
        const newPassword = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        
        if (newPassword !== confirmPassword) {
            e.preventDefault();
            alert('Passwords do not match. Please confirm your new password.');
            document.getElementById('confirmPassword').focus();
        }
        
        if (newPassword.length < 8 || !/\d/.test(newPassword)) {
            e.preventDefault();
            alert('Password must be at least 8 characters long and contain at least one number.');
            document.getElementById('newPassword').focus();
        }
    });
    </script>
</body>
</html>