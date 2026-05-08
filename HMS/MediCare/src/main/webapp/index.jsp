<%@page import="com.hms.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Home Page | Modern Healthcare Portal</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
:root {
    --primary-color: #2a7fba;
    --secondary-color: #1a5276;
    --accent-color: #e74c3c;
    --light-color: #f8f9fa;
    --dark-color: #343a40;
    --text-color: #495057;
}

body {
    font-family: 'Poppins', sans-serif;
    color: var(--text-color);
    line-height: 1.6;
}

.hero-section {
    background: linear-gradient(rgba(42, 127, 186, 0.8), rgba(26, 82, 118, 0.8)), 
                url('img/doctor_2.jpg');
    background-size: cover;
    background-position: center;
    height: 80vh;
    display: flex;
    align-items: center;
    color: white;
}

.hero-content {
    max-width: 600px;
}

.hero-content h1 {
    font-size: 3rem;
    font-weight: 700;
    margin-bottom: 1rem;
}

.hero-content p {
    font-size: 1.2rem;
    margin-bottom: 2rem;
}

.btn-custom {
    background-color: var(--accent-color);
    color: white;
    padding: 10px 25px;
    border-radius: 30px;
    font-weight: 600;
    transition: all 0.3s;
    border: none;
}

.btn-custom:hover {
    background-color: #c0392b;
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.feature-card {
    border: none;
    border-radius: 10px;
    overflow: hidden;
    transition: all 0.3s;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    height: 100%;
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.1);
}

.feature-card .card-body {
    padding: 30px;
}

.feature-icon {
    font-size: 2.5rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}

.section-title {
    position: relative;
    margin-bottom: 3rem;
    font-weight: 700;
    color: var(--secondary-color);
}

.section-title:after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background-color: var(--accent-color);
}

.team-card {
    border: none;
    border-radius: 10px;
    overflow: hidden;
    transition: all 0.3s;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
    margin-bottom: 30px;
}

.team-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.1);
}

.team-card img {
    border-radius: 10px 10px 0 0;
    width: 100%;
    height: 300px;
    object-fit: cover;
}

.team-card .card-body {
    text-align: center;
    padding: 20px;
}

.team-card h5 {
    font-weight: 600;
    color: var(--secondary-color);
}

.team-card p {
    color: var(--accent-color);
    font-size: 0.9rem;
}

.cta-section {
    background: linear-gradient(rgba(42, 127, 186, 0.9), rgba(26, 82, 118, 0.9));
    padding: 80px 0;
    color: white;
    text-align: center;
}

.cta-section h2 {
    font-weight: 700;
    margin-bottom: 20px;
}

.cta-section p {
    font-size: 1.2rem;
    margin-bottom: 30px;
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
}

.navbar {
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    padding: 15px 0;
    transition: all 0.3s;
}

.navbar.scrolled {
    padding: 10px 0;
    background-color: white !important;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

.navbar-brand {
    font-weight: 700;
    color: var(--primary-color) !important;
    font-size: 1.8rem;
}

.nav-link {
    font-weight: 500;
    padding: 8px 15px !important;
    color: var(--dark-color) !important;
}

.nav-link:hover {
    color: var(--primary-color) !important;
}

.navbar-toggler {
    border: none;
}

.navbar-toggler:focus {
    box-shadow: none;
}

@media (max-width: 768px) {
    .hero-section {
        height: 60vh;
        text-align: center;
    }
    
    .hero-content h1 {
        font-size: 2.5rem;
    }
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<!-- Hero Section -->
	<section class="hero-section">
	    <div class="container">
	        <div class="hero-content">
	            <h1>Advanced Healthcare Solutions</h1>
	            <p>Providing world-class medical care with cutting-edge technology and compassionate service.</p>
	            <a href="user_appointment.jsp" class="btn btn-custom">Book an Appointment</a>
	        </div>
	    </div>
	</section>

	<!-- Features Section -->
	<section class="py-5">
	    <div class="container">
	        <h2 class="text-center section-title">Why Choose Our Hospital</h2>
	        <div class="row g-4">
	            <div class="col-md-6 col-lg-3">
	                <div class="feature-card">
	                    <div class="card-body text-center">
	                        <div class="feature-icon">
	                            <i class="fas fa-user-md"></i>
	                        </div>
	                        <h5>Expert Doctors</h5>
	                        <p>Our team includes over 11,000 of the world's finest medical experts providing compassionate care.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-6 col-lg-3">
	                <div class="feature-card">
	                    <div class="card-body text-center">
	                        <div class="feature-icon">
	                            <i class="fas fa-microscope"></i>
	                        </div>
	                        <h5>Advanced Technology</h5>
	                        <p>Pioneers in bringing groundbreaking healthcare technologies to our patients.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-6 col-lg-3">
	                <div class="feature-card">
	                    <div class="card-body text-center">
	                        <div class="feature-icon">
	                            <i class="fas fa-heartbeat"></i>
	                        </div>
	                        <h5>Best Outcomes</h5>
	                        <p>Consistently delivering best-in-class clinical outcomes through expertise and technology.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-6 col-lg-3">
	                <div class="feature-card">
	                    <div class="card-body text-center">
	                        <div class="feature-icon">
	                            <i class="fas fa-pills"></i>
	                        </div>
	                        <h5>Pharmacy Network</h5>
	                        <p>Our trusted pharmacy network with over 500 outlets covering the entire nation.</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

	<!-- Our Team Section -->
	<section class="py-5 bg-light">
	    <div class="container">
	        <h2 class="text-center section-title">Meet Our Specialists</h2>
	        <div class="row">
	            <div class="col-md-6 col-lg-3">
	                <div class="team-card">
	                    <img src="img/doc1.jpg" alt="Dr. John">
	                    <div class="card-body">
	                        <h5>Dr. John</h5>
	                        <p>CEO & Chairman</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-6 col-lg-3">
	                <div class="team-card">
	                    <img src="img/doc2.jpg" alt="Dr. Brad">
	                    <div class="card-body">
	                        <h5>Dr. Brad</h5>
	                        <p>Chief Doctor</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-6 col-lg-3">
	                <div class="team-card">
	                    <img src="img/doc3.jpg" alt="Dr. Jennifer">
	                    <div class="card-body">
	                        <h5>Dr. Jennifer</h5>
	                        <p>Chief Doctor</p>
	                    </div>
	                </div>
	            </div>
	            <div class="col-md-6 col-lg-3">
	                <div class="team-card">
	                    <img src="img/doc4.jpg" alt="Dr. Maria">
	                    <div class="card-body">
	                        <h5>Dr. Maria</h5>
	                        <p>Dean</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

	<!-- CTA Section -->
	<section class="cta-section">
	    <div class="container">
	        <h2>Ready to Experience Exceptional Healthcare?</h2>
	        <p>Our team is here to provide you with personalized care using the latest medical technologies and treatments.</p>
	        <a href="contact.jsp" class="btn btn-light btn-lg">Contact Us Today</a>
	    </div>
	</section>

	<!-- Footer -->
	<%@include file="component/footer.jsp"%>

	<script>
	    // Navbar scroll effect
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 50) {
	            $('.navbar').addClass('scrolled');
	        } else {
	            $('.navbar').removeClass('scrolled');
	        }
	    });
	    
	    // Smooth scrolling for anchor links
	    $('a[href*="#"]').on('click', function(e) {
	        e.preventDefault();
	        
	        $('html, body').animate(
	            {
	                scrollTop: $($(this).attr('href')).offset().top,
	            },
	            500,
	            'linear'
	        );
	    });
	</script>
</body>
</html>