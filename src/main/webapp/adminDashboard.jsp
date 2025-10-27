<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.TableData" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
     <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/7069/7069924.png">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 10px;
        background-color: #eef2f7;
    }

    h2 {
      padding-left: 20px;
        color: #2c3e50;
        margin-bottom: 25px;
    }

    table {
        border-collapse: collapse;
        width: 100%;
        background-color: #ffffff;
        border-radius: 3px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

     th, td {
            padding: 10px 20px;
            border: 1.5px solid #34495e;
            text-align: left;
        }

    th {
        background-color: #34495e;
        color: #fff;
        font-weight: 600;
    }

    tr:hover {
        background-color: #f9f9f9;
    }

    tr:nth-child(even) {
        background-color: #f4f6f8;
    }

    .linkbtn {
        position: absolute;
        top: 15px;
        right: 20px;
        text-decoration: none;
        background-color: #2980b9;
        color: white;
        padding: 10px 15px;
        border-radius: 5px;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .linkbtn:hover {
        background-color: #1c5980;
        cursor: pointer;
    }

    input[type="submit"] {
        background-color: #e74c3c;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 13px;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #c0392b;
    }

    @media (max-width: 768px) {
        table, thead, tbody, th, td, tr {
            display: block;
        }

        table {
            box-shadow: none;
        }

        th {
            display: none;
        }

        tr {
            background: white;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 10px;
        }

        td {
            padding: 10px 15px;
            border: none;
            position: relative;
        }

        td::before {
            content: attr(data-label);
            position: absolute;
            left: 15px;
            top: 10px;
            font-weight: bold;
            color: #555;
            width: 40%;
        }
    }
</style>
</head>
<body>

<div class="linkbtn" onclick="window.location.href='adminLogin.jsp';"><b>LOG-OUT</b></div>

    <h2>Admin Dashboard - Data List</h2>
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Text</th>
        <th>Time/Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<TableData> tableData = (List<TableData>) request.getAttribute("tableData");
        if (tableData != null) {
            for (TableData data : tableData) {
    %>
        <tr>
            <td data-label="Id"><%= data.getId() %></td>
            <td data-label="Name"><%= data.getName() %></td>
            <td data-label="Email"><a href="mailto:<%= data.getEmail() %>?subject=My Mail!"><%= data.getEmail() %></a></td>
            <td data-label="Text"><%= data.getText() %></td>
            <td data-label="Time/Date"><%= data.getTimeDate() %></td>
            <td data-label="Action">
                <form action="success.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this entry?');">
                    <input type="hidden" name="id" value="<%= data.getId() %>">
                    <input type="submit" value="Delete" style="background-color: red; color: white; border: none; padding: 5px 10px; border-radius: 3px;">
                </form>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr><td colspan="6" style="text-align:center;">No data available.</td></tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
