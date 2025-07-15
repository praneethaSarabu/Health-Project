package com.health.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
    private static final String URL = "jdbc:oracle:thin:@localhost:1522:XE"; // Oracle default port
    private static final String USER = "system"; // use your Oracle username
    private static final String PASS = "newpassword123"; // replace with your real Oracle password

    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
