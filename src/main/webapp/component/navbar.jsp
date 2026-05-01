<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: rgba(69, 104, 220, 0.9); backdrop-filter: blur(5px); transition: all 0.3s ease;">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="fas fa-hospital me-2" style="color: #fff;"></i> 
            <span style="color: white;">MediCare</span>
        </a>
        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center">

                <c:if test="${empty userObj}">
                    <li class="nav-item me-2">
                        <a class="nav-link px-3 py-2 rounded" 
                           style="color: white; transition: all 0.3s;" 
                           href="admin_login.jsp">
                            <i class="fas fa-user-shield me-1"></i> Admin
                        </a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="nav-link px-3 py-2 rounded" 
                           style="color: white; transition: all 0.3s;" 
                           href="doctor_login.jsp">
                            <i class="fas fa-user-md me-1"></i> Doctor
                        </a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="nav-link px-3 py-2 rounded" 
                           style="color: white; transition: all 0.3s;" 
                           href="user_appointment.jsp">
                            <i class="fas fa-calendar-check me-1"></i> Appointment
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-light px-3 py-2 rounded-pill fw-bold" 
                           style="color: #4568dc; transition: all 0.3s;" 
                           href="user_login.jsp">
                            <i class="fas fa-sign-in-alt me-1"></i> Login
                        </a>
                    </li>
                </c:if>

                <c:if test="${not empty userObj}">
                    <li class="nav-item me-2">
                        <a class="nav-link px-3 py-2 rounded" 
                           style="color: white; transition: all 0.3s;" 
                           href="user_appointment.jsp">
                            <i class="fas fa-calendar-plus me-1"></i> Appointment
                        </a>
                    </li>
                    <li class="nav-item me-2">
                        <a class="nav-link px-3 py-2 rounded" 
                           style="color: white; transition: all 0.3s;" 
                           href="view_appointment.jsp">
                            <i class="fas fa-calendar-alt me-1"></i> View Appointments
                        </a>
                    </li>
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" 
                           href="#" id="userDropdown" role="button" 
                           data-bs-toggle="dropdown" aria-expanded="false"
                           style="color: white;">
                            <div class="me-2 d-flex align-items-center">
                                <div class="bg-white rounded-circle d-flex justify-content-center align-items-center" 
                                     style="width: 32px; height: 32px;">
                                    <i class="fas fa-user text-primary"></i>
                                </div>
                                <span class="ms-2">${userObj.fullName}</span>
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end border-0 shadow-lg" 
                            style="border-radius: 10px; min-width: 200px;"
                            aria-labelledby="userDropdown">
                            <li>
                                <a class="dropdown-item py-2 px-3" href="change_password.jsp">
                                    <i class="fas fa-key me-2"></i> Change Password
                                </a>
                            </li>
                            <li><hr class="dropdown-divider my-1"></li>
                            <li>
                                <a class="dropdown-item py-2 px-3 text-danger" href="userLogout">
                                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<style>
    .navbar {
        padding: 15px 0;
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    }
    
    .navbar.scrolled {
        background-color: rgba(69, 104, 220, 0.95) !important;
        padding: 10px 0;
        backdrop-filter: blur(10px);
    }
    
    .nav-link {
        font-weight: 500;
    }
    
    .nav-link:hover, .nav-link:focus {
        background-color: rgba(255, 255, 255, 0.15);
        color: white !important;
    }
    
    .dropdown-menu {
        margin-top: 10px;
    }
    
    .dropdown-item {
        border-radius: 5px;
        margin: 2px 5px;
        width: auto;
    }
    
    .dropdown-item:hover {
        background-color: #f8f9fa;
    }
    
    .navbar-toggler:focus {
        box-shadow: none;
    }
</style>

<script>
    // Add scroll effect to navbar
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 20) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
</script>