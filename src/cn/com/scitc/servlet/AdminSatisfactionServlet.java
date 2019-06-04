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

@WebServlet(name = "AdminSatisfactionServlet",urlPatterns = "/admin_satisfaction")
public class AdminSatisfactionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao = new Dao();
        List<FlightModel> flightModelList = dao.findAllFlightmodel();

        for (int i = 0; i<flightModelList.size(); i++){
            List<Integer> integerList = dao.satisfaction2(flightModelList.get(i).getName());
            int a = integerList.get(0);
            int b = integerList.get(1);
            int count = a+b;
            float t = (float) a/count;
            float f = (float) b/count;
            flightModelList.get(i).setT(t*100);
            flightModelList.get(i).setF(f*100);
            System.out.println(flightModelList.get(i).getT());
        }


        request.setAttribute("flight_name",flightModelList);
        request.getRequestDispatcher("/admin_Satisfaction.jsp").forward(request,response);
    }
}
