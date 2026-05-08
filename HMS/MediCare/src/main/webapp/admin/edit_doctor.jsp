<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor | HMS</title>
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

.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 6px 30px rgba(0,0,0,0.1);
    overflow: hidden;
}

.card-header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 1.5rem;
    border-bottom: none;
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
    box-shadow: 0 0 0 0.25rem rgba(42, 157, 143, 0.25);
}

.btn-update {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border: none;
    border-radius: 8px;
    padding: 12px;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s;
}

.btn-update:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(42, 157, 143, 0.4);
}

.avatar-container {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.doctor-avatar {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid white;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

.alert-notification {
    border-radius: 8px;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .card {
        margin-top: 20px;
    }
    
    .doctor-avatar {
        width: 100px;
        height: 100px;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container-fluid py-4">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="card">
                    <div class="card-header text-center">
                        <h4 class="mb-0"><i class="fas fa-user-edit me-2"></i>Edit Doctor Profile</h4>
                    </div>
                    
                    <div class="card-body p-4">
                        <!-- Message alerts -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success alert-dismissible fade show alert-notification" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${successMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>
                        
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-dismissible fade show alert-notification" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                        Doctor doctor = docDAO.getDoctorById(id);
                        %>

                        <div class="avatar-container">
                            <img src="../img/doc1.jpg" alt="Doctor" class="doctor-avatar">
                        </div>
                        
                        <form action="../updateDoctor" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Full Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        <input name="fullName" type="text" class="form-control" 
                                            placeholder="Enter full name" value="<%=doctor.getFullName()%>" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Date of Birth</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                                        <input name="dateOfBirth" type="date" class="form-control" 
                                            value="<%=doctor.getDateOfBirth()%>" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Qualification</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-graduation-cap"></i></span>
                                        <input name="qualification" type="text" class="form-control" 
                                            placeholder="Enter qualification" value="<%=doctor.getQualification()%>" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Specialization</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-stethoscope"></i></span>
                                        <select class="form-control" name="specialist" required>
                                            <option value="<%=doctor.getSpecialist()%>" selected><%=doctor.getSpecialist()%></option>
                                            <%
                                            SpecialistDAO spDAO = new SpecialistDAO(DBConnection.getConn());
                                            List<Specialist> spList = spDAO.getAllSpecialist();
                                            for (Specialist sp : spList) {
                                                if (!sp.getSpecialistName().equals(doctor.getSpecialist())) {
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
                                            placeholder="Enter email" value="<%=doctor.getEmail()%>" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Phone</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                        <input name="phone" type="text" class="form-control" 
                                            placeholder="Enter phone number" value="<%=doctor.getPhone()%>" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input name="password" type="password" class="form-control" 
                                        placeholder="Enter password" value="<%=doctor.getPassword()%>" required>
                                    <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            
                            <input name="id" type="hidden" value="<%=doctor.getId()%>">
                            
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-update text-white">
                                    <i class="fas fa-save me-2"></i>Update Doctor Profile
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordInput = document.querySelector('input[name="password"]');
        const icon = this.querySelector('i');
        
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
    
    // Add form validation
    document.querySelector('form').addEventListener('submit', function(e) {
        const phoneInput = document.querySelector('input[name="phone"]');
        const phoneRegex = /^[0-9]{10,15}$/;
        
        if (!phoneRegex.test(phoneInput.value)) {
            e.preventDefault();
            alert('Please enter a valid phone number (10-15 digits)');
            phoneInput.focus();
        }
    });
    </script>
</body>
</html>