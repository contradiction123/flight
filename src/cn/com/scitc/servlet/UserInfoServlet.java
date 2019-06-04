package cn.com.scitc.servlet;

import cn.com.scitc.dao.UserDao;
import cn.com.scitc.model.User;
import cn.com.scitc.model.UserFlightSeat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserInfoServlet",urlPatterns = "/user_info")
public class UserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flight_number=request.getParameter("flight");

        Object user_id = request.getSession().getAttribute("user_id");
        UserDao userdao = new UserDao();
        UserFlightSeat userFlightSeat = userdao.findFlightByUser(user_id.toString(),flight_number);
        if (userFlightSeat.getTeam().equals("1")){
            request.getSession().setAttribute("flight_seat",userFlightSeat);
        }else {
            List<UserFlightSeat> list = userdao.findFlightByTeam(user_id.toString(),flight_number);
            request.getSession().setAttribute("flight_seat_list",list);
        }
        request.getSession().setAttribute("flight",flight_number);
        String jsp="/user_info_"+flight_number+".jsp";
//        request.getRequestDispatcher("/user_info_b737_700.jsp").forward(request,response);
        request.getRequestDispatcher(jsp).forward(request,response);
    }
}
