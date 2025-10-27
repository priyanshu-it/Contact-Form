package com.project.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Database connection details for login
        String url = "jdbc:mysql://localhost:3306/my_attendance";
        String dbUser = "root";
        String dbPassword = "pa123";

        // Getting form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();

        boolean isLoginSuccessful = false;

        if (username != null && password != null) {
            Connection connection = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                // Connect to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, dbUser, dbPassword);

                // SQL query to check if user exists with the provided credentials
                String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                ps = connection.prepareStatement(query);
                ps.setString(1, username);
                ps.setString(2, password);

                // Execute query
                rs = ps.executeQuery();

                if (rs.next()) {

                    response.sendRedirect("/adminDashboard");

                } else {
                    // Login failed
                    out.println("<script>alert('Incorrect username or password');</script>");
                    out.println("<script>document.getElementById('username').value = '';</script>");
                    out.println("<script>document.getElementById('password').value = '';</script>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (ps != null) ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}