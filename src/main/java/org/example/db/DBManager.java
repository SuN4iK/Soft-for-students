package org.example.db;

import org.example.model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    static final String URL = "jdbc:postgresql://localhost:5432/myFirstDb";
    static final String USERNAME = "postgres";
    static final String PASSWORD = "pspKxavk2";

    public static List<Student> getAllStudents() {
        ArrayList<Student> students = new ArrayList<>();
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("Select * from student");
                while (resultSet.next()) {
                    Student student = new Student();
                    student.setId(resultSet.getLong("id"));
                    student.setSurname(resultSet.getString("surname"));
                    student.setName_student(resultSet.getString("name_student"));
                    student.setGroup_student(resultSet.getString("group_student"));
                    student.setDate_student(resultSet.getDate("date_student"));
                    students.add(student);

                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return students;
    }

    public static void save_student_to_db(Student student) {
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
                PreparedStatement preparedStatement = connection.prepareStatement("insert into student (surname,name_student,group_student,date_student) values(?,?,?,?);");
                preparedStatement.setString(1, student.getSurname());
                preparedStatement.setString(2, student.getName_student());
                preparedStatement.setString(3, student.getGroup_student());
                preparedStatement.setTimestamp(4, new Timestamp(student.getDate_student().getTime()));
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public static boolean canLogin(String login, String password, int role){
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
                String sql = "select users.id from users_role left join users on users_role.id = users.id where users.username = ? and users.password =? and users_role.id_role = ?;";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, login);
                preparedStatement.setString(2, password);
                preparedStatement.setInt(3, role);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    return true;
                }
                return false;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
