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
//get 是查看飞机座位数量和乘坐用户数量
//post 是一件换机代码
public class AdminFlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flight_1_number=request.getParameter("flight1");
        String flight_2_number=request.getParameter("flight2");
        System.out.println(flight_1_number);
        System.out.println(flight_2_number);

        System.out.println(new Dao().changePlanes(flight_1_number,flight_2_number));
        response.sendRedirect("admin");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao = new Dao();
        List<FlightModel> list = new ArrayList<>();
        list = dao.findAllFlightmodel();

        for (int i = 0; i<list.size();i++){
            List<Integer> integerList = dao.findAllFlight(list.get(i).getName());
            list.get(i).setZ(integerList.get(0));
            list.get(i).setR(integerList.get(1));
        }

        request.setAttribute("flight",list);
        request.getRequestDispatcher("/admin_flight.jsp").forward(request,response);
    }
}
