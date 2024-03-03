package kz.bitlab.shop;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {

    protected static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/bitlab_shop",
                    "postgres",
                    "123");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
