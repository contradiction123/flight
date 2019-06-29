package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.model.FlightModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userdisplayServlet",urlPatterns = "/userdisplay")
public class userdisplayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String flight_number=request.getParameter("flight_number");
        String start_city=request.getParameter("ccity");
        String end_city=request.getParameter("dcity");
        String start_time=request.getParameter("time");


        FlightModel flightModel=new Dao().selectFloghtModel(flight_number);

        List<String> seatlist=new Dao().flightselect_seat(flight_number);

        List<Integer> satasfiactionlist=new Dao().satisfaction2(flight_number);

        request.setAttribute("flightmodel",flightModel);
        request.setAttribute("seatlist",seatlist);
        request.setAttribute("satasfiactionlist",satasfiactionlist);
        request.setAttribute("start_site",start_city);
        request.setAttribute("end_site",end_city);
        request.setAttribute("start_time",start_time);



        request.getRequestDispatcher("/buy_seat.jsp").forward(request,response);

//        System.out.println(flight_number+","+start_city+","+end_city+","+start_time);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String flight_number=request.getParameter("flight");

        String seat=request.getParameter("seat");
//        System.out.println(flight_number);
        FlightModel flightModel=new Dao().selectFloghtModel(flight_number);

        List<String> seatlist=new Dao().flightselect_seat(flight_number);

        List<Integer> satasfiactionlist=new Dao().satisfaction2(flight_number);

        request.setAttribute("flightmodel",flightModel);
        request.setAttribute("seatlist",seatlist);
        request.setAttribute("satasfiactionlist",satasfiactionlist);
        request.setAttribute("seat",seat);


        request.getRequestDispatcher("/user_display_flight.jsp").forward(request,response);
    }
}
