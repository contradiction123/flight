package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.model.B737_700;

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

        Dao dao=new Dao();
        List<String> select_seat=dao.flightselect_seat(flight_number);
        List<Integer> list = dao.satisfaction2(flight_number);

        request.setAttribute("select_seat",select_seat);
        request.setAttribute("list",list);
        String jsp="/allAllot"+flight_number+".jsp";


        request.getRequestDispatcher(jsp).forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flight_number=request.getParameter("flight_number");

        Dao dao=new Dao();
        List<String> select_seat=dao.flightselect_seat(flight_number);
        List<Integer> list = dao.satisfaction2(flight_number);

        request.setAttribute("select_seat",select_seat);
        request.setAttribute("list",list);
        String jsp="/allAllot"+flight_number+".jsp";


        request.getRequestDispatcher(jsp).forward(request,response);
    }

}
