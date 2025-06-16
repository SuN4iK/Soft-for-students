package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.db.DBManager;

import java.io.IOException;

@WebServlet("/studentDelete")
public class SrudentDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idsToDelete = req.getParameter("hiddenIdsToDelete");

        if (idsToDelete != null) {
            String[] ids = idsToDelete.split(" ");
            for (String id : ids) {
                id = id.trim();
                if (!id.isEmpty() && id.matches("\\d+")) {
                    DBManager.deleteStudent(Long.valueOf(id));
                }
            }

        }
        resp.sendRedirect(req.getContextPath());
    }
}
