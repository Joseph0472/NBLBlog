package ictgradschool.web.deployments.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.Article;
import ictgradschool.web.deployments.model.ArticleDAO;
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
import java.sql.SQLException;
import java.util.List;

public class ChangeArticleServlet extends HttpServlet {

    private File uploadsFolder; // The folder where article images should be uploaded
    private File tempFolder; // The temp folder required by the file-upload logic
    private Article newArticle;


    /**
     * Initializes the uploadsFolder and tempFolder, and makes sure they exist.
     * <p>
     * Remember, in IntelliJ, when running locally, these folders will be somewhere in the "out" directory.
     * <p>
     * When deployed, they will be somewhere on the server, depending on the server's configuration.
     */

    @Override
    public void init() throws ServletException {
        super.init();

        // Get the upload folder, ensure it exists.
        this.uploadsFolder = new File(getServletContext().getRealPath("/assets/images"));
        if (!uploadsFolder.exists()) {
            uploadsFolder.mkdirs();
        }
        // Create the temporary folder that the file-upload mechanism needs.
        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/temp"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Set up file upload mechanism
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(tempFolder);
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Somewhere to put the information



        try {

            // Parse the form (works differently since we're expecting a file, amongst other form fields).
            List<FileItem> fileItems = upload.parseRequest(req);
            for (FileItem fi : fileItems){
                if (fi.getFieldName().equals("id")){
                    try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
                        newArticle = ArticleDAO.getArticleById(Integer.parseInt(fi.getString()), conn);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
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
                            newArticle.setImageFilename(newArticle.getImageFilename());
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
                System.out.println(newArticle.toString());
                ArticleDAO.updateArticle(newArticle, conn);
                //ArticleDAO.insertImage(newArticle, conn);
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }

        // Redirect to the main articles page.
        resp.sendRedirect("./articles");
    }
}
