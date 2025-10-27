<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mail! Records</title>
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/7069/7069924.png">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 440px;
            position: relative;
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: royalblue;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid royalblue;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            padding: 12px;
            background-color: royalblue;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .linkbtn {
            position: absolute;
            top: 15px;
            right: 20px;
            text-decoration: none;
            background-color: royalblue;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 14px;
        }

        .linkbtn:hover {
            background-color: blue;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
            font-size: 14px;
        }
    </style>
</head>
<body>

<form action="adminLogin" method="post">
    <a class="linkbtn" href="index.jsp">My Mail!</a>
    <br>
    <h1>Welcome to My Mail! Records</h1>

    <label for="username">UserName:</label>
    <input type="text" id="username" name="username" placeholder="Enter a User Name" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" placeholder="Enter a password" required>

    <button type="submit">LOGIN</button>

    <div class="footer">
        <p>&copy; 2025 Welcome to My Mail! Records</p>
    </div>
</form>

</body>
</html>