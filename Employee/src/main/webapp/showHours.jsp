<!DOCTYPE html>
<html>
<head>
    <title>Employee Hours</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .form-container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="text"], .form-container input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="form-container">
    <form action="showHours.jsp" method="post">
        <label for="employeeName">Employee Name:</label><br>
        <input type="text" id="employeeName" name="employeeName" required><br><br>
        
        <label for="date">Date:</label><br>
        <input type="date" id="date" name="date" required><br><br>
        
        <input type="submit" value="Show Hours">
    </form>
</div>

<br>
<a href="register.jsp">Employee Login</a>

</body>
</html>
