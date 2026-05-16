<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.DoctorDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Management | HMS</title>
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
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
    overflow: hidden;
}

.card-header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 1.5rem;
    border-bottom: none;
}

.table-responsive {
    overflow-x: auto;
}

.table {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin-bottom: 0;
}

.table th {
    background-color: #f8f9fa;
    color: var(--secondary-color);
    font-weight: 600;
    text-transform: uppercase;
    font-size: 0.75rem;
    letter-spacing: 0.5px;
    border-top: none;
}

.table td {
    vertical-align: middle;
    border-top: 1px solid #f1f1f1;
}

.doctor-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    margin-right: 10px;
}

.btn-action {
    border-radius: 20px;
    padding: 5px 15px;
    font-size: 0.8rem;
    font-weight: 500;
    transition: all 0.3s;
}

.btn-action i {
    margin-right: 5px;
}

.search-container {
    position: relative;
    margin-bottom: 20px;
}

.search-container i {
    position: absolute;
    left: 15px;
    top: 12px;
    color: #6c757d;
}

.search-input {
    padding-left: 40px;
    border-radius: 20px;
    border: 1px solid #e0e0e0;
}

.add-doctor-btn {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    border: none;
    border-radius: 20px;
    padding: 8px 20px;
    font-weight: 500;
    transition: all 0.3s;
}

.add-doctor-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(42, 157, 143, 0.3);
}

.action-buttons .btn {
    margin-right: 5px;
}

/* Hover effects */
.table-hover tbody tr:hover {
    background-color: rgba(42, 157, 143, 0.05);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .table-responsive {
        border: none;
    }
    
    .table thead {
        display: none;
    }
    
    .table tr {
        display: block;
        margin-bottom: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    .table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 15px;
        border: none;
        border-bottom: 1px solid #f1f1f1;
    }
    
    .table td:before {
        content: attr(data-label);
        font-weight: 600;
        color: var(--secondary-color);
        margin-right: 15px;
    }
    
    .action-buttons {
        display: flex;
        justify-content: flex-end;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="fas fa-user-md me-2"></i>Doctor Management</h4>
                        <a href="doctor.jsp" class="btn btn-light add-doctor-btn text-white">
                            <i class="fas fa-plus me-2"></i>Add New Doctor
                        </a>
                    </div>
                    
                    <div class="card-body">
                        <!-- Message alerts -->
                        <c:if test="${not empty successMsg}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>${successMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="successMsg" scope="session" />
                        </c:if>
                        
                        <c:if test="${not empty errorMsg}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i>${errorMsg}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        
                        <!-- Search and filter row -->
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <div class="search-container">
                                    <i class="fas fa-search"></i>
                                    <input type="text" id="searchInput" class="form-control search-input" placeholder="Search doctors...">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <select class="form-select" id="specialistFilter">
                                    <option value="">All Specializations</option>
                                    <%
                                    SpecialistDAO specDAO = new SpecialistDAO(DBConnection.getConn());
                                    List<Specialist> specList = specDAO.getAllSpecialist();
                                    for (Specialist s : specList) {
                                    %>
                                    <option value="<%= s.getSpecialistName() %>"><%= s.getSpecialistName() %></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Doctors table -->
                        <div class="table-responsive">
                            <table class="table table-hover" id="doctorTable">
                                <thead>
                                    <tr>
                                        <th>Doctor</th>
                                        <th>Specialization</th>
                                        <th>Contact</th>
                                        <th>Qualification</th>
                                        <th>Date of Birth</th>
                                        <th class="text-end">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    DoctorDAO docDAO = new DoctorDAO(DBConnection.getConn());
                                    List<Doctor> doctorList = docDAO.getAllDoctor();
                                    SimpleDateFormat dobFormat = new SimpleDateFormat("MMM d, yyyy");
                                    
                                    for (Doctor doctor : doctorList) {
                                    %>
                                    <tr>
                                        <td data-label="Doctor">
                                            <div class="d-flex align-items-center">
                                                <img src="../img/doc1.jpg" alt="Doctor" class="doctor-avatar">
                                                <div>
                                                    <strong><%= doctor.getFullName() %></strong>
                                                    <div class="text-muted small">ID: <%= doctor.getId() %></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td data-label="Specialization">
                                            <span class="badge bg-primary bg-opacity-10 text-primary">
                                                <%= doctor.getSpecialist() %>
                                            </span>
                                        </td>
                                        <td data-label="Contact">
                                            <div><i class="fas fa-envelope me-2 text-muted"></i><%= doctor.getEmail() %></div>
                                            <div><i class="fas fa-phone me-2 text-muted"></i><%= doctor.getPhone() %></div>
                                        </td>
                                        <td data-label="Qualification"><%= doctor.getQualification() %></td>
                                        <td data-label="Date of Birth"><%= doctor.getDateOfBirth() %></td>
                                        <td data-label="Actions" class="text-end action-buttons">
                                            <a href="edit_doctor.jsp?id=<%= doctor.getId() %>" 
                                               class="btn btn-sm btn-action btn-outline-primary" 
                                               title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="../deleteDoctor?id=<%= doctor.getId() %>" 
                                               class="btn btn-sm btn-action btn-outline-danger" 
                                               title="Delete"
                                               onclick="return confirm('Are you sure you want to delete this doctor?');">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    // Search functionality
    document.getElementById('searchInput').addEventListener('input', function() {
        const searchText = this.value.toLowerCase();
        const rows = document.querySelectorAll('#doctorTable tbody tr');
        
        rows.forEach(row => {
            const name = row.cells[0].textContent.toLowerCase();
            const specialization = row.cells[1].textContent.toLowerCase();
            const contact = row.cells[2].textContent.toLowerCase();
            
            if(name.includes(searchText) || specialization.includes(searchText) || contact.includes(searchText)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
    
    // Filter functionality
    document.getElementById('specialistFilter').addEventListener('change', function() {
        const specValue = this.value.toLowerCase();
        const rows = document.querySelectorAll('#doctorTable tbody tr');
        
        rows.forEach(row => {
            const specialization = row.cells[1].textContent.toLowerCase();
            
            if(specValue === '' || specialization.includes(specValue)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
    
    // Initialize tooltips
    document.addEventListener('DOMContentLoaded', function() {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });
    </script>
</body>
</html>