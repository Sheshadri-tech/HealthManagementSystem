<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Specialists | MediCare</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        .specialist-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin-bottom: 20px;
            border: none;
        }
        
        .specialist-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        
        .specialist-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            color: white;
            border-radius: 10px 10px 0 0 !important;
            padding: 15px 20px;
        }
        
        .specialist-body {
            padding: 20px;
        }
        
        .btn-action {
            border-radius: 6px;
            padding: 8px 15px;
            font-weight: 500;
            margin-right: 10px;
        }
        
        .btn-edit {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
        }
        
        .btn-delete {
            background-color: #dc3545;
            border-color: #dc3545;
            color: white;
        }
        
        .btn-add {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            border: none;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 500;
        }
        
        .page-title {
            color: #2a3f6f;
            font-weight: 700;
            margin-bottom: 25px;
            position: relative;
        }
        
        .page-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 50px;
            height: 3px;
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
        }
        
        .alert-message {
            border-radius: 8px;
        }
        
        .no-specialists {
            text-align: center;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <!-- Session check -->
    <c:if test="${empty adminObj }">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <div class="container py-5">
        <!-- Messages -->
        <c:if test="${not empty successMsg}">
            <div class="alert alert-success alert-message text-center">
                <i class="fas fa-check-circle me-2"></i> ${successMsg}
                <c:remove var="successMsg" scope="session" />
            </div>
        </c:if>
        
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger alert-message text-center">
                <i class="fas fa-exclamation-circle me-2"></i> ${errorMsg}
                <c:remove var="errorMsg" scope="session" />
            </div>
        </c:if>
        
        <div class="row mb-4">
            <div class="col-md-6">
                <h2 class="page-title">Manage Specialists</h2>
            </div>
            <div class="col-md-6 text-md-end">
                <button class="btn btn-add" data-bs-toggle="modal" data-bs-target="#addSpecialistModal">
                    <i class="fas fa-plus me-2"></i> Add New Specialist
                </button>
            </div>
        </div>
        
        <div class="row">
            <%
            SpecialistDAO specialistDAO = new SpecialistDAO(DBConnection.getConn());
            List<Specialist> list = specialistDAO.getAllSpecialist();
            
            if(list.isEmpty()) {
            %>
                <div class="col-12">
                    <div class="no-specialists">
                        <i class="fas fa-stethoscope fa-3x mb-3 text-muted"></i>
                        <h4 class="text-muted">No Specialists Found</h4>
                        <p>Click the "Add New Specialist" button to create your first specialist</p>
                    </div>
                </div>
            <%
            } else {
                for (Specialist s : list) {
            %>
            <div class="col-md-4">
                <div class="card specialist-card">
                    <div class="card-header specialist-header">
                        <h5 class="card-title mb-0">
                            <i class="fas fa-stethoscope me-2"></i> <%= s.getSpecialistName() %>
                        </h5>
                    </div>
                    <div class="card-body specialist-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="badge bg-primary">ID: <%= s.getId() %></span>
                            <div>
                                <a href="edit_specialist.jsp?id=<%= s.getId() %>" class="btn btn-action btn-edit">
                                    <i class="fas fa-edit me-1"></i> Edit
                                </a>
                                <a href="../deleteSpecialist?id=<%= s.getId() %>" 
                                   class="btn btn-action btn-delete"
                                   onclick="return confirm('Are you sure you want to delete <%= s.getSpecialistName() %> specialist?')">
                                    <i class="fas fa-trash me-1"></i> Delete
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>

    <!-- Add Specialist Modal -->
    <div class="modal fade" id="addSpecialistModal" tabindex="-1" aria-labelledby="addSpecialistModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header specialist-header">
                    <h5 class="modal-title text-white" id="addSpecialistModalLabel">
                        <i class="fas fa-plus-circle me-2"></i> Add New Specialist
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../addSpecialist" method="post">
                        <div class="mb-3">
                            <label class="form-label">Specialist Name</label>
                            <input type="text" name="specialistName" 
                                   class="form-control" 
                                   placeholder="Enter specialist name" required
                                   oninput="this.value = this.value.charAt(0).toUpperCase() + this.value.slice(1)">
                        </div>
                        <div class="text-center mt-3">
                            <button type="submit" class="btn btn-add">
                                <i class="fas fa-save me-2"></i> Add Specialist
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>