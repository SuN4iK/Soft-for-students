package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.db.DBManager;
import org.example.model.Student;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentsController", urlPatterns = {"/students"})
public class StudentsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = DBManager.getAllStudents();
        req.setAttribute("students", students);
        req.getRequestDispatcher("/studentsList.jsp").forward(req,resp);
    }
}
