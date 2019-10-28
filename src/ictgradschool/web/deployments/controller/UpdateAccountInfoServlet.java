package ictgradschool.web.deployments.controller;

import ictgradschool.util.AuthenticatorUtils;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.UserDAO;
import ictgradschool.web.deployments.model.UserInfoJavaBean;
import ictgradschool.web.deployments.model.UserJavaBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class UpdateAccountInfoServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserInfoJavaBean newAccountInfo = new UserInfoJavaBean("","","","","","","","",1);

        String Userid = "1";
        newAccountInfo.setFname(request.getParameter("fname"));
        newAccountInfo.setLname(request.getParameter("lname"));
        newAccountInfo.setEmailAddress(request.getParameter("email"));
        newAccountInfo.setPhoneNum(request.getParameter("phonenum"));
        newAccountInfo.setDob(request.getParameter("date"));
        newAccountInfo.setCountry(request.getParameter("country"));
        newAccountInfo.setDescription(request.getParameter("description"));
        newAccountInfo.setAvatarFileName(request.getParameter("avatar"));

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            if (request.getAttribute("UserIdBySession") != null) {
                Userid = request.getAttribute("UserIdBySession").toString();
                newAccountInfo.setUserid(Integer.parseInt(Userid));
            }
            UserDAO.addUserInfo(newAccountInfo,conn);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        /**
         * In this case, I have no need to show the result of sign-in, maybe it is not necessary to 'dispatch'... jump!
         * **/
        request.setAttribute("newAccountInfo", newAccountInfo);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/view/user-interface.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
