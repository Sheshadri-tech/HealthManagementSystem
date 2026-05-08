<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="fas fa-hospital me-2"></i> MediCare Admin
        </a>
        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link px-3 py-2 rounded" href="index.jsp">
                        <i class="fas fa-home me-1"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 py-2 rounded" href="doctor.jsp">
                        <i class="fas fa-user-md me-1"></i> Doctors
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 py-2 rounded" href="view_doctor.jsp">
                        <i class="fas fa-list me-1"></i> View Doctors
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 py-2 rounded" href="patient.jsp">
                        <i class="fas fa-user-injured me-1"></i> Patients
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 py-2 rounded" href="appointments.jsp">
                        <i class="fas fa-calendar-check me-1"></i> Appointments
                    </a>
                </li>
            </ul>

            <div class="dropdown">
                <button class="btn btn-light dropdown-toggle d-flex align-items-center" type="button"
                    id="dropdownMenuButton1" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <div class="me-2 d-flex align-items-center">
                        <div class="bg-primary rounded-circle d-flex justify-content-center align-items-center" 
                             style="width: 32px; height: 32px;">
                            <i class="fas fa-user-shield text-white"></i>
                        </div>
                        <span class="ms-2">Admin</span>
                    </div>
                </button>
                <ul class="dropdown-menu dropdown-menu-end border-0 shadow-lg" 
                    style="border-radius: 10px; min-width: 200px;"
                    aria-labelledby="dropdownMenuButton1">
                    <li>
                        <a class="dropdown-item py-2 px-3" href="#">
                            <i class="fas fa-user-cog me-2"></i> Profile
                        </a>
                    </li>
                    <li><hr class="dropdown-divider my-1"></li>
                    <li>
                        <a class="dropdown-item py-2 px-3 text-danger" href="../adminLogout">
                            <i class="fas fa-sign-out-alt me-2"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<style>
    .navbar {
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        padding: 15px 0;
        transition: all 0.3s;
    }
    
    .nav-link {
        font-weight: 500;
        color: rgba(255,255,255,0.9);
        transition: all 0.3s;
    }
    
    .nav-link:hover, .nav-link:focus {
        background-color: rgba(255,255,255,0.15);
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