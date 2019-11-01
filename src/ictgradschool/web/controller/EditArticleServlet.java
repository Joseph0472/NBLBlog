package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.Article;
import ictgradschool.web.model.ArticleDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class EditArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            String id = req.getParameter("id");
            System.out.println("content: "+id);
            int id_int = Integer.parseInt(id);
            Article article = ArticleDAO.getArticleById(id_int,conn);
            req.setAttribute("article", article);
            req.getRequestDispatcher("WEB-INF/view/edit-article-view.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }


}
