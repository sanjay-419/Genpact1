<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Task Duration</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <h1>Employee Task Duration</h1>
    <canvas id="timeSpentChart"></canvas>
    <script>
        const labels = [];
        const data = [];
        <%
            // Explicitly cast the attribute to Map
            Map<String, Integer> timeSpentMap = (Map<String, Integer>) request.getAttribute("timeSpentMap");

            if (timeSpentMap != null) {
                for (Map.Entry<String, Integer> entry : timeSpentMap.entrySet()) {
                    String task = entry.getKey();
                    Integer hours = entry.getValue();
        %>
                labels.push("<%= task %>");
                data.push(<%= hours %>);
        <%
                }
            }
        %>

        const ctx = document.getElementById('timeSpentChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Task Duration (minutes)',
                    data: data,
                    backgroundColor: '#36A2EB'
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        beginAtZero: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html>