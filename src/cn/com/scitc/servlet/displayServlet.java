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

@WebServlet(name = "displayServlet",urlPatterns = "/display",asyncSupported = true)
public class displayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flight_number=request.getParameter("flight");

        FlightModel flightModel=new Dao().selectFloghtModel(flight_number);

        List<String> seatlist=new Dao().flightselect_seat(flight_number);

        List<Integer> satasfiactionlist=new Dao().satisfaction2(flight_number);

        request.setAttribute("flightmodel",flightModel);
        request.setAttribute("seatlist",seatlist);
        request.setAttribute("satasfiactionlist",satasfiactionlist);


        request.getRequestDispatcher("/admin_displayFlight.jsp").forward(request,response);
    }
}
