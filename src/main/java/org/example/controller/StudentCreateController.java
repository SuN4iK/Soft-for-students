package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.db.DBManager;
import org.example.model.Student;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@WebServlet("/studentCreate")
public class StudentCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("studentCreate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String surname = req.getParameter("surname");
        String name_student = req.getParameter("name_student");
        String group_student = req.getParameter("group_student");
        String date_student = req.getParameter("date_student");

        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
        Date dateObj = null;
        try {
            dateObj = format.parse(date_student);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        Student student = new Student();
        student.setSurname(surname);
        student.setName_student(name_student);
        student.setGroup_student(group_student);
        student.setDate_student(new java.sql.Date(dateObj.getTime()));

        DBManager.save_student_to_db(student);
        resp.sendRedirect(req.getContextPath() + "/students");
    }
}
