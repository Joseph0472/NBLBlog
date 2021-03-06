package ictgradschool.web.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.model.Article;
import ictgradschool.web.model.ArticleDAO;
import ictgradschool.web.model.UserDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@MultipartConfig
public class NewArticleServlet extends HttpServlet {

    private File uploadsFolder; // The folder where article images should be uploaded
    private File tempFolder; // The temp folder required by the file-upload logic
    private Integer userId;

    /**
     * Initializes the uploadsFolder and tempFolder, and makes sure they exist.
     * <p>
     * Remember, in IntelliJ, when running locally, these folders will be somewhere in the "out" directory.
     * <p>
     * When deployed, they will be somewhere on the server, depending on the server's configuration.
     */


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/view/new-article-view.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userId = (Integer) req.getSession().getAttribute("UserIdBySession");
// Get the upload folder, ensure it exists.
        this.uploadsFolder = new File(getServletContext().getRealPath("/assets/images/"+userId));
        if (!uploadsFolder.exists()) {
            uploadsFolder.mkdirs();
        }
        // Create the temporary folder that the file-upload mechanism needs.
        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/temp"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
        // Set up file upload mechanism
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(tempFolder);
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Somewhere to put the information
        Article newArticle = new Article();

        System.out.println(userId);
        newArticle.setUserId(userId);

        try {

            // Parse the form (works differently since we're expecting a file, amongst other form fields).
            List<FileItem> fileItems = upload.parseRequest(req);
            for (FileItem fi : fileItems) {

                switch (fi.getFieldName()) {

                    case "title":
                        // Set the article's title from the form field
                        newArticle.setTitle(fi.getString());
                        break;

                    case "content":
                        // Set the article's content from the form field
                        newArticle.setContent(fi.getString());
                        break;

                    case "image":
                        // Save the uploaded image, and set the article's image fileName from the form field
                        if (!fi.getName().isEmpty()){
                        File imageFile = new File(this.uploadsFolder, fi.getName());
                        newArticle.setImageFilename(fi.getName());
                        fi.write(imageFile);
                        break;}else {
                            newArticle.setImageFilename(null);
                            break;
                        }

                    case "time":
                        String date = fi.getString();
                        newArticle.setDate(java.sql.Date.valueOf(date));
                        break;

                }
            }

            // Save the article to the DB.
            try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
                newArticle.setUsername(UserDAO.getUsernameById(userId, conn));
                ArticleDAO.insertArticle(newArticle, conn);
                //ArticleDAO.insertImage(newArticle, conn);
            }
            if (userId == null){
                req.getRequestDispatcher("WEB-INF/view/user-login.jsp").forward(req, resp);
            }
            // Redirect to the main articles page.
            resp.sendRedirect("./articles");
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }
}
