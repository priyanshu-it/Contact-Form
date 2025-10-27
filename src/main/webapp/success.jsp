<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/7069/7069924.png">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 400px;
            display: none;
        }

        h2 {
            color: royalblue;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 30px;
            font-size: 16px;
        }

        .linkbtn {
            display: inline-block;
            padding: 12px 25px;
            background-color: royalblue;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .linkbtn:hover {
            background-color: blue;
        }

        .spinner {
            border: 7px solid #f3f3f3;
            border-top: 6px solid royalblue;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        #loading {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #loading p {
            margin-top: 15px;
            color: #333;
        }
    </style>
</head>
<body>

    <!-- Loading Spinner -->
    <div id="loading">
        <div class="spinner"></div>
        <p>Processing your registration...</p>
    </div>

    <!-- Success Message -->
    <div class="container" id="container">
        <h2>Successful!</h2>
        <p>Thank you for registering your Mail.</p>
        <br>
        <a class="linkbtn" href="index.jsp">Go Back to Home</a>
    </div>

    <script>
        // Show success message after delay
        window.onload = function () {
            setTimeout(function () {
                document.getElementById("loading").style.display = "none";
                document.getElementById("container").style.display = "block";
            }, 3000); // 3 seconds delay
        };
    </script>

</body>
</html>

<%@ page import="java.sql.*, java.io.*" %>
<%
    String idToDelete = request.getParameter("id"); // Get the ID of the record to delete
    if (idToDelete != null) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String url = "jdbc:mysql://localhost:3306/my_attendance";
        String user = "root";
        String password = "1234";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
            String query = "DELETE FROM attendance WHERE id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(idToDelete)); // Set the ID to the prepared statement
            int result = pstmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                out.println("<p style='color:red; text-align: center;'>* Failed to delete record.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
