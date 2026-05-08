<%@page import="com.hms.db.DBConnection"%>
<%@page import="com.hms.dao.SpecialistDAO"%>
<%@page import="com.hms.entity.Specialist"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Specialist | MediCare</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        .edit-card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
        }
        
        .edit-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            color: white;
            border-radius: 10px 10px 0 0 !important;
        }
        
        .btn-update {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            border: none;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 500;
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid #ced4da;
        }
        
        .form-control:focus {
            border-color: #4568dc;
            box-shadow: 0 0 0 0.25rem rgba(69, 104, 220, 0.25);
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
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card edit-card">
                    <div class="card-header edit-header">
                        <h4 class="mb-0"><i class="fas fa-edit me-2"></i> Edit Specialist</h4>
                    </div>
                    <div class="card-body">
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        SpecialistDAO specialistDAO = new SpecialistDAO(DBConnection.getConn());
                        Specialist s = specialistDAO.getSpecialistById(id);
                        
                        if(s == null) {
                            response.sendRedirect("specialist.jsp");
                            return;
                        }
                        %>
                        
                        <form action="../updateSpecialist" method="post">
                            <input type="hidden" name="id" value="<%= s.getId() %>">
                            
                            <div class="mb-3">
                                <label class="form-label">Specialist Name</label>
                                <input type="text" name="specialistName" 
                                       class="form-control" 
                                       value="<%= s.getSpecialistName() %>" 
                                       required
                                       oninput="this.value = this.value.charAt(0).toUpperCase() + this.value.slice(1)">
                            </div>
                            
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-update">
                                    <i class="fas fa-save me-2"></i> Update Specialist
                                </button>
                                <a href="specialist.jsp" class="btn btn-outline-secondary ms-2">
                                    <i class="fas fa-times me-2"></i> Cancel
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>s