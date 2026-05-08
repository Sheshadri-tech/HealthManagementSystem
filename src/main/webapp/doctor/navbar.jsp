<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<style>
:root {
    --nav-primary: #1976D2; /* Professional blue */
    --nav-secondary: #0D47A1; /* Darker blue for hover */
    --nav-accent: #E3F2FD; /* Light blue for contrast */
    --nav-text: white;
}

.doctor-navbar {
    background: linear-gradient(135deg, var(--nav-primary), var(--nav-secondary));
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    padding: 0.5rem 1rem;
}

.navbar-brand {
    font-weight: 600;
    font-size: 1.3rem;
    display: flex;
    align-items: center;
    letter-spacing: 0.5px;
}

.navbar-brand i {
    margin-right: 10px;
    font-size: 1.5rem;
}

.nav-link {
    color: var(--nav-text) !important;
    font-weight: 500;
    padding: 0.5rem 1rem;
    margin: 0 0.2rem;
    border-radius: 4px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
}

.nav-link i {
    margin-right: 8px;
    font-size: 1.1rem;
}

.nav-link:hover, .nav-link.active {
    background-color: rgba(255,255,255,0.15);
    transform: translateY(-1px);
}

.dropdown-toggle {
    color: var(--nav-text) !important;
    border-color: var(--nav-accent) !important;
    font-weight: 500;
    display: flex;
    align-items: center;
    transition: all 0.3s ease;
}

.dropdown-toggle:hover {
    background-color: rgba(255,255,255,0.1) !important;
    transform: translateY(-1px);
}

.dropdown-toggle i {
    margin-right: 8px;
}

.dropdown-menu {
    border: none;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    border-radius: 8px;
    overflow: hidden;
}

.dropdown-item {
    padding: 0.5rem 1rem;
    font-weight: 500;
    transition: all 0.2s;
}

.dropdown-item:hover {
    background-color: var(--nav-accent);
    color: var(--nav-primary) !important;
    transform: translateX(3px);
}

.dropdown-item i {
    margin-right: 8px;
    width: 20px;
    text-align: center;
}

.navbar-toggler {
    border-color: rgba(255,255,255,0.3) !important;
}

.navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%28255, 255, 255, 0.8%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

@media (max-width: 992px) {
    .nav-link {
        margin: 0.2rem 0;
        padding: 0.8rem 1rem;
    }
    
    .dropdown {
        margin-top: 0.5rem;
        width: 100%;
    }
    
    .dropdown-toggle {
        width: 100%;
        justify-content: center;
    }
    
    .dropdown-menu {
        width: 100%;
    }
}
</style>

<nav class="navbar navbar-expand-lg navbar-dark doctor-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa-sharp fa-solid fa-hospital"></i> MediCare Portal
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">
                        <i class="fa-solid fa-house"></i> Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="patient.jsp">
                        <i class="fa-solid fa-user-injured"></i> Patients
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="appointment.jsp">
                        <i class="fa-solid fa-calendar-check"></i> Appointments
                    </a>
                </li>
            </ul>
            
            <div class="dropdown ms-2">
                <button class="btn btn-outline-light dropdown-toggle" type="button"
                    id="dropdownMenuButton1" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <i class="fa-solid fa-user-doctor"></i> Dr. ${doctorObj.fullName}
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                    <li>
                        <a class="dropdown-item" href="edit_profile.jsp">
                            <i class="fa-solid fa-user-pen"></i> Edit Profile
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="edit_profile.jsp">
                            <i class="fa-solid fa-key"></i> Change Password
                        </a>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li>
                        <a class="dropdown-item text-danger" href="../doctorLogout">
                            <i class="fa-solid fa-right-from-bracket"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>