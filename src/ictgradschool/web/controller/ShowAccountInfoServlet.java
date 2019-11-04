package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.UserDAO;
import ictgradschool.web.model.UserInfoJavaBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class ShowAccountInfoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("id"));
        UserInfoJavaBean userinfo = new UserInfoJavaBean();

        System.out.println("show user info get request sent. User id: "+userId);
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

            userinfo = UserDAO.getUserInfoById(userId, conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("UserInfo", userinfo);
        req.getRequestDispatcher("WEB-INF/view/user-interface.jsp").forward(req, resp);
    }
}
