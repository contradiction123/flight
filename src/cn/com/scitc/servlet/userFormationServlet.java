package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.dao.UserDao;
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
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        String sex = request.getParameter("user_sex");
        String id = request.getParameter("user_id");

        UserDao userDao = new UserDao();
        userDao.editUserById(name,email,sex,id);

        List<User> users=new Dao().findUser(name);

        if(users.size()>0){
            request.setAttribute("judge",1);
            request.setAttribute("users",users);
        }else {
            request.setAttribute("judge",0);
        }

//        response.sendRedirect("userFormation");
        request.getRequestDispatcher("/user_information.jsp").forward(request,response);
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
