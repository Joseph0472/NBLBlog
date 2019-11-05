package ictgradschool.web.controller;

import com.sun.deploy.net.HttpRequest;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
@WebServlet("/after_delete")
public class AfterDeleteComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            int articleId = (Integer)req.getSession().getAttribute("articleId");
            HttpSession session = req.getSession();
            session.setAttribute("articleId", articleId);

            Article article = ArticleDAO.getArticleById(articleId, conn);
            session.setAttribute("article", article);
            req.setAttribute("article", article);
        /*
        display the parent comment
        */
            List<ParentComment> p_comments = CommentDAO.getParentCommentByArticleId(articleId, conn);
            req.setAttribute("p_comments", p_comments);
        /*
        display the child comment
        */
            List<ChildrenComment> c_comments = CommentDAO.getChildCommentByArticleId(articleId, conn);
            req.setAttribute("c_comments",c_comments);

            req.getRequestDispatcher("WEB-INF/view/article-content-view.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
