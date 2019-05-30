package cn.com.scitc.servlet;

import cn.com.scitc.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "clearFlightUserServlet",urlPatterns = "/clearflightuser")
public class clearFlightUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flight_number=request.getParameter("flight_number");
        System.out.println(flight_number);

        String s="";
        if(new UserDao().clearUser(flight_number)){
            s="true";
        }else {
            s="false";
        }

        response.getWriter().print(s);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
