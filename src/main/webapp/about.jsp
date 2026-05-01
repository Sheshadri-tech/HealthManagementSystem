<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us | MediCare</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .about-hero {
            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
                        url('img/hospital1.jpg');
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .mission-card {
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s;
        }
        
        .stats-item {
            text-align: center;
            padding: 30px 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
        }
        
        .stats-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-color);
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="about-hero">
        <div class="container">
            <h1 class="display-4 fw-bold">About MediCare</h1>
            <p class="lead">Compassionate care. Advanced medicine. Trusted results.</p>
        </div>
    </section>
    
    <!-- About Content -->
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <h2 class="section-title mb-4">Our Story</h2>
                    <p class="lead">Founded in 2005, MediCare has grown from a small community hospital to a leading healthcare provider in the region.</p>
                    <p>Our journey began with a simple mission: to provide exceptional healthcare services to our community. Today, we serve over 100,000 patients annually with a team of 200+ dedicated healthcare professionals.</p>
                    <p>We continuously invest in advanced medical technology and staff training to ensure our patients receive the highest standard of care.</p>
                </div>
                <div class="col-lg-6">
                    <img src="img/aboutH.jpg" alt="MediCare Hospital" class="img-fluid rounded shadow">
                </div>
            </div>
        </div>
    </section>
    
    <!-- Mission Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="section-title text-center mb-5">Our Mission & Values</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="mission-card p-4 h-100 bg-white">
                        <h3><i class="fas fa-heartbeat text-primary me-2"></i> Patient-Centered Care</h3>
                        <p>We put our patients at the heart of everything we do, delivering personalized treatment plans and compassionate support.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="mission-card p-4 h-100 bg-white">
                        <h3><i class="fas fa-flask text-primary me-2"></i> Medical Excellence</h3>
                        <p>We maintain the highest standards of medical practice through continuous learning and adoption of evidence-based treatments.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="mission-card p-4 h-100 bg-white">
                        <h3><i class="fas fa-users text-primary me-2"></i> Community Focus</h3>
                        <p>We're committed to improving the health and wellbeing of our local community through outreach and education programs.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Stats Section -->
    <section class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="stats-item bg-white">
                        <div class="stats-number">200+</div>
                        <h5>Qualified Doctors</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-item bg-white">
                        <div class="stats-number">50+</div>
                        <h5>Medical Specialties</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-item bg-white">
                        <div class="stats-number">100K+</div>
                        <h5>Patients Annually</h5>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-item bg-white">
                        <div class="stats-number">24/7</div>
                        <h5>Emergency Services</h5>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="component/footer.jsp"%>
</body>
</html>