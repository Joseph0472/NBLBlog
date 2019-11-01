package ictgradschool.web.controller;

import com.google.gson.Gson;
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

public class NewNestedCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            HttpSession session = req.getSession();

            String content = req.getParameter("content");
            int parentId =Integer.parseInt(req.getParameter("parentId"));
            int articleId = (int)session.getAttribute("articleId");
            int userId = (int)session.getAttribute("UserIdBySession");
            int childNumber = 0;

            Comment nestedComment = new Comment(content, articleId, userId, parentId, childNumber);
            CommentDAO.insertComment(nestedComment, conn);

//            Comment parentComment = CommentDAO.getCommentByCommentId(parentId, conn);
            CommentDAO.updateNestedCommentNumber(parentId, conn);

            List<Comment> updatedComments = CommentDAO.getNestedComment(parentId, conn);
            req.setAttribute("updatedComments", updatedComments);

//            Article article = ArticleDAO.getArticleById(articleId, conn);
//            req.getSession().setAttribute("article", article);

            Gson gson =new Gson();
            String cm = gson.toJson(updatedComments);
            System.out.println(cm);

            resp.getWriter().print(cm);

        } catch (SQLException e) {
            e.printStackTrace();
        }

//        req.getRequestDispatcher("WEB-INF/view/article-content-view.jsp").forward(req, resp);

    }

}
