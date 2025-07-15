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



# 🩺 Health Logger – Full Stack Medical Analysis Project

This project tracks patients' vital signs (BP, SPO2), stores them in an Oracle database, and provides visual dashboards using Tableau.

---

## 💾 Oracle + Java Integration
- Oracle 21c XE as backend DB
- PL/SQL procedure `log_vitals`
- Java servlets call PL/SQL using JDBC `CallableStatement`

## 🧪 Python Analytics
- Merged vitals.csv and patient.csv
- Visualized SPO2 and BP trends
- Grouped data by diagnosis and age

## 📊 Tableau Dashboards
- **Vitals Over Time**: BP High/Low & SPO2 by patient
- **Diagnosis Summary**: Avg BP High & Avg SPO2 by diagnosis

🔗 [Published Dashboard](https://public.tableau.com/app/profile/praneetha.sarabu/viz/HealthLoggerDashboard/Dashboard1?publish=yes)

---

## 🛠️ Tech Stack
- Java, Servlets, JDBC
- Oracle 21c XE (SQL Developer & VSCode)
- Tableau Public
- Python (pandas, matplotlib)

---

## 💡 Features
- Add/view vitals per patient
- Automatic time tracking via SYSDATE
- Diagnosis filtering in visual dashboards

