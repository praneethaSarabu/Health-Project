CREATE DATABASE health_logger;
USE health_logger;

CREATE TABLE doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);
