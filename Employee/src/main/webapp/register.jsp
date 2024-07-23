<!DOCTYPE html>
<html>
<head>
    <title>Register New Employee</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Register New Employee</h1>
    <form action="registerServlet" method="post">
        <label>Username: </label><input type="text" name="username" required><br>
        <label>Password: </label><input type="password" name="password" required><br>
        <label>Role: </label>
        <select name="role">
            <option value="admin">Admin</option>
            <option value="associate">Associate</option>
        </select><br>
        <input type="submit" value="Register">
    </form>
    <a href="index.jsp">Back to Login</a>
</body>
</html>
