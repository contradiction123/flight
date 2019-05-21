package cn.com.scitc.servlet;

import cn.com.scitc.dao.UserDao;
import cn.com.scitc.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_email = request.getParameter("user_email");
        String user_psw = request.getParameter("password");
        UserDao dao = new UserDao();
        User user = dao.login(user_email);
        if (user_email.equals(user.getUser_email()) && user_psw.equals(user.getUser_psw())){
            System.out.println("yes!");
            //判断管理员
            if (user.getPermission().equals(1)){
                request.getRequestDispatcher("").forward(request,response);
            }
            //普通用户跳转
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }else {
            System.out.println("no!");
            request.getRequestDispatcher("/buy_ticket.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
}
