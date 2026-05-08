<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | MediCare</title>
    <%@include file="component/allcss.jsp"%>
    <style>
        .contact-hero {
            background: linear-gradient(rgba(69, 104, 220, 0.8), rgba(42, 127, 186, 0.8)), 
                        url('img/hospital-contact.jpg');
            background-size: cover;
            background-position: center;
            height: 400px;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .contact-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
            height: 100%;
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .contact-icon {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .contact-form .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            margin-bottom: 20px;
        }
        
        .contact-form .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(69, 104, 220, 0.25);
            border-color: var(--primary-color);
        }
        
        .map-container {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    
    <!-- Hero Section -->
    <section class="contact-hero">
        <div class="container">
            <h1 class="display-4 fw-bold">Contact Us</h1>
            <p class="lead">We're here to help and answer any questions you may have</p>
        </div>
    </section>
    
    <!-- Contact Info -->
    <section class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="contact-card p-4 text-center">
                        <div class="contact-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h3>Our Location</h3>
                        <p>123 Medical Drive<br>Health City, HC 12345</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-card p-4 text-center">
                        <div class="contact-icon">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <h3>Phone Numbers</h3>
                        <p>Main: (555) 123-4567<br>Emergency: (555) 987-6543</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-card p-4 text-center">
                        <div class="contact-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <h3>Email Us</h3>
                        <p>info@medicare-portal.com<br>support@medicare-portal.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Contact Form and Map -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="contact-card p-4 p-md-5">
                        <h2 class="mb-4">Send Us a Message</h2>
                        <form class="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Your Name" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" class="form-control" placeholder="Your Email" required>
                                </div>
                            </div>
                            <input type="text" class="form-control" placeholder="Subject">
                            <textarea class="form-control" rows="5" placeholder="Your Message" required></textarea>
                            <button type="submit" class="btn btn-primary w-100 py-3">Send Message</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="map-container h-100">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.215373510423!2d-73.9878449241644!3d40.74844097138968!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259a9b3117469%3A0xd134e199a405a163!2sEmpire%20State%20Building!5e0!3m2!1sen!2sus!4v1681234567890!5m2!1sen!2sus" 
                                width="100%" height="100%" style="border:0; min-height: 400px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Hours Section -->
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="text-center">
                        <h2 class="section-title mb-4">Our Hours</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <th>Monday - Friday</th>
                                        <td>8:00 AM - 8:00 PM</td>
                                    </tr>
                                    <tr>
                                        <th>Saturday</th>
                                        <td>9:00 AM - 5:00 PM</td>
                                    </tr>
                                    <tr>
                                        <th>Sunday</th>
                                        <td>9:00 AM - 3:00 PM</td>
                                    </tr>
                                    <tr class="table-primary">
                                        <th>Emergency</th>
                                        <td>24 Hours / 7 Days</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="component/footer.jsp"%>
</body>
</html>