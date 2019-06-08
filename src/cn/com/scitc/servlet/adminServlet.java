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

@WebServlet(name = "adminServlet", urlPatterns = "/admin",asyncSupported = true)
public class adminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //判断是否非法访问
        if(request.getSession().getAttribute("msg") == null){
            request.getSession().setAttribute("error","请先登录!");
            response.sendRedirect("login");
            return;
        }
        long s=System.currentTimeMillis();
        UserDao userDao = new UserDao();
        Dao dao = new Dao();
        SystemTiemDao systemTiemDao = new SystemTiemDao();
        List<SystemTimeModel> systemTimeModelList = systemTiemDao.findAllSystemTime();
        List<FlightModel> flightModels = dao.findAllFlightmodel();
        List<User> users = userDao.findAllUser();
        long s1=System.currentTimeMillis();
        Integer time = Math.toIntExact(s1 - s);
        SystemTime systemTime=new SystemTime(time);
        systemTime.start();
        int good = 0;
        int well = 0;
        int bad = 0;

        for (int i = 0; i<systemTimeModelList.size();i++){
            if (systemTimeModelList.get(i).getTime() <= 5000){
                good++;
            }else if (systemTimeModelList.get(i).getTime() <= 8000){
                well++;
            }else {
                bad++;
            }
        }
        int count = good+well+bad;
        float goodf = (float) good/count;
        float wellf = (float)well/count;
        float badf = (float)bad/count;

        request.setAttribute("user_size",users.size());
        request.setAttribute("flight_size",flightModels.size());
        request.setAttribute("time",systemTimeModelList);
        request.setAttribute("time1",systemTimeModelList.size());
        request.setAttribute("good",goodf*100);
        request.setAttribute("well",wellf*100);
        request.setAttribute("bad",badf*100);
        request.getRequestDispatcher("/admin.jsp").forward(request,response);


    }
}
