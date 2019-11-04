package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.Article;
import ictgradschool.web.model.ArticleDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/sort-article")


public class SortArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {

            String keyword = req.getParameter("keyword-sort");

            List<Article> articlesSorted = new ArrayList<>();
            List<Article> articlesBySearch = (List<Article>) req.getSession().getAttribute("articlesBySearch");
            System.out.println(articlesBySearch);

            if (keyword.equals("username")) {
                articlesSorted = ArticleDAO.sortArticleByUsername(articlesBySearch, conn);
            }
            else if (keyword.equals("title")) {
                articlesSorted = ArticleDAO.sortArticleByTitle(articlesBySearch, conn);
            }
            else  if (keyword.equals("time")){
                articlesSorted = ArticleDAO.sortArticleByTime(articlesBySearch, conn);
            }
            else {
                articlesSorted = ArticleDAO.sortArticleByUsername(articlesBySearch, conn);
            }

            req.setAttribute("articlesSorted", articlesSorted);


        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("WEB-INF/view/sort-result-view.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
