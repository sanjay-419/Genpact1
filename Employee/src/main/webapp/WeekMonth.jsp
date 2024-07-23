<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Weekly and Monthly</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Weekly and Monthly</h1>
    
    <!-- Form to select period, enter employee name, and view report -->
    <form action="report" method="get">
        <label for="employeeName">Employee Name:</label>
        <input type="text" id="employeeName" name="employeeName" required><br><br>

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br><br>

        <label for="period">Select Period:</label>
        <select name="period" id="period">
            <option value="weekly">Weekly</option>
            <option value="monthly">Monthly</option>
        </select><br><br>

        <button type="submit">View Report</button>
    </form>
    
    <!-- Existing admin dashboard details -->
    <!-- Add your existing admin dashboard content here -->
    
</body>
</html>
