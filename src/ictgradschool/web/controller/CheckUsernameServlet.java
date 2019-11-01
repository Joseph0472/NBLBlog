package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckUsernameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

            // 0 set variable
            String userName = null;
            // 1 get param
            userName = req.getParameter("username");

            System.out.println(userName);
            // 2 check if existed by JDBC
            try (PreparedStatement st = conn.prepareStatement("SELECT count(*) FROM fp_userLogin WHERE username = ?")) {

                st.setString(1, userName);
                try (ResultSet rs = st.executeQuery()) {
                    rs.next();
                    int flag = rs.getInt("count(*)");
                    // 3 send true/false result to obj
//                    System.out.println("aaaa"+ flag);
                    PrintWriter out = resp.getWriter();
                    if (flag >= 1) {
                        out.print("*This username is already used");
                    } else {
                        out.print("*Congratulations! You can use this username");
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
