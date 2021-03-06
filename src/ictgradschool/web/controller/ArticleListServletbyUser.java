package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.Article;
import ictgradschool.web.model.ArticleDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ArticleListServletbyUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("UserIdBySession");
        if (userId != null) {
            try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

                List<Article> articlesByUser = ArticleDAO.getArticleByUser(userId, conn);
                req.setAttribute("articlesByUser", articlesByUser);


            } catch (SQLException e) {
                throw new ServletException(e);
            }
            req.getRequestDispatcher("WEB-INF/view/articlesByUser-list-view.jsp").forward(req, resp);
        }
        if (userId == null){
            req.getRequestDispatcher("WEB-INF/view/user-login.jsp").forward(req, resp);
        }
    }
}
