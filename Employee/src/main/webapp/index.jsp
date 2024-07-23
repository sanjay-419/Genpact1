<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Login</h1>
    <form action="login" method="post">
        <label>Username: </label><input type="text" name="username" required><br>
        <label>Password: </label><input type="password" name="password" required><br>
        <label>Role: </label>
        <select name="role">
            <option value="admin">Admin</option>
            <option value="associate">Associate</option>
        </select><br>
        <input type="submit" value="Login">
    </form>
    <a href="EmployeeLogin.jsp">Employee Login</a>
    
     
    
</body>
</html>