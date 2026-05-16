🏥 Health Management System

A full-stack Java-based web application designed to manage hospital operations efficiently.
This system provides functionalities for Admin, Doctor, and User modules including appointment booking, doctor management, patient management, and authentication.

🚀 Live Demo

🌐 Live Website:
https://healthmanagementsystem-eyhd.onrender.com

📌 Features
👨‍💼 Admin Module
Admin Login Authentication
Add / Update / Delete Doctors
View Registered Users
Manage Appointments
Dashboard Analytics
👨‍⚕️ Doctor Module
Doctor Login
View Patient Appointments
Update Appointment Status
Edit Doctor Profile
👤 User Module
User Registration & Login
Book Appointments
View Appointment History
Edit Profile
🛠️ Technologies Used
Backend
Java
JDBC
Servlet
JSP
Frontend
HTML
CSS
JavaScript
Bootstrap
Database
MySQL
Server & Deployment
Apache Tomcat
Docker
Render Cloud Hosting
Aiven Cloud MySQL
📂 Project Structure
MediCare/
│
├── src/main/java/com/hms/
│   ├── admin/
│   ├── dao/
│   ├── db/
│   ├── doctor/
│   ├── entity/
│   └── user/
│
├── src/main/webapp/
│   ├── admin/
│   ├── doctor/
│   ├── component/
│   ├── css/
│   ├── js/
│   └── images/
│
├── Dockerfile
├── pom.xml
└── MediCare.war
⚙️ Setup Instructions
1️⃣ Clone Repository
git clone https://github.com/Sheshadri-tech/HealthManagementSystem.git
2️⃣ Open Project
Open Eclipse IDE
Import as Maven Project
3️⃣ Configure Database

Create MySQL database and import SQL schema.

Update database connection in:

src/main/java/com/hms/db/DBConnection.java
4️⃣ Run Project
Configure Apache Tomcat Server
Deploy project on Tomcat
Open browser:
http://localhost:8080/
☁️ Cloud Deployment

This project is deployed using:

Render (Cloud Hosting)
Docker
Apache Tomcat
Aiven MySQL Cloud Database
🔐 Environment Variables

Used during cloud deployment:

DB_HOST
DB_PORT
DB_NAME
DB_USER
DB_PASSWORD
📸 Screenshots

Add project screenshots here.

🚀 Future Improvements
Email Notifications
Payment Integration
Online Video Consultation
Prescription Management
REST API Integration
Responsive UI Improvements
🤝 Contributing

Contributions are welcome!
Feel free to fork the repository and submit pull requests.

📄 License

This project is developed for educational and learning purposes.

👨‍💻 Author
Sheshadri B T

🔗 GitHub:
https://github.com/Sheshadri-tech

🌐 Live Project:
https://healthmanagementsystem-eyhd.onrender.com
