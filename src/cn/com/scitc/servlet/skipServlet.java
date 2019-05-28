package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "skipServlet",urlPatterns = "/skip")
public class skipServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String flight_number=request.getParameter("flight_number");

        System.out.println(flight_number+"**");

        List<String> select_seat=new Dao().flightselect_seat(flight_number);

        request.setAttribute("select_seat",select_seat);

        String jsp="/allAllot"+flight_number+".jsp";



        request.getRequestDispatcher(jsp).forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
