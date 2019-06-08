package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "allotcourseServlet",urlPatterns = "/allotcourse",asyncSupported = true)
public class allotCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //首先接收前段发送过来的航班号
        String flight_number=request.getParameter("flight_number");
//        System.out.println(flight_number);
        Dao dao=new Dao();

        //获取返回过来的字符串
        String seat_satisfaction=dao.allotCourse(flight_number);
//        System.out.println(seat_satisfaction);

        //将字符串返回给界面
        response.getWriter().print(seat_satisfaction);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
