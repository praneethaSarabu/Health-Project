# 🩺 Health Logger – Full Stack Web + Data Analysis Project

A full-stack health monitoring web application that enables doctors to manage patients and record vital signs like BP and SPO2. It integrates Oracle PL/SQL procedures with Java and visualizes trends using Python and Tableau.

---

## 👩‍💻 Developed by
**Praneetha Sarabu**

---

## 🚀 Key Features

- 🔐 **Doctor Login** with session-based authentication
- 👨‍⚕️ **Patient Management**: Add, edit, delete patient records
- 📋 **Vitals Logging**: Record and view BP (high/low), SPO2
- 📊 **Vitals Graph**: Visualize vitals over time using Chart.js
- ⚠ **Abnormal Alerts**: Highlight vitals below safe threshold
- 📤 **Export to CSV** for analysis
- 📈 **Tableau Dashboards** for diagnosis trends and health summaries

---

## 🔧 Technologies Used

| Layer       | Technologies                                  |
|-------------|-----------------------------------------------|
| Frontend    | JSP, HTML, CSS, Chart.js                      |
| Backend     | Java (Servlets, JSP), JDBC                    |
| Database    | Oracle 21c XE (PL/SQL), MySQL (JDBC)          |
| Analytics   | Python (Pandas, Matplotlib, Seaborn)          |
| Dashboard   | Tableau Public                                |
| Server      | Apache Tomcat (v9)                            |
| IDE/Tools   | Eclipse IDE, VS Code, Git, GitHub             |

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
