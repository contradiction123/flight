package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userFormationServlet",urlPatterns = "/userFormation",asyncSupported = true)
public class userFormationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        List<User> users=new Dao().findUser(name);

        if(users.size()>0){
            request.setAttribute("judge",1);
            request.setAttribute("users",users);
        }else {
            request.setAttribute("judge",0);
        }


        request.getRequestDispatcher("/user_information.jsp").forward(request,response);
    }
}
