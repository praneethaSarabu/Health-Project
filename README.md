# 🩺 Health Logger Web Application

A web-based patient health management system built using **Java**, **JSP**, **Servlets**, and **JDBC**, allowing doctors to record, view, and manage patient vitals.

---

## 👨‍💻 Developed By
**Praneetha Sarabu**

---

## 📌 Features

- 🔐 **Doctor Login**
- 👥 **Patient Management**: Add, update, delete patient records
- 📊 **Vitals Logging**: Record and view vitals like BP (low/high), SPO2
- 📈 **Vitals Graph**: Line charts for patient health monitoring using Chart.js
- ⚠ **Alerts**: View abnormal vitals
- 📄 **Export Vitals** as report
- ✅ Session-based authentication
- 💾 MySQL database integration

---

## 💻 Technologies Used

| Layer        | Technology              |
|--------------|--------------------------|
| Frontend     | JSP, HTML, CSS, Chart.js |
| Backend      | Java (Servlets, JSP)     |
| Database     | MySQL                    |
| Server       | Apache Tomcat            |
| IDE          | Eclipse IDE              |

---

## 🗂 Project Structure
health-logger/
├── src/ # Java source code (Model, DAO, Controllers)
│ ├── com.health.model
│ ├── com.health.dao
│ └── com.controller
├── WebContent/ # JSP pages and frontend
│ ├── login.jsp
│ ├── adminHome.jsp
│ └── patientForm.jsp ...
├── WEB-INF/
│ └── web.xml # Servlet configuration
├── db-schema.sql # MySQL database schema
├── README.md
