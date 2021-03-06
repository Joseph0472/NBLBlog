package ictgradschool.web.controller;

import ictgradschool.util.AuthenticatorUtils;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.UserDAO;
import ictgradschool.web.model.UserJavaBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class CreateUserServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserJavaBean newAccount;

        String usernameServlet = request.getParameter("username");

        String passwordServlet = request.getParameter("password");

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

            newAccount = AuthenticatorUtils.createAccount(usernameServlet, passwordServlet);
            UserDAO.addUser(newAccount,conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        /**
         * In this case, I have no need to show the result of sign-in, maybe it is not necessary to 'dispatch'... jump!
         * ...
         * Still need to dispatch in order to jump to another page.
         * **/
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/view/user-login.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
