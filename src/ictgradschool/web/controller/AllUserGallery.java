package ictgradschool.web.deployments.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user_gallery")
public class AllUserGallery extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /*obtain all images name by userId
         *
         */
        String image_path = getServletContext().getRealPath("/assets/images/");

        ArrayList<String> fileNameList = new ArrayList<>() ;
        File file = new File(image_path);
        System.out.println(file.toPath());
        File[] tempList = file.listFiles();
        if (tempList != null){
        for (int i = 0; i<tempList.length; i++){
            if (tempList[i].isDirectory()){
                File[] list = tempList[i].listFiles();
                if (list != null){
                for (int j = 0 ; j< list.length; j++){
                    String name = tempList[i].getName() + "/"+list[j].getName();
                    System.out.println("name:"+name);
                    fileNameList.add(name);}
                }
            }
        }}else {
            System.out.println("nothing in folder");
        }
        System.out.println("fileNameList:"+fileNameList);
        req.setAttribute("fileNameList",fileNameList);

        /*obtain all video name by userId
         *
         */
        String video_path = getServletContext().getRealPath("/assets/video/");

        ArrayList<String> videoNameList = new ArrayList<>() ;
        File video = new File(video_path);
        System.out.println(video.toPath());
        File[] videoList = video.listFiles();
        if (videoList != null){
            for (int i = 0; i<videoList.length; i++){
                if (videoList[i].isDirectory()){
                    File[] list = videoList[i].listFiles();
                    if (list != null) {
                    for (int j = 0 ; j< list.length; j++){
                            String name = videoList[i].getName() + "/"+list[j].getName();
                            videoNameList.add(name);
                        System.out.println("name:"+name);
                        }
                    }
                }
            }}else {
            System.out.println("nothing in folder");
        }
        System.out.println("videoNameList:"+videoNameList);
        req.setAttribute("videoNameList",videoNameList);
        req.getRequestDispatcher("WEB-INF/view/user_media.jsp").forward(req, resp);
    }
}
