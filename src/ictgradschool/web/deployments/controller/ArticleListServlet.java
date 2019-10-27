package ictgradschool.web.deployments.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.Article;
import ictgradschool.web.deployments.model.ArticleDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ArticleListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

            List<Article> articles = ArticleDAO.getAllArticles(conn);
            req.setAttribute("articles", articles);
            req.getRequestDispatcher("WEB-INF/view/article-list-view.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}