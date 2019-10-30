package ictgradschool.web.deployments.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.Article;
import ictgradschool.web.deployments.model.ArticleDAO;
import ictgradschool.web.deployments.model.Comment;
import ictgradschool.web.deployments.model.CommentDAO;

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
            int articleId = Integer.parseInt(req.getParameter("id"));
            HttpSession session = req.getSession();
            session.setAttribute("articleId", articleId);
            Article article = ArticleDAO.getArticleById(articleId, conn);
            session.setAttribute("article", article);

            req.setAttribute("article", article);

            List<Comment> comments = CommentDAO.getCommentByArticleId(articleId, conn);
            session.setAttribute("comments", comments);
            req.setAttribute("comments", comments);

            req.getRequestDispatcher("WEB-INF/view/article-content-view.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
