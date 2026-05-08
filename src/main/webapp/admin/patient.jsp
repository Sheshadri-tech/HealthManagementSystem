<%@page import="com.hms.entity.User"%>
<%@page import="com.hms.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.hms.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management | Admin</title>
    <%@include file="../component/allcss.jsp"%>
    <style>
        .user-header {
            background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        
        .user-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        
        .search-container {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .user-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .user-table thead th {
            background-color: #4568dc;
            color: white;
            padding: 15px;
            font-weight: 600;
            position: sticky;
            top: 0;
        }
        
        .user-table tbody tr {
            transition: all 0.3s;
        }
        
        .user-table tbody tr:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .user-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: middle;
        }
        
        .status-active {
            background-color: #d4edda;
            color: #155724;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .status-inactive {
            background-color: #f8d7da;
            color: #721c24;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: 500;
        }
        
        .table-container {
            max-height: 600px;
            overflow-y: auto;
        }
        
        .action-btn {
            border: none;
            background: transparent;
            padding: 5px;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            transition: all 0.3s;
        }
        
        .action-btn:hover {
            background-color: #e9ecef;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #4568dc;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
        
        @media (max-width: 768px) {
            .table-container {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    
    <!-- Header Section -->
    <div class="user-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 fw-bold mb-3">User Management</h1>
                    <p class="lead mb-0">View and manage all system users</p>
                </div>
                <div class="col-md-4 text-md-end">
                    <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addUserModal">
                        <i class="fas fa-user-plus me-2"></i> Add User
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- User Table -->
    <div class="container mb-5">
        <div class="user-card">
            <!-- Search Section -->
            <div class="search-container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="input-group">
                            <span class="input-group-text bg-white">
                                <i class="fas fa-search"></i>
                            </span>
                            <input type="text" class="form-control" id="searchInput" placeholder="Search users by name, email, or phone...">
                            <button class="btn btn-primary" type="button" id="searchButton">
                                Search
                            </button>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <label class="input-group-text bg-white" for="statusFilter">
                                <i class="fas fa-filter"></i>
                            </label>
                            <select class="form-select" id="statusFilter">
                                <option value="all" selected>All Statuses</option>
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card-body p-0">
                <div class="table-container">
                    <table class="user-table" id="userTable">
                        <thead>
                            <tr>
                                <th>User</th>
                                <th>Contact</th>
                                <th>Registration Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            UserDAO userDAO = new UserDAO(DBConnection.getConn());
                            List<User> userList = userDAO.getAllUsers();
                            for(User user : userList) {
                                String statusClass = user.getStatus().equalsIgnoreCase("active") 
                                    ? "status-active" : "status-inactive";
                                String initials = user.getFullName().substring(0, 1).toUpperCase();
                                if(user.getFullName().contains(" ")) {
                                    initials += user.getFullName().substring(
                                        user.getFullName().lastIndexOf(" ") + 1, 
                                        user.getFullName().lastIndexOf(" ") + 2
                                    ).toUpperCase();
                                }
                            %>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="user-avatar me-3">
                                            <%= initials %>
                                        </div>
                                        <div>
                                            <div class="fw-bold"><%= user.getFullName() %></div>
                                            <div class="text-muted small">ID: <%= user.getId() %></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div><i class="fas fa-envelope me-2 text-muted"></i><%= user.getEmail() %></div>
                                    <div><i class="fas fa-phone me-2 text-muted"></i><%= user.getPhone() != null ? user.getPhone() : "N/A" %></div>
                                </td>
                                <td><%= user.getRegDate() %></td>
                                <td>
                                    <span class="<%= statusClass %>">
                                        <i class="fas fa-circle me-1" style="font-size: 8px;"></i>
                                        <%= user.getStatus() %>
                                    </span>
                                </td>
                                <td>
                                    <button class="action-btn" title="View Details" onclick="viewUser(<%= user.getId() %>)">
                                        <i class="fas fa-eye text-primary"></i>
                                    </button>
                                    <button class="action-btn" title="Edit" onclick="editUser(<%= user.getId() %>)">
                                        <i class="fas fa-edit text-info"></i>
                                    </button>
                                    <button class="action-btn" title="Change Status" onclick="toggleStatus(<%= user.getId() %>)">
                                        <i class="fas fa-power-off text-<%= user.getStatus().equalsIgnoreCase("active") ? "success" : "danger" %>"></i>
                                    </button>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel">
                        <i class="fas fa-user-plus me-2"></i> Add New User
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="userForm">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" name="fullName" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Phone</label>
                                <input type="tel" class="form-control" name="phone">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="userActiveStatus" value="active" checked>
                                <label class="form-check-label" for="userActiveStatus">
                                    Active
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="userInactiveStatus" value="inactive">
                                <label class="form-check-label" for="userInactiveStatus">
                                    Inactive
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="saveUserBtn">
                        <i class="fas fa-save me-2"></i> Save User
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Edit User Modal (add this to your HTML) -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editUserModalLabel">
                    <i class="fas fa-user-edit me-2"></i> Edit User
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editUserForm">
                    <input type="hidden" id="editUserId" name="id">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="editFullName" name="editFullName" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" id="editEmail" name="email" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Phone</label>
                            <input type="tel" class="form-control" id="editPhone" name="phone">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Status</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="editActiveStatus" value="active">
                                <label class="form-check-label" for="editActiveStatus">
                                    Active
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="editInactiveStatus" value="inactive">
                                <label class="form-check-label" for="editInactiveStatus">
                                    Inactive
                                </label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="updateUserBtn">
                    <i class="fas fa-save me-2"></i> Update User
                </button>
            </div>
        </div>
    </div>
</div>

<script>
// Search functionality
document.getElementById('searchButton').addEventListener('click', function() {
    const searchText = document.getElementById('searchInput').value.toLowerCase();
    const rows = document.querySelectorAll('#userTable tbody tr');
    
    rows.forEach(row => {
        const name = row.cells[0].textContent.toLowerCase();
        const email = row.cells[1].textContent.toLowerCase();
        const phone = row.cells[2].textContent.toLowerCase();  // Fixed index from 1 to 2
        
        if(name.includes(searchText) || email.includes(searchText) || phone.includes(searchText)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
});

// Status filter
document.getElementById('statusFilter').addEventListener('change', function() {
    const filterValue = this.value;
    const rows = document.querySelectorAll('#userTable tbody tr');
    
    rows.forEach(row => {
        const status = row.cells[3].textContent.trim().toLowerCase();
        
        if(filterValue === 'all' || status.includes(filterValue)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
});

// Date formatting function
function formatDate(dateString) {
    if (!dateString) return 'N/A';
    const options = { year: 'numeric', month: 'short', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
}

// User action functions with AJAX implementation
function viewUser(id) {
    Swal.fire({
        title: 'Loading user details...',
        allowOutsideClick: false,
        didOpen: () => Swal.showLoading()
    });
    
    fetch(`../UserServlet?action=view&id=${id}`)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            Swal.fire({
                title: `User Details (ID: ${data.id})`,
                html: `
                    <div class="text-start">
                        <p><strong>Name:</strong> ${data.fullName || 'N/A'}</p>
                        <p><strong>Email:</strong> ${data.email || 'N/A'}</p>
                        <p><strong>Phone:</strong> ${data.phone || 'N/A'}</p>
                        <p><strong>Status:</strong> 
                            <span class="badge ${data.status == 'active' ? 'bg-success' : 'bg-danger'}">
                                ${data.status || 'N/A'}
                            </span>
                        </p>
                        <p><strong>Registered:</strong> ${data.regDate}</p>
                    </div>
                `,
                confirmButtonText: 'Close',
                customClass: { popup: 'rounded-lg' }
            });
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Failed to load user details: ' + error.message,
                confirmButtonText: 'OK'
            });
        });
}

function editUser(id) {
    fetch(`../UserServlet?action=get&id=${id}`)
        .then(response => {
            if (!response.ok) throw new Error('Failed to fetch user data');
            return response.json();
        })
        .then(user => {
            document.getElementById('editUserId').value = user.id;
            document.getElementById('editFullName').value = user.fullName || '';
            document.getElementById('editEmail').value = user.email || '';
            document.getElementById('editPhone').value = user.phone || '';
            
            if(user.status === 'active') {
                document.getElementById('editActiveStatus').checked = true;
            } else {
                document.getElementById('editInactiveStatus').checked = true;
            }
            
            new bootstrap.Modal(document.getElementById('editUserModal')).show();
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Failed to load user data: ' + error.message,
                confirmButtonText: 'OK'
            });
        });
}

function toggleStatus(id) {
    Swal.fire({
        title: 'Change User Status',
        text: 'Are you sure you want to change this user\'s status?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, change it!',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            fetch(`../UserServlet?action=toggleStatus&id=${id}`, { method: 'POST' })
                .then(response => {
                    if (!response.ok) throw new Error('Status change failed');
                    return response.text();
                })
                .then(() => {
                    Swal.fire('Success!', 'User status has been changed.', 'success')
                        .then(() => location.reload());
                })
                .catch(error => {
                    Swal.fire('Error!', 'Failed to change status: ' + error.message, 'error');
                });
        }
    });
}

// Save new user
document.getElementById('saveUserBtn').addEventListener('click', function() {
    const form = document.getElementById('userForm');
    const formData = new FormData(form);
    const saveBtn = this;
    
    saveBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Saving...';
    saveBtn.disabled = true;

    fetch('../UserServlet?action=add', { method: 'POST', body: formData })
        .then(response => {
            if (!response.ok) throw new Error('Failed to save user');
            return response.text();
        })
        .then(() => {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: 'User saved successfully!',
                confirmButtonText: 'OK'
            }).then(() => {
                $('#addUserModal').modal('hide');
                location.reload();
            });
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Failed to save user: ' + error.message,
                confirmButtonText: 'OK'
            });
        })
        .finally(() => {
            saveBtn.innerHTML = 'Save';
            saveBtn.disabled = false;
        });
});

// Save edited user
document.getElementById('updateUserBtn').addEventListener('click', function() {
    const form = document.getElementById('editUserForm');
    const formData = new FormData(form);
    const updateBtn = this;
    
    updateBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Updating...';
    updateBtn.disabled = true;

    fetch('../UserServlet?action=update', { method: 'POST', body: formData })
        .then(response => {
            if (!response.ok) throw new Error('Failed to update user');
            return response.text();
        })
        .then(() => {
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: 'User updated successfully!',
                confirmButtonText: 'OK'
            }).then(() => {
                $('#editUserModal').modal('hide');
                location.reload();
            });
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Failed to update user: ' + error.message,
                confirmButtonText: 'OK'
            });
        })
        .finally(() => {
            updateBtn.innerHTML = 'Update';
            updateBtn.disabled = false;
        });
});
</script>

</body>
</html>