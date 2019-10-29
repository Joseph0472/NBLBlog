package ictgradschool.web.deployments.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;

/**
 * @author Zorro
 */
public class LogOffServlet extends HttpServlet {

//    public String tologoff(HttpServletRequest request){
//        Enumeration em = request.getSession().getAttributeNames();
//        while(em.hasMoreElements()){
//            request.getSession().removeAttribute(em.nextElement().toString());
//        }
//        return "login";
//    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();}
        request.getRequestDispatcher("WEB-INF/view/start-page.jsp").forward(request,response);
    }
}
