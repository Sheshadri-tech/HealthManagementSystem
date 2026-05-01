<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Services | MediCare</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .services-hero {
            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
                        url('img/hospital3.jpg');
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .service-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            height: 100%;
        }
        
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .service-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .department-tab {
            border: none;
            background: none;
            padding: 10px 20px;
            font-weight: 500;
            color: var(--text-color);
            transition: all 0.3s;
        }
        
        .department-tab.active {
            color: var(--primary-color);
            border-bottom: 3px solid var(--primary-color);
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="services-hero">
        <div class="container">
            <h1 class="display-4 fw-bold">Our Services</h1>
            <p class="lead">Comprehensive healthcare services for all your needs</p>
        </div>
    </section>
    
    <!-- Services Navigation -->
    <section class="py-4 bg-light">
        <div class="container">
            <div class="d-flex flex-wrap justify-content-center department-tabs">
                <button class="department-tab active" data-department="all">All Services</button>
                <button class="department-tab" data-department="cardiology">Cardiology</button>
                <button class="department-tab" data-department="neurology">Neurology</button>
                <button class="department-tab" data-department="orthopedics">Orthopedics</button>
                <button class="department-tab" data-department="pediatrics">Pediatrics</button>
                <button class="department-tab" data-department="surgery">Surgery</button>
            </div>
        </div>
    </section>
    
    <!-- Services Grid -->
    <section class="py-5">
        <div class="container">
            <h2 class="section-title text-center mb-5">Our Comprehensive Services</h2>
            <div class="row g-4 services-container">
                <!-- Service 1 -->
                <div class="col-md-6 col-lg-4" data-department="cardiology">
                    <div class="service-card">
                        <div class="card-body p-4">
                            <div class="service-icon">
                                <i class="fas fa-heartbeat"></i>
                            </div>
                            <h3>Cardiology</h3>
                            <p>Comprehensive heart care including diagnostic tests, interventions, and rehabilitation programs.</p>
                            <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <!-- Service 2 -->
                <div class="col-md-6 col-lg-4" data-department="neurology">
                    <div class="service-card">
                        <div class="card-body p-4">
                            <div class="service-icon">
                                <i class="fas fa-brain"></i>
                            </div>
                            <h3>Neurology</h3>
                            <p>Specialized care for disorders of the nervous system including stroke management.</p>
                            <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <!-- Service 3 -->
                <div class="col-md-6 col-lg-4" data-department="orthopedics">
                    <div class="service-card">
                        <div class="card-body p-4">
                            <div class="service-icon">
                                <i class="fas fa-bone"></i>
                            </div>
                            <h3>Orthopedics</h3>
                            <p>Treatment for musculoskeletal issues including joint replacements and sports medicine.</p>
                            <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <!-- Service 4 -->
                <div class="col-md-6 col-lg-4" data-department="pediatrics">
                    <div class="service-card">
                        <div class="card-body p-4">
                            <div class="service-icon">
                                <i class="fas fa-baby"></i>
                            </div>
                            <h3>Pediatrics</h3>
                            <p>Specialized healthcare for infants, children, and adolescents up to age 18.</p>
                            <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <!-- Service 5 -->
                <div class="col-md-6 col-lg-4" data-department="surgery">
                    <div class="service-card">
                        <div class="card-body p-4">
                            <div class="service-icon">
                                <i class="fas fa-procedures"></i>
                            </div>
                            <h3>Surgery</h3>
                            <p>Advanced surgical procedures including minimally invasive and robotic-assisted surgery.</p>
                            <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                        </div>
                    </div>
                </div>
                
                <!-- Service 6 -->
                <div class="col-md-6 col-lg-4" data-department="cardiology">
                    <div class="service-card">
                        <div class="card-body p-4">
                            <div class="service-icon">
                                <i class="fas fa-lungs"></i>
                            </div>
                            <h3>Pulmonology</h3>
                            <p>Diagnosis and treatment of respiratory system disorders including COPD and asthma.</p>
                            <a href="#" class="btn btn-outline-primary mt-3">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Emergency Services -->
    <section class="py-5 bg-primary text-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h2 class="mb-3">24/7 Emergency Services</h2>
                    <p class="lead mb-4">Our emergency department is staffed and equipped to handle any medical emergency at any time.</p>
                    <a href="tel:+15551234567" class="btn btn-light btn-lg me-3">
                        <i class="fas fa-phone me-2"></i> Call Emergency
                    </a>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <img src="img/emergency-icon.png" alt="Emergency Services" style="max-height: 150px;">
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="component/footer.jsp"%>
    
    <script>
        // Department filtering
        document.querySelectorAll('.department-tab').forEach(tab => {
            tab.addEventListener('click', function() {
                // Update active tab
                document.querySelectorAll('.department-tab').forEach(t => t.classList.remove('active'));
                this.classList.add('active');
                
                // Filter services
                const department = this.getAttribute('data-department');
                document.querySelectorAll('.services-container [data-department]').forEach(service => {
                    if (department === 'all' || service.getAttribute('data-department') === department) {
                        service.style.display = 'block';
                    } else {
                        service.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>