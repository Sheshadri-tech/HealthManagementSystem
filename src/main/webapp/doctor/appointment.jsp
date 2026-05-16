<%@page import="com.hms.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.entity.Doctor"%>
<%@page import="com.hms.dao.AppointmentDAO"%>
<%@page import="com.hms.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Appointments | HMS</title>
<%@include file="../component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #1976D2;
    --secondary-color: #0D47A1;
    --success-color: #388E3C;
    --warning-color: #F57C00;
    --danger-color: #D32F2F;
    --light-color: #f8f9fa;
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
    padding: 1rem 1.5rem;
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
    background-color: #f5f7fa;
    color: var(--secondary-color);
    font-weight: 600;
    text-transform: uppercase;
    font-size: 0.75rem;
    letter-spacing: 0.5px;
    border-top: none;
    white-space: nowrap;
}

.table td {
    vertical-align: middle;
    border-top: 1px solid #f1f1f1;
}

.status-badge {
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
}

.status-pending {
    background-color: #FFF3E0;
    color: var(--warning-color);
}

.status-completed {
    background-color: #E8F5E9;
    color: var(--success-color);
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
    max-width: 300px;
}

.filter-container {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
    flex-wrap: wrap;
}

.filter-select {
    border-radius: 20px;
    border: 1px solid #e0e0e0;
    padding: 8px 15px;
}

.btn-action {
    border-radius: 20px;
    padding: 5px 15px;
    font-size: 0.8rem;
    font-weight: 500;
    transition: all 0.3s;
    white-space: nowrap;
}

.btn-action i {
    margin-right: 5px;
}

/* Hover effects */
.table-hover tbody tr:hover {
    background-color: rgba(25, 118, 210, 0.05);
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
    
    .btn-action {
        width: 100%;
        text-align: center;
    }
    
    .search-container {
        width: 100%;
    }
    
    .search-input {
        max-width: 100%;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <!-- Authentication check -->
    <c:if test="${empty doctorObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="fas fa-calendar-check me-2"></i>Patient Appointments</h4>
                        <div class="search-container">
                            <i class="fas fa-search"></i>
                            <input type="text" id="searchInput" class="form-control search-input" placeholder="Search patients...">
                        </div>
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
                        
                        <!-- Filters -->
                        <div class="filter-container">
                            <select class="form-select filter-select" id="statusFilter">
                                <option value="">All Statuses</option>
                                <option value="Pending">Pending</option>
                                <option value="Completed">Completed</option>
                            </select>
                            
                            <select class="form-select filter-select" id="genderFilter">
                                <option value="">All Genders</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        
                        <!-- Appointments table -->
                        <div class="table-responsive">
                            <table class="table table-hover" id="appointmentTable">
                                <thead>
                                    <tr>
                                        <th>Patient Name</th>
                                        <th>Gender</th>
                                        <th>Age</th>
                                        <th>Appointment Date</th>
                                        <th>Contact</th>
                                        <th>Diseases</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    Doctor doctor = (Doctor) session.getAttribute("doctorObj");
                                    AppointmentDAO appDAO = new AppointmentDAO(DBConnection.getConn());
                                    List<Appointment> list = appDAO.getAllAppointmentByLoginDoctor(doctor.getId());
                                    for (Appointment applist : list) {
                                        String statusClass = "Pending".equals(applist.getStatus()) ? "status-pending" : "status-completed";
                                    %>
                                    <tr>
                                        <td data-label="Patient Name"><%=applist.getFullName()%></td>
                                        <td data-label="Gender"><%=applist.getGender()%></td>
                                        <td data-label="Age"><%=applist.getAge()%></td>
                                        <td data-label="Appointment Date"><%=applist.getAppointmentDate()%></td>
                                        <td data-label="Contact">
                                            <div><i class="fas fa-envelope text-muted me-2"></i><%=applist.getEmail()%></div>
                                            <div><i class="fas fa-phone text-muted me-2"></i><%=applist.getPhone()%></div>
                                        </td>
                                        <td data-label="Diseases"><%=applist.getDiseases()%></td>
                                        <td data-label="Status">
                                            <span class="status-badge <%=statusClass%>">
                                                <%=applist.getStatus()%>
                                            </span>
                                        </td>
                                        <td data-label="Action">
                                            <% if ("Pending".equals(applist.getStatus())) { %>
                                                <a href="comment.jsp?id=<%=applist.getId()%>" 
                                                   class="btn btn-success btn-action">
                                                    <i class="fas fa-comment-medical"></i> Prescribe
                                                </a>
                                            <% } else { %>
                                                <a href="#" class="btn btn-outline-secondary btn-action disabled">
                                                    <i class="fas fa-check"></i> Completed
                                                </a>
                                            <% } %>
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
        const rows = document.querySelectorAll('#appointmentTable tbody tr');
        
        rows.forEach(row => {
            const name = row.cells[0].textContent.toLowerCase();
            const diseases = row.cells[5].textContent.toLowerCase();
            const email = row.cells[4].textContent.toLowerCase();
            
            if(name.includes(searchText) || diseases.includes(searchText) || email.includes(searchText)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
    
    // Status filter
    document.getElementById('statusFilter').addEventListener('change', function() {
        filterTable();
    });
    
    // Gender filter
    document.getElementById('genderFilter').addEventListener('change', function() {
        filterTable();
    });
    
    function filterTable() {
        const statusValue = document.getElementById('statusFilter').value;
        const genderValue = document.getElementById('genderFilter').value;
        const rows = document.querySelectorAll('#appointmentTable tbody tr');
        
        rows.forEach(row => {
            const status = row.cells[6].textContent.trim();
            const gender = row.cells[1].textContent.trim();
            
            const statusMatch = statusValue === '' || status.includes(statusValue);
            const genderMatch = genderValue === '' || gender.includes(genderValue);
            
            if(statusMatch && genderMatch) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }
    </script>
</body>
</html>