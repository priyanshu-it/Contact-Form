package com.project.servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String attendance = request.getParameter("attendance");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String url = "jdbc:mysql://localhost:3306/my_attendance"; // Your MySQL database URL
        String user = "root"; // MySQL username
        String password = "pa123"; // MySQL password

        try {
            // Establishing database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            // SQL query to check if the email already exists
            String checkQuery = "SELECT * FROM attendance WHERE email = ?";
            ps = con.prepareStatement(checkQuery);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Email exists, show an error message
                out.println("<p style='color:red; text-align: center;'>* The email " + email + " is already registered.</p>");
            } else {
                // Email does not exist, proceed with inserting the data
                String query = "INSERT INTO attendance(name, email, attendance_status) VALUES(?, ?, ?)";
                ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, attendance);

                int result = ps.executeUpdate();

                if (result > 0) {
                    // Redirect to success.jsp after successful registration
                    response.sendRedirect("success.jsp");
                } else {
                    out.println("<p style='color:red; text-align: center;'>Registration failed. Please try again.</p>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}