<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Employee</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Admin Dashboard</h1>
    <form action="viewEmployeeTasks" method="post">
        <label for="employee">Select Employee:</label>
        <select id="employee" name="employeeId" required>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/companydb", "root", "admin");
                    String sql = "SELECT id, username FROM Employee";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
            %>
                        <option value="<%= id %>"><%= username %></option>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
        <button type="submit">View Tasks</button>
    </form>
</body>
</html>