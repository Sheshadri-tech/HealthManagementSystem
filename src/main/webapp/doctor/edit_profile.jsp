<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile | Doctor Portal</title>
<%@include file="../component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #1976D2;
    --secondary-color: #0D47A1;
    --success-color: #388E3C;
    --light-color: #f8f9fa;
}

.profile-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 1rem;
}

.profile-card {
    border: none;
    border-radius: 12px;
    box-shadow: 0 6px 30px rgba(0,0,0,0.08);
    overflow: hidden;
    margin-bottom: 2rem;
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

.avatar-container {
    display: flex;
    justify-content: center;
    margin-bottom: 1.5rem;
}

.doctor-avatar {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid white;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

/* Responsive adjustments */
@media (max-width: 992px) {
    .profile-card {
        margin-bottom: 2rem;
    }
    
    .doctor-avatar {
        width: 100px;
        height: 100px;
    }
}

@media (max-width: 768px) {
    .profile-container {
        padding: 1rem;
    }
    
    .card-header {
        padding: 1rem;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test="${empty doctorObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="profile-container">
        <div class="row">
            <!-- Change Password Card -->
            <div class="col-lg-5">
                <div class="profile-card">
                    <div class="card-header">
                        <h5 class="card-title"><i class="fas fa-key"></i>Change Password</h5>
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
                        
                        <form action="../doctorChangePassword" method="post">
                            <div class="mb-3">
                                <label class="form-label">New Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input name="newPassword" type="password" class="form-control" 
                                        placeholder="Enter new password" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Current Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input name="oldPassword" type="password" class="form-control" 
                                        placeholder="Enter current password" required>
                                </div>
                            </div>
                            
                            <input type="hidden" value="${doctorObj.id}" name="doctorId">
                            
                            <button type="submit" class="btn btn-submit text-white w-100">
                                <i class="fas fa-save me-2"></i>Update Password
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            
            <!-- Edit Profile Card -->
            <div class="col-lg-7">
                <div class="profile-card">
                    <div class="card-header">
                        <h5 class="card-title"><i class="fas fa-user-edit"></i>Edit Profile</h5>
                    </div>
                    <div class="card-body p-4">
                        <!-- Success Message -->
                        <c:if test="${not empty successMsgForD}">
                            <div class="alert alert-success alert-message">
                                <i class="fas fa-check-circle me-2"></i>${successMsgForD}
                            </div>
                            <c:remove var="successMsgForD" scope="session"/>
                        </c:if>
                        
                        <!-- Error Message -->
                        <c:if test="${not empty errorMsgForD}">
                            <div class="alert alert-danger alert-message">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsgForD}
                            </div>
                            <c:remove var="errorMsgForD" scope="session"/>
                        </c:if>
                        
                        <div class="avatar-container">
                            <img src="../img/doc1.jpg" alt="Doctor" class="doctor-avatar">
                        </div>
                        
                        <form action="../doctorEditProfile" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Full Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        <input name="fullName" type="text" class="form-control" 
                                            value="${doctorObj.fullName}" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Date of Birth</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                        <input name="dateOfBirth" type="date" class="form-control" 
                                            value="${doctorObj.dateOfBirth}" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Qualification</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-graduation-cap"></i></span>
                                        <input name="qualification" type="text" class="form-control" 
                                            value="${doctorObj.qualification}" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Specialization</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-stethoscope"></i></span>
                                        <select class="form-control" name="specialist" required>
                                            <option value="${doctorObj.specialist}" selected>${doctorObj.specialist}</option>
                                            <%
                                            SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
                                            List<Specialist> spList = spDAO.getAllSpecialist();
                                            for (Specialist sp : spList) {
                                                if (!sp.getSpecialistName().equals(request.getAttribute("doctorObj.specialist"))) {
                                            %>
                                            <option value="<%=sp.getSpecialistName()%>"><%=sp.getSpecialistName()%></option>
                                            <% }
                                            } %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                        <input name="email" type="email" class="form-control" 
                                            value="${doctorObj.email}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Phone</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                        <input name="phone" type="text" class="form-control" 
                                            value="${doctorObj.phone}" required>
                                    </div>
                                </div>
                            </div>
                            
                            <input type="hidden" value="${doctorObj.id}" name="doctorId">
                            
                            <button type="submit" class="btn btn-submit text-white w-100 mt-2">
                                <i class="fas fa-save me-2"></i>Update Profile
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    // Simple form validation
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            const phoneInput = form.querySelector('input[name="phone"]');
            if (phoneInput && !/^[0-9]{10,15}$/.test(phoneInput.value)) {
                e.preventDefault();
                alert('Please enter a valid phone number (10-15 digits)');
                phoneInput.focus();
            }
        });
    });
    </script>
</body>
</html>	