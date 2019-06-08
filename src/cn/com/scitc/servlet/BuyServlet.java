package cn.com.scitc.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "BuyServlet",urlPatterns = "/buy",asyncSupported = true)
public class BuyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String cfcity = request.getParameter("cfcity");
        String ddcity = request.getParameter("ddcity");
        Date time = Date.valueOf(request.getParameter("time"));
        String flight_number = request.getParameter("flight_number");
        request.setAttribute("cfcity",cfcity);
        request.setAttribute("ddcity",ddcity);
        request.setAttribute("time",time);
        request.setAttribute("flight_number",flight_number);

        request.getRequestDispatcher("/buy.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/buy.jsp").forward(request,response);
    }
}
