package ictgradschool.web.controller;

import com.alibaba.fastjson.JSONArray;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

public class UpdateAvatarFromLibServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONArray jArray = new JSONArray();

        String userId = req.getParameter("userid");
        String avatarFileName = req.getParameter("iconName");
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {


            UserDAO.updateUserAvatarById(Integer.parseInt(userId), avatarFileName, conn);

            PrintWriter out = resp.getWriter();
            out.print("success");

        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        if (avatarFileName!=null) {
        req.getSession().setAttribute("avatarFileNameBySession", avatarFileName);
        }
    }
}
