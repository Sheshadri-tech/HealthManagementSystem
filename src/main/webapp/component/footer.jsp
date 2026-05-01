<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="footer mt-5" style="background: linear-gradient(135deg, #4568dc 0%, #2a7fba 100%); color: white;">
    <div class="container py-5">
        <div class="row g-4">
            <!-- Quick Links -->
            <div class="col-md-4">
                <h5 class="fw-bold mb-4">MediCare Portal</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="index.jsp" class="text-white text-decoration-none">Home</a></li>
                    <li class="mb-2"><a href="about.jsp" class="text-white text-decoration-none">About Us</a></li>
                    <li class="mb-2"><a href="services.jsp" class="text-white text-decoration-none">Services</a></li>
                    <li class="mb-2"><a href="contact.jsp" class="text-white text-decoration-none">Contact</a></li>
                </ul>
            </div>
            
            <!-- Contact Info -->
            <div class="col-md-4">
                <h5 class="fw-bold mb-4">Contact Us</h5>
                <ul class="list-unstyled">
                    <li class="mb-3 d-flex align-items-start">
                        <i class="fas fa-map-marker-alt me-3 mt-1"></i>
                        <span>123 Medical Drive, Health City, HC 12345</span>
                    </li>
                    <li class="mb-3 d-flex align-items-start">
                        <i class="fas fa-phone-alt me-3 mt-1"></i>
                        <span>+1 (555) 123-4567</span>
                    </li>
                    <li class="mb-3 d-flex align-items-start">
                        <i class="fas fa-envelope me-3 mt-1"></i>
                        <span>info@medicare-portal.com</span>
                    </li>
                </ul>
            </div>
            
            <!-- Social Media -->
            <div class="col-md-4">
                <h5 class="fw-bold mb-4">Connect With Us</h5>
                <div class="social-icons d-flex justify-content-start justify-content-md-start gap-3">
                    <a href="#" class="text-white rounded-circle d-flex align-items-center justify-content-center" 
                       style="width: 40px; height: 40px; background-color: rgba(255,255,255,0.2); transition: all 0.3s;">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="text-white rounded-circle d-flex align-items-center justify-content-center" 
                       style="width: 40px; height: 40px; background-color: rgba(255,255,255,0.2); transition: all 0.3s;">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="text-white rounded-circle d-flex align-items-center justify-content-center" 
                       style="width: 40px; height: 40px; background-color: rgba(255,255,255,0.2); transition: all 0.3s;">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="text-white rounded-circle d-flex align-items-center justify-content-center" 
                       style="width: 40px; height: 40px; background-color: rgba(255,255,255,0.2); transition: all 0.3s;">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
                
                <div class="mt-4">
                    <h6 class="fw-bold mb-3">Newsletter</h6>
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="Your email" 
                               style="border-radius: 30px 0 0 30px; border: none; height: 45px;">
                        <button class="btn btn-light" type="button" 
                                style="border-radius: 0 30px 30px 0; height: 45px;">
                            Subscribe
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Copyright -->
    <div class="text-center py-3" style="background-color: rgba(0, 0, 0, 0.15);">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center">
                <div class="mb-2 mb-md-0">
                    © 2025 MediCare Portal. All rights reserved.
                </div>
                <div>
                    Developed by <a href="https://ravikumarxworkz.github.io/" class="text-white fw-bold">Ravikumar</a>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
    .footer {
        font-family: 'Poppins', sans-serif;
    }
    
    .footer a:hover {
        color: #e1f5fe !important;
        text-decoration: underline !important;
    }
    
    .social-icons a:hover {
        background-color: rgba(255,255,255,0.3) !important;
        transform: translateY(-3px);
    }
    
    .footer .form-control:focus {
        box-shadow: none;
        border-color: #ced4da;
    }
    
    .footer .btn-light:hover {
        background-color: #f8f9fa;
    }
</style>