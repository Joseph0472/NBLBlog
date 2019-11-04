package ictgradschool.web.controller;

import com.alibaba.fastjson.JSONObject;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.CommentDAO;
import ictgradschool.web.model.ParentComment;
import ictgradschool.web.model.ParentComment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet("/replyServlet")

public class replyServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       String p_comments_id = request.getParameter("p_comments_id");
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
                ParentComment parentComment = CommentDAO.getParentCommentById(Integer.parseInt(p_comments_id),conn);
                request.setAttribute("parentComment",parentComment);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/view/reply.jsp").forward(request, response);

    }



}
