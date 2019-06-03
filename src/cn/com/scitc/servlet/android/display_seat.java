package cn.com.scitc.servlet.android;

import cn.com.scitc.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "display_seat",urlPatterns = "/android/display_seat")
public class display_seat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search_name=request.getParameter("name");

        request.setAttribute("list",new Dao().searchName(search_name));
        request.getRequestDispatcher("../android_h5/display_seat.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
