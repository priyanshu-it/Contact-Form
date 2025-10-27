<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mail! Contact Form</title>
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/7069/7069924.png">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            flex-direction: column;
            width: 90%;
            max-width: 500px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: royalblue;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            color: #444;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            padding: 10px;
            border: 1px solid royalblue;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        button {
            padding: 12px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">

      <a class="linkbtn" href="adminLogin.jsp">My Record!</a>
        <h1>Welcome to My Mail! Contact Form</h1>
        <form action="loginServlet" method="POST">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter a Full Name" required>
            </div>

            <div class="form-group">
                <label for="email">Contact:</label>
                <input type="email" id="email" name="email" placeholder="Enter an Email ID" required>
            </div>

            <div class="form-group">
                <label for="attendance">Text Status:</label>
                <textarea id="attendance" name="attendance" placeholder="Enter a Text (ONLY 1000 WORDS)" required></textarea>
            </div>

            <button type="submit">Register</button>
        </form>

        <div class="footer">
            <p>&copy; 2025 Welcome to My Mail!</p>

        </div>
    </div>
</body>
</html>