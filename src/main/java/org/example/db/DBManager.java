package org.example.db;

import org.example.model.Student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class DBManager {
    static final String URL = "jdbc:postgresql://localhost:5432/myProject";
    static final String USERNAME = "posgres";
    static final String PASSWORD = "pspKxavk2";

    public static List<Student> select() throws ClassNotFoundException {
        List<Student> products = new List<>();
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("Select * from student");
                while (resultSet.next()) {
                    Student student = new Student();
                    student.setId(resultSet.getLong("id"));
                    student.setId(resultSet.getString("id"));
                    student.setId(resultSet.getLong("id"));
                    student.setId(resultSet.getLong("id"));
                    student.setId(resultSet.getLong("id"));


                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return products;
    }

}
