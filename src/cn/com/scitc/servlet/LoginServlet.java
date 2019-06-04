package cn.com.scitc.servlet;

import cn.com.scitc.dao.SystemTiemDao;
import cn.com.scitc.dao.UserDao;
import cn.com.scitc.model.User;
import cn.com.scitc.thread.SystemTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String user_email = request.getParameter("user_email");
        String user_psw = request.getParameter("password");
        UserDao dao = new UserDao();
        User user = dao.login(user_email);

        if (user_email.equals(user.getUser_email()) && user_psw.equals(user.getUser_psw())){
            //判断管理员
            if (user.getPermission().equals(1)){
                request.getSession().setAttribute("error","");
                //传输用户信息到cooking
                request.getSession().setAttribute("msg",user);
                //重定向页面
                response.sendRedirect("admin");

                return;
            }else {
                //普通用户跳转
                request.getSession().setAttribute("msg",user);
                request.getSession().setAttribute("user_id",user.getUser_id());
                response.sendRedirect("home");
                return;
            }
        }else {
            request.getSession().setAttribute("error","用户名或密码错误!");
            response.sendRedirect("home");
            return;
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }
}
