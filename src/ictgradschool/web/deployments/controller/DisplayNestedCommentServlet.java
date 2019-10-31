package ictgradschool.web.deployments.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.Article;
import ictgradschool.web.deployments.model.Comment;
import ictgradschool.web.deployments.model.CommentDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


public class DisplayNestedCommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            int parentId = Integer.parseInt(req.getParameter("parentId"));
            List<Comment> nestedComments = CommentDAO.getNestedComment(parentId, conn);
            req.setAttribute("nestedComments", nestedComments);

            Article article = (Article)req.getSession().getAttribute("article");
            req.setAttribute("article", article);
//
//            List<Comment> comments = (List)req.getSession().getAttribute("comments");
//            req.setAttribute("comments", comments);
//
//            Comment parentComment = CommentDAO.getCommentByCommentId(parentId, conn);
//            req.setAttribute("comment", parentComment);

            Gson gson =new Gson();
            String cm = gson.toJson(nestedComments);
            System.out.println(cm);

            resp.getWriter().print(cm);


        } catch (SQLException e) {
            e.printStackTrace();
        }

        //req.getRequestDispatcher("WEB-INF/view/nested-comment-view.jsp").forward(req, resp);

    }
}
