package ictgradschool.web.deployments.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.Article;
import ictgradschool.web.deployments.model.ArticleDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class DeleteArticleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
            String id = req.getParameter("id");
            int id_int = Integer.parseInt(id);
            ArticleDAO.deleteArticle(id_int,conn);
            resp.sendRedirect("./articles");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
