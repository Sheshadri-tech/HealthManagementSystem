<%@page import="com.hms.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.dao.UserDAO"%>
<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Patients | HMS</title>
<%@include file="../component/allcss.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary-color: #1976D2;
    --secondary-color: #0D47A1;
    --light-color: #f8f9fa;
}

.card {
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
}

.card-header {
    background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    color: white;
    padding: 1rem 1.5rem;
    border-bottom: none;
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

.table th {
    background-color: #f5f7fa;
    color: var(--secondary-color);
    font-weight: 600;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .search-input {
        max-width: 100%;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <c:if test="${empty doctorObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <div class="container-fluid p-4">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="fas fa-user-injured me-2"></i>My Patients</h4>
                        <div class="search-container">
                            <i class="fas fa-search"></i>
                            <input type="text" id="searchInput" class="form-control search-input" placeholder="Search patients...">
                        </div>
                    </div>
                    
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover" id="patientTable">
                                <thead class="thead-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Patient Name</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    Doctor doctor = (Doctor) session.getAttribute("doctorObj");
                                    UserDAO patientDAO = new UserDAO(DBConnection.getConn());
                                    List<User> uniquePatients = patientDAO.getUniquePatientsByDoctor(doctor.getId());
                                    
                                    for (User patient : uniquePatients) {
                                    %>
                                    <tr>
                                        <td><%=patient.getId()%></td>
                                        <td><%=patient.getFullName()%></td>
                                        <td><%=patient.getEmail()%></td>
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
        const rows = document.querySelectorAll('#patientTable tbody tr');
        
        rows.forEach(row => {
            const id = row.cells[0].textContent.toLowerCase();
            const name = row.cells[1].textContent.toLowerCase();
            const email = row.cells[2].textContent.toLowerCase();
            
            if (id.includes(searchText) || name.includes(searchText) || email.includes(searchText)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
    </script>
</body>
</html>