package com.example;

import com.example.Task;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {
    private List<Task> tasks;

    @Override
    public void init() throws ServletException {
        // Initialize with some sample data
        tasks = new ArrayList<>();
        Calendar cal = Calendar.getInstance();

        cal.set(2022, Calendar.APRIL, 25, 10, 0);
        Date startTime1 = cal.getTime();
        cal.set(2022, Calendar.APRIL, 25, 11, 0);
        Date endTime1 = cal.getTime();
        tasks.add(new Task("John Doe", "Developer", "Project A", startTime1, endTime1, "Meeting", "Standup meeting with the team"));

        cal.set(2022, Calendar.APRIL, 25, 11, 0);
        Date startTime2 = cal.getTime();
        cal.set(2022, Calendar.APRIL, 25, 13, 0);
        Date endTime2 = cal.getTime();
        tasks.add(new Task("John Doe", "Developer", "Project A", startTime2, endTime2, "Training", "Hands-on training on Python"));

        // Add more sample tasks as needed
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String period = request.getParameter("period");

        Map<String, Integer> timeSpentMap = new HashMap<>();

        SimpleDateFormat dateFormat;
        if ("weekly".equals(period)) {
            dateFormat = new SimpleDateFormat("yyyy-'W'ww");
        } else {
            dateFormat = new SimpleDateFormat("yyyy-MM");
        }

        for (Task task : tasks) {
            String key = dateFormat.format(task.getTaskDate());

            int duration = (int) ((task.getEndTime().getTime() - task.getStartTime().getTime()) / (1000 * 60));
            timeSpentMap.put(key, timeSpentMap.getOrDefault(key, 0) + duration);
        }

        List<Map.Entry<String, Integer>> sortedEntries = timeSpentMap.entrySet()
                .stream()
                .sorted(Map.Entry.comparingByKey())
                .collect(Collectors.toList());

        Map<String, Integer> sortedTimeSpentMap = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> entry : sortedEntries) {
            sortedTimeSpentMap.put(entry.getKey(), entry.getValue());
        }

        request.setAttribute("timeSpentMap", sortedTimeSpentMap);
        request.setAttribute("period", period);
        request.getRequestDispatcher("report.jsp").forward(request, response);
    }
}
