package ictgradschool.web.deployments.controller;

import ictgradschool.util.DBConnectionUtils;
import ictgradschool.web.deployments.model.ArticleDAO;
import ictgradschool.web.deployments.model.UserDAO;
import ictgradschool.web.deployments.model.UserInfoJavaBean;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


public class UpdateAccountInfoServlet extends HttpServlet{

    private File uploadsFolder; // The folder where article images should be uploaded
    private File tempFolder; // The temp folder required by the file-upload logic

    @Override
    public void init() throws ServletException {
        super.init();

        // Get the upload folder, ensure it exists.
        this.uploadsFolder = new File(getServletContext().getRealPath("/assets/images/avatars"));
        if (!uploadsFolder.exists()) {
            uploadsFolder.mkdirs();
        }
        // Create the temporary folder that the file-upload mechanism needs.
        this.tempFolder = new File(getServletContext().getRealPath("/WEB-INF/tempavatar"));
        if (!tempFolder.exists()) {
            tempFolder.mkdirs();
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserInfoJavaBean newAccountInfo = new UserInfoJavaBean();

        Integer userId = (Integer) request.getSession().getAttribute("UserIdBySession");

        if (userId != -1) {
            // Set up file upload mechanism
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setRepository(tempFolder);
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Somewhere to put the information
//            UserInfoJavaBean newAccountInfo = new UserInfoJavaBean();

            newAccountInfo.setUserid(userId);

            try {
                    List<FileItem> fileItems = upload.parseRequest(request);
                    for (FileItem fi : fileItems) {

                        switch (fi.getFieldName()){

                            case "fname":
                                newAccountInfo.setFname(fi.getString());
                                break;

                            case "lname":
                                newAccountInfo.setLname(fi.getString());
                                break;

                            case "email":
                                newAccountInfo.setEmailAddress(fi.getString());
                                break;

                            case "phonenum":
                                newAccountInfo.setPhoneNum(fi.getString());
                                break;

                            case "date":
                                newAccountInfo.setDob(fi.getString());
                                break;

                            case "country":
                                newAccountInfo.setCountry(fi.getString());
                                break;

                            case "description":
                                newAccountInfo.setDescription(fi.getString());
                                break;

                            case "avatar":
                                // Save the uploaded image, and set the article's image fileName from the form field
                                if (!fi.getName().isEmpty()){
                                    File avatarFile = new File(this.uploadsFolder, fi.getName());
                                    System.out.println(fi.getName());
                                    createThumbnail(avatarFile, this.uploadsFolder);

                                    newAccountInfo.setAvatarFileName(fi.getName());
                                    fi.write(avatarFile);
                                    break;
                                }else {
                                    newAccountInfo.setAvatarFileName(null);
                                    break;
                                }
                        }

                    }

                try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
                    System.out.println(newAccountInfo.getFname());
                    System.out.println(newAccountInfo.getCountry());
                    System.out.println(newAccountInfo.getAvatarFileName());
                    System.out.println(newAccountInfo.getCountry());
                    UserDAO.addUserInfo(newAccountInfo, conn);
                }


            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if (userId == -1){
            request.getRequestDispatcher("WEB-INF/view/userlogin.jsp").forward(request, response);
        }

//        response.sendRedirect("./user");
        request.setAttribute("newAccountInfo", newAccountInfo);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/view/user-interface.jsp");
        dispatcher.forward(request, response);
        request.getRequestDispatcher("WEB-INF/view/user-interface.jsp").forward(request, response);

//        newAccountInfo.setFname(request.getParameter("fname"));
//        newAccountInfo.setLname(request.getParameter("lname"));
//        newAccountInfo.setEmailAddress(request.getParameter("email"));
//        newAccountInfo.setPhoneNum(request.getParameter("phonenum"));
//        newAccountInfo.setDob(request.getParameter("date"));
//        newAccountInfo.setCountry(request.getParameter("country"));
//        newAccountInfo.setDescription(request.getParameter("description"));
//        newAccountInfo.setAvatarFileName(request.getParameter("avatar"));

//        HttpSession session = request.getSession(false);
//        Userid = (String)session.getAttribute("UserIdBySession");

//        try (Connection conn = DBConnectionUtils.getConnectionFromSrcFolder("connection.properties")) {
//            if (request.getSession().getAttribute("UserIdBySession") != null) {
//                System.out.println(userid);
//                newAccountInfo.setUserid(userid);
//                System.out.println(newAccountInfo.getFname());
//                System.out.println(request.getParameter("fname"));
////                UserDAO.addUserInfo(newAccountInfo,conn);
//
//                UserDAO.addUserInfo(newAccountInfo,conn);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        /**
//         * In this case, I have no need to show the result of sign-in, maybe it is not necessary to 'dispatch'... jump!
//         * **/
//        request.setAttribute("newAccountInfo", newAccountInfo);
//        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/view/user-interface.jsp");
//        dispatcher.forward(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/user-interface.jsp").forward(request, response);
    }

    private static File createThumbnail(File imageFile, File outputDirectory) throws IOException {
        BufferedImage img = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
        img.createGraphics().drawImage(ImageIO.read(imageFile).getScaledInstance(100, 100, Image.SCALE_SMOOTH), 0, 0, null);

        File thumbnailFile = new File(outputDirectory.getCanonicalPath() + File.separator + imageFile.getName());
        return thumbnailFile;
//        ImageIO.write(img, "jpg", thumbnailFile);
        //concurrency????
    }
}
