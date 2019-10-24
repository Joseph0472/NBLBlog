package ictgradschool.web.deployments.controller;

import ictgradschool.util.AuthenticatorUtils;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.UserDAO;
import ictgradschool.web.deployments.model.UserJavaBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class AuthenticatorServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserJavaBean UserLoginInfo = new UserJavaBean();
        UserJavaBean UserLoginPassed = new UserJavaBean();

        String usernameServlet = request.getParameter("username");
        UserLoginInfo.setUsername(request.getParameter("username"));

        String passwordServlet = request.getParameter("password");
        UserLoginInfo.setPassword(request.getParameter("password"));

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

            UserJavaBean user = UserDAO.getUserByUserName(usernameServlet, conn);

            if (AuthenticatorUtils.authenticate(user, passwordServlet)) {

                UserLoginPassed = UserDAO.getUserByUserName(usernameServlet,conn);

                //Session handling: keep the login status and you can get the session after users have logged in.
//              HttpSession session = request.getSession();
//              session.setAttribute("username" , usernameServlet);
                request.getSession().setAttribute("UserNameBySession", usernameServlet);
                request.getSession().setAttribute("UserIdBySession", UserDAO.getUserIdByUserName(usernameServlet,conn));
            } else {
                System.out.println("Fail.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.setAttribute("User", UserLoginPassed);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/view/login-result.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
