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
import java.util.Date;
import java.util.List;

@WebServlet("/search-article")

public class SearchArticleServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            String searchBy = req.getParameter("keyword");
            String time = req.getParameter("time");
            String keyword = req.getParameter("search");
            if (keyword != null) {
                keyword = "%" + keyword + "%";
            }

            List<Article> articlesBySearch = new ArrayList<>();

            System.out.println(searchBy + time + keyword);

            if (searchBy == null) {
                if (time == null) {
                    articlesBySearch = ArticleDAO.getArticlesByUsernameOrTitle(keyword, conn);
                } else {
                    articlesBySearch = ArticleDAO.getArticleByTime(time, conn);
                    System.out.println("searchby = null & time = xx-xx" + articlesBySearch);

                }
            }
            else {
                if (searchBy.equals("username")) {
                    articlesBySearch = ArticleDAO.getArticleByUsername(keyword, conn);
                } else if (searchBy.equals("title")) {
                    articlesBySearch = ArticleDAO.getArticleByTitle(keyword, conn);
                }
            }

//            if (time == null) {
//                    if (searchBy.equals("username")) {
//                        // time = null & searchby = username
//                        System.out.println(keyword);
//                        Integer userId = UserDAO.getUserIdByUserName(keyword, conn);
//                        articlesBySearch = ArticleDAO.getArticleByUser(userId, conn);
//                    } else if (searchBy.equals("title")) {
//                        // time = null & searchby = title
//                        articlesBySearch = ArticleDAO.getArticleByTitle(keyword, conn);
//                    }
//                }
//            }
//            if (time != null) {
//                if (searchBy == null) {
//                    // time = time & searchby = null
//                    articlesBySearch = ArticleDAO.getArticleByTime(time, conn);
//                }
//                if (searchBy.equals("username")) {
//                    // time = time & searchby = username
//                    articlesBySearch = ArticleDAO.getArticleByTimeAndUsername(time, keyword, conn);
//                }
//                if (searchBy.equals("title")) {
//                    articlesBySearch = ArticleDAO.getArticleByTimeAndTitle(time, keyword, conn);
//                }
//            }

            req.setAttribute("articlesBySearch", articlesBySearch);
            System.out.println(articlesBySearch);
            req.getSession().setAttribute("articlesBySearch", articlesBySearch);


            System.out.println(articlesBySearch);

//            if (date.equals("on")) {
//                articlesBySearch = ArticleDAO.getArticleByDate(keyword, conn);
//            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.getServletContext().getRequestDispatcher("/WEB-INF/view/search-result-view.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
