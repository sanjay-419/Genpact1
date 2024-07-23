package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewEmployeeTasks")
public class ViewEmployeeTasksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");

        if (employeeId == null || employeeId.isEmpty()) {
            response.sendRedirect("Select.jsp");
            return;
        }

        Map<String, Integer> timeSpentMap = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/companydb", "root", "admin");

            String sql = "SELECT task_category, TIMESTAMPDIFF(MINUTE, start_time, end_time) AS duration " +
                         "FROM Task WHERE employee_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(employeeId));
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String taskCategory = rs.getString("task_category");
                int duration = rs.getInt("duration");
                timeSpentMap.put(taskCategory, timeSpentMap.getOrDefault(taskCategory, 0) + duration);
            }

            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("timeSpentMap", timeSpentMap);
        request.getRequestDispatcher("TimeDuration.jsp").forward(request, response);
    }
}