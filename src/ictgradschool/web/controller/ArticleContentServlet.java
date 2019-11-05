package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
        Obtain the userId and articleId, if user have not log in, they should login first.
        */
        Integer userId = (Integer) req.getSession().getAttribute("UserIdBySession");
        System.out.println("userid:"+userId);
        String articleId_string = req.getParameter("articleId");
        Integer articleId = Integer.parseInt(articleId_string);
        System.out.println("articleId:"+articleId);
        req.setAttribute("articleId",articleId);
        /*
        Obtain the current time
        */
        Date current_date = new java.sql.Date(new java.util.Date().getTime());
        if (userId == null){
            req.getRequestDispatcher("WEB-INF/view/user-login.jsp").forward(req, resp);
        }


        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
        /*
        Obtain the parent comment content and save it in sql.
        */
            String content = req.getParameter("content");

                  /*
            get avatar by SHI 1104
             */
            String avatarFileName = UserDAO.getUserAvatarById(userId, conn);

            //add username bySHI
            String username = UserDAO.getUsernameById(userId, conn);
            ParentComment newComment = new ParentComment(content, articleId, userId, current_date, username, avatarFileName);
            CommentDAO.insertParentComment(newComment, conn);

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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("WEB-INF/view/article-content-view.jsp").forward(req, resp);
    }
}
