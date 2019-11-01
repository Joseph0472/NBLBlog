package ictgradschool.web.controller;

import com.alibaba.fastjson.JSONObject;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;



@WebServlet("/check")

public class checkServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String checkCode = request.getParameter("token");
        System.out.println("123");

        String check = "https://www.recaptcha.net/recaptcha/api/siteverify?secret" +
                "=6Lcqnr8UAAAAADdq0RnxJIoZhVuUaxlvp0Nbsf9g&response="+checkCode;
        String json = getHTML(check);
        JSONObject jsonObject = JSONObject.parseObject(json);
        // 获取到key为shoppingCartItemList的值
       String score = jsonObject.getString("score");
//       int score_int = Integer.parseInt(score);
        System.out.println(score);
        response.setContentType("text/plain");
        response.setContentLength(score.length());
        PrintWriter out = response.getWriter();
        out.println(score);
        out.close();
        out.flush();
        System.out.println(json);
//        JsonReader jsonReader = Json.createReader(new StringReader(json.toString()));
//        JsonObject jsonObject = jsonReader.readObject();
//        jsonReader.close();

//        return jsonObject.getBoolean("success");
    }
    public static String getHTML(String urlToRead) throws ServletException, IOException {
        StringBuilder result = new StringBuilder();
        URL url = new URL(urlToRead);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        while ((line = rd.readLine()) != null) {
            result.append(line);
        }
        rd.close();
        return result.toString();
    }

}
