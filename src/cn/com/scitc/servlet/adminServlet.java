package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.dao.SystemTiemDao;
import cn.com.scitc.dao.UserDao;
import cn.com.scitc.model.FlightModel;
import cn.com.scitc.model.SystemTimeModel;
import cn.com.scitc.model.User;
import cn.com.scitc.thread.SystemTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "adminServlet", urlPatterns = "/admin")
public class adminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long s=System.currentTimeMillis();
        UserDao userDao = new UserDao();
        Dao dao = new Dao();

        List<FlightModel> flightModels = dao.findAllFlightmodel();
        List<User> users = userDao.findAllUser();
        long s1=System.currentTimeMillis();
        Integer time = Math.toIntExact(s1 - s);

        SystemTiemDao systemTiemDao = new SystemTiemDao();
        SystemTime systemTime=new SystemTime(time);
        systemTime.start();
        List<SystemTimeModel> systemTimeModelList = systemTiemDao.findAllSystemTime();

        request.setAttribute("user_size",users.size());
        request.setAttribute("flight_size",flightModels.size());
        request.setAttribute("time",systemTimeModelList);
        request.setAttribute("time1",systemTimeModelList.size());

        request.getRequestDispatcher("/admin.jsp").forward(request,response);


    }
}
