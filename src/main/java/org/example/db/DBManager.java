package org.example.db;

import org.example.model.Discipline;
import org.example.model.Mark;
import org.example.model.Student;
import org.example.model.Term;

import java.lang.reflect.InvocationTargetException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    static final String URL = "jdbc:postgresql://localhost:5432/myProject";
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

    public static boolean canLogin(String login, String password, int role) {
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
                String sql = "select users.id from users_role left join users on users_role.id = users.id where users.username = ? and users.password =? and users_role.id_role = ?;";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, login);
                preparedStatement.setString(2, password);
                preparedStatement.setInt(3, role);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    return true;
                }
                return false;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteStudent(Long id) {
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
                PreparedStatement preparedStatement = connection.prepareStatement("delete from student where id =?");
                preparedStatement.setString(1, String.valueOf(id));
                preparedStatement.executeUpdate();

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Student getStudentById(Long id) {
        Student student = new Student();
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            PreparedStatement preparedStatement = connection.prepareStatement("select * from student where id = ?");
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                student.setId(resultSet.getLong("id"));
                student.setSurname(resultSet.getString("surname"));
                student.setName_student(resultSet.getString("name_student"));
                student.setGroup_student(resultSet.getString("group_student"));
                student.setDate_student(resultSet.getDate("date_student"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
        return student;
    }

    public static List<Term> getAllTerms() {
        ArrayList<Term> terms = new ArrayList<>();
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from term");
            while (resultSet.next()) {
                Term term = new Term();
                term.setId(resultSet.getInt("id"));
                term.setTerm(resultSet.getString("term"));
                term.setDuration(resultSet.getInt("duration"));
                terms.add(term);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
        return terms;
    }

    public static Term getTermById(int id) {
        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            PreparedStatement preparedStatement = connection.prepareStatement("select * from term where id = ?");
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Term term = new Term();
                term.setId(resultSet.getInt("id"));
                term.setTerm(resultSet.getString("term"));
                term.setDuration(resultSet.getInt("duration"));
                return term;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public static List<Mark> getMarksByStudentAndTerm(int idStud, int idTerm) {
        ArrayList<Mark> marks = new ArrayList<>();

        try {
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

            PreparedStatement preparedStatement = connection.prepareStatement("select discipline.id, discipline.discipline, mark.mark from mark \n" +
                    "left join term_discipline on mark.id_term_discipline = term_discipline.id\n" +
                    "left join discipline on term_discipline.id_discipline = discipline.id\n" +
                    "where mark.id_student = ? and term_discipline.id_term = ?");
            preparedStatement.setInt(1, idStud);
            preparedStatement.setInt(2, idTerm);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Mark mark = new Mark();
                Discipline discipline = new Discipline();
                discipline.setId(resultSet.getInt("id"));
                discipline.setDiscipline(resultSet.getString("discipline"));
                mark.setDiscipline(discipline);
                mark.setMark(resultSet.getInt("mark"));
                marks.add(mark);

            }

            if (marks.size() == 0) {
                try {
                    preparedStatement = connection.prepareStatement("select * from term_discipline " +
                            "left join discipline on term_discipline.id_discipline = discipline.id\n" +
                            "where term_discipline.id_term = ?");
                    preparedStatement.setInt(1, idTerm);
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        Mark mark = new Mark();
                        Discipline discipline = new Discipline();
                        discipline.setDiscipline(resultSet.getString("discipline"));
                        mark.setDiscipline(discipline);
                        mark.setMark(-1);
                        marks.add(mark);
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        } return marks;
    }
}


