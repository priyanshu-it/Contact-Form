package com.project.servlets;

import com.project.model.TableData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TableData> tableData = new ArrayList<>();

        String url = "jdbc:mysql://localhost:3306/my_attendance";
        String dbUser = "root";
        String dbPassword = "1234";

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, dbUser, dbPassword);
            stmt = con.createStatement();
            String query = "SELECT * FROM attendance";
            rs = stmt.executeQuery(query);

            while (rs.next()) {

                String name = rs.getString("name");
                String email = rs.getString("email");
                String attendance = rs.getString("attendance_status");
                String attendanceDate = rs.getString("attendance_date"); // Get attendance date
                int id = rs.getInt("id"); // Assuming there is an 'id' column as a unique identifier

                TableData data = new TableData();
                data.setName(name);
                data.setEmail(email);
                data.setText(attendance);
                data.setTimeDate(attendanceDate);
                data.setId(id);

                tableData.add(data);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        request.setAttribute("tableData", tableData);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);

    }
}
