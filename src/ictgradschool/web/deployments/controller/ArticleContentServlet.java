package ictgradschool.web.deployments.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.Article;
import ictgradschool.web.deployments.model.ArticleDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ArticleContentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            String mid = req.getParameter("id");
            HttpSession session = req.getSession();
            session.setAttribute("articleId",mid);
            Article article = ArticleDAO.getArticleById(Integer.parseInt(mid), conn);
            req.setAttribute("article", article);
            req.getRequestDispatcher("WEB-INF/view/article-content-view.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
