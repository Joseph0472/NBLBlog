package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.ChildrenComment;
import ictgradschool.web.model.CommentDAO;
import ictgradschool.web.model.ParentComment;
import ictgradschool.web.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/new_child_comment")
/*
this class for storing comment to sql. when users click submit button, the info will be sent to this servlet.
* */
public class NewChildCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
        Obtain the userId and articleId, if user have not log in, they should login first.
        */
        Integer userId = (Integer) req.getSession().getAttribute("UserIdBySession");
        if (userId == null) {
            req.getRequestDispatcher("WEB-INF/view/user-login.jsp").forward(req, resp);
        }

        String p_comments_id = req.getParameter("parentCommentId");
        String content = req.getParameter("content");


        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            ParentComment parentComment = CommentDAO.getParentCommentById(Integer.parseInt(p_comments_id), conn);
            int articleId = parentComment.getArticleId();
            Date current_date = new Date(new java.util.Date().getTime());
            System.out.println(current_date);

            // add username into newComment by SHI
            String username = UserDAO.getUsernameById(userId, conn);
            ChildrenComment newComment = new ChildrenComment(content, articleId, userId, Integer.parseInt(p_comments_id),
                    current_date, username);
            CommentDAO.insertChildrenComment(newComment, conn);
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
            e.printStackTrace();
        }


    }
}
