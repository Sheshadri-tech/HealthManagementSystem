<!-- Modern Bootstrap 5.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">

<!-- Modern Font Awesome 6.4 (SVG + JS version) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" 
    integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Google Fonts - Poppins (modern sans-serif font) -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Bootstrap Bundle with Popper (latest) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
    crossorigin="anonymous"></script>

<!-- AOS Animation Library -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<style>
:root {
    --primary-color: #4568dc;
    --primary-dark: #3a5acf;
    --secondary-color: #2a7fba;
    --accent-color: #e74c3c;
    --light-color: #f8f9fa;
    --dark-color: #212529;
    --text-color: #495057;
    --gray-light: #e9ecef;
}

body {
    margin: 0;
    padding: 0;
    width: 100%;
    overflow-x: hidden;
    font-family: 'Poppins', sans-serif;
    color: var(--text-color);
    line-height: 1.6;
}

.my-bg-color {
    background-color: var(--primary-color) !important;
    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%) !important;
}

.myP-color {
    color: var(--primary-color) !important;
}

/* Modern buttons */
.btn-modern {
    background-color: var(--primary-color);
    color: white;
    border: none;
    padding: 0.6rem 1.5rem;
    border-radius: 50px;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 4px 15px rgba(69, 104, 220, 0.3);
}

.btn-modern:hover {
    background-color: var(--primary-dark);
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(69, 104, 220, 0.4);
}

/* Modern cards */
.card-modern {
    border: none;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 5px 15px rgba(0,0,0,0.05);
}

.card-modern:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.1);
}

/* Smooth scroll behavior */
html {
    scroll-behavior: smooth;
}

/* Modern form controls */
.form-control-modern {
    border-radius: 8px;
    padding: 0.75rem 1rem;
    border: 1px solid var(--gray-light);
    transition: all 0.3s;
}

.form-control-modern:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 0.25rem rgba(69, 104, 220, 0.25);
}

/* Responsive typography */
@media (min-width: 1200px) {
    html {
        font-size: 16px;
    }
}

@media (max-width: 1199.98px) {
    html {
        font-size: 15px;
    }
}

@media (max-width: 767.98px) {
    html {
        font-size: 14px;
    }
}
</style>

<script>
// Initialize AOS animation
document.addEventListener('DOMContentLoaded', function() {
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true
    });
});

// Navbar scroll effect
window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.classList.add('navbar-scrolled');
    } else {
        navbar.classList.remove('navbar-scrolled');
    }
});
</script>