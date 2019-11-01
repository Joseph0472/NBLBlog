package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.Comment;
import ictgradschool.web.model.CommentDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class NewCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            String content = req.getParameter("content");

            HttpSession session = req.getSession();
//            session.setAttribute("commentContent", content);

//            A new Comment object constructed here with parameters from previous session
//            then insert into commentDAO to be displayed

            int articleId = (int)session.getAttribute("articleId");
            int userId = (int)session.getAttribute("UserIdBySession");
            int parentId = 0;
            int childNumber = 0;
            Comment newComment = new Comment(content, articleId, userId, parentId, childNumber);
            CommentDAO.insertComment(newComment, conn);

//            Article article = ArticleDAO.getArticleById(articleId, conn);
//            session.setAttribute("article", article);
//
            List<Comment> comments = CommentDAO.getCommentByArticleId(articleId, conn);
            session.setAttribute("comments", comments);
            req.setAttribute("comments", comments);

//            1. read req.param

//            2. JDBC to check if already existed

//            3. response to object

        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("WEB-INF/view/article-content-view.jsp").forward(req, resp);


    }
}
