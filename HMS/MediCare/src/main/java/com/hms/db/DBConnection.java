package com.hms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection conn;

    public static Connection getConn() {

        try {

            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String dbName = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName
                    + "?useSSL=true&requireSSL=true&serverTimezone=UTC";

            conn = DriverManager.getConnection(url, user, password);

            System.out.println("Database Connected Successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
