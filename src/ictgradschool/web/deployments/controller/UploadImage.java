package ictgradschool.web.deployments.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.froala.editor.Image;
import com.google.gson.Gson;

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/upload_image")
@MultipartConfig
public class UploadImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImage() {
        super();
        System.out.println("constractor");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fileRoute = "/assets/images/";
        System.out.println("fileRoute");
        Map<Object, Object> responseData;
        System.out.println("map");
        try {
            responseData = Image.upload(request, fileRoute); // Use default
            System.out.println("responseDate"+responseData);
            // image
            // validation.
        } catch (Exception e) {
            e.printStackTrace();
            responseData = new HashMap<Object, Object>();
            responseData.put("error", e.toString());
        }
// Wait for 10 secs for image upload
        synchronized (responseData) {
            try
            {
                responseData.wait(6000);
                String jsonResponseData = new Gson().toJson(responseData);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonResponseData);
            }
            catch ( InterruptedException e )
            {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

}