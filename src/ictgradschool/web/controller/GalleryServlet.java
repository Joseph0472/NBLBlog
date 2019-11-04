package ictgradschool.web.deployments.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/personal_gallery")
public class GalleryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("UserIdBySession");
        if (userId == null){
            req.getRequestDispatcher("WEB-INF/view/user-login.jsp").forward(req, resp);
        }
        /*obtain all images name by userId
         *
         */
        String persion_image_path = getServletContext().getRealPath("/assets/images/"+userId);
        System.out.println("path:"+persion_image_path);
        ArrayList<String> fileNameList = new ArrayList<>() ;
        File file = new File(persion_image_path);
        System.out.println(file.toPath());
        File[] tempList = file.listFiles();
        if (tempList != null){
        for (int i = 0; i<tempList.length; i++){
            if (tempList[i].isFile()){
                fileNameList.add(tempList[i].getName());
            }
        }}else {
            System.out.println("nothing in folder");
        }
        System.out.println("fileNameList:"+fileNameList);
        req.setAttribute("fileNameList",fileNameList);
        req.setAttribute("userId",userId);
        /*obtain all video name by userId
         *
         */
        String persion_video_path = getServletContext().getRealPath("/assets/video/"+userId);
        System.out.println("path:"+persion_video_path);
        ArrayList<String> videoNameList = new ArrayList<>() ;
        File video = new File(persion_video_path);
        System.out.println(video.toPath());
        File[] video_tempList = video.listFiles();
        if (video_tempList != null){
            for (int i = 0; i<video_tempList.length; i++){
                if (video_tempList[i].isFile()){
                    videoNameList.add(video_tempList[i].getName());
                }
            }}else {
            System.out.println("nothing in folder");
        }
        System.out.println("videoNameList:"+videoNameList);
        req.setAttribute("videoNameList",videoNameList);
        req.getRequestDispatcher("WEB-INF/view/media.jsp").forward(req, resp);
    }
}
