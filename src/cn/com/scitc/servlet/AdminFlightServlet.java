package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.model.FlightModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminFlightServlet",urlPatterns = "/admin_flight")
public class AdminFlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Dao dao = new Dao();
        List<FlightModel> list = new ArrayList<>();
        list = dao.findAllFlightmodel();
        request.setAttribute("flight",list);
        request.getRequestDispatcher("/admin_flight.jsp").forward(request,response);
    }
}
