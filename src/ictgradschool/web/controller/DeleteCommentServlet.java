package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.ArticleDAO;
import ictgradschool.web.model.CommentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/deleteCommentServlet")

public class DeleteCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            String c_id = req.getParameter("c_comments_id");
            String p_id = req.getParameter("p_comments_id");
            if (c_id != null){
                int c_comments_id = Integer.parseInt(c_id);
                Integer articleId =
                        CommentDAO.getChildrenCommentById(c_comments_id,conn).getArticleId() ;
                CommentDAO.deleteChildrenComment(c_comments_id,conn);
                req.getSession().setAttribute("articleId", articleId);
                req.getRequestDispatcher("./after_delete").forward(req, resp);
            }
            if (p_id != null){
                int p_comments_id = Integer.parseInt(p_id);
                System.out.println("p_comments_id:"+p_comments_id);
                Integer articleId = CommentDAO.getParentCommentById(p_comments_id,conn).getArticleId() ;
                System.out.println("articleId:"+articleId);
                CommentDAO.deleteParentrenComment(p_comments_id,conn);
                req.getSession().setAttribute("articleId", articleId);
                req.getRequestDispatcher("./after_delete").forward(req, resp);
            }



        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
